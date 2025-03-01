#!/bin/bash
# Shell script modular install software dependency

# ------------------------------------------------ #
# vars 

OS_UPDATER_PATH="$( cd "$(dirname "${BASH_SOURCE[0]})" && pwd )"
APP_NAME="OS-app"
APP_BUNDLE_NAME="OS-app"

APP_BUNDLE_CONTENTS_DIR="Contents"
APP_DEFAULT_PATH="/Applications/${APP_BUNDLE_NAME}"
UPDATE_WORK_PATH="${OS_UPDATER_PATH}"

APP_PATH="${APP_DEFAULT_PATH}/Contents/OS/app"
BACKUP_PATH=$(mktemp -d)
DATA_PATH="$( cd "${UPDATE_WORK_PATH}/.." && pwd )"

UPDATE_LOG_FILENAME="update.log"
UPDATE_ERROR_FILENAME="update.error.log"
DEFAULT_UPDATE_LOG_PATH="${DATA_PATH}/Logs"

MIN_SUPPORTED_OS_VERSION=5.3

LSREGISTER_SERVICE="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"

# ------------------------------------------------ #
# common function
write_log() {
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@"
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@" >> "${UPDATE_LOG_PATH}"
}

block_app() {
    write_log "block OS-app from running"
    chmod -x "${APP_PATH}"
}

unblock_app() {
    write_log "unblock OS-app"
    chmod +x "${APP_PATH}"
}

write_error_log() {
    ERROR_DETAILS="$@"
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@"
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@" >> "${UPDATE_ERROR_FILE}"
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@" >> "${UPDATE_LOG_PATH}"
}

Exit() {
    local _exit_code="${1}"

    if [ "${_exit_code}" -eq 0 ]; then
        write_log "update completed with exit code ${_exit_code}"
    else
        write_error_log "update has not been completed, exit code ${_exit_code}"
    fi

    exit ${_exit_code}
}

create_dir_if_need() {
    if [ ! -d "${1}" ]; then
        write_log "creating dir ${1} ..."
        mkdir -p "${1}"
    fi
}

# ===================================================================
# functions for initialize data section

# app_data array was declared after parse of the command line arguments as a overarching-scope var
normalize_app_data() {
    local _app_pid="${app_data[0]}"
    local _app_install_path="${app_data[1]}"
    
    local _normalized_app_install_path="${APP_DEFAULT_PATH}"

    if [ ! -z "${_app_pid}" ]; then
        proc_id_list="${_app_pid}"
    else
        proc_id_list=$(ps -xf | grep "${APP_NAME}" | awk '{print $2}')
    fi

    if [ -z "${proc_id_list}" ]; then
        if [ ! -z "${_app_install_path}" ]; then
            _normalized_app_install_path="${_app_install_path}"
        fi

        app_data[0]=0
        app_data[1]="${_normalized_app_install_path}"
        return
    fi

    for proc_id in "${proc_id_list}"; do
        local command=$(ps -o command= -p "${proc_id}")

        if [ ! -z "${_app_install_path}" ]; then
            _normalized_app_install_path="${_app_install_path}"
        fi

        if [[ "${command}" =~ "${_normalized_app_install_path}" ]]; then
            app_data[0]=${proc_id}
            app_data[1]="${_normalized_app_install_path}"
        fi
    done

    if [ -z "${app_data}" ]; then
        app_data[0]=0
        app_data[1]="${_normalized_app_install_path}"
    fi
}

# ===================================================================
# functions for update section

pause() {
    local _sleep_time="${1}"

    write_log "sleep ${_sleep_time} sec"
    sleep "${_sleep_time}"
}

delete_later() {
    local _next_target="${1}"

    TARGETS_TO_REMOVE[${#TARGETS_TO_REMOVE[@]}]="${_next_target}"
}

cleanup_all() {
    for path in "${TARGETS_TO_REMOVE[@]}"
    do
        write_log "removing '${path}'"
        rm -rf "${path}"
    done
}

move_to() {
    local _source_path="${1}"
    local _destination_path="${2}"

    write_log "move ${_source_path} to ${_destination_path}"
    mv "${_source_path}" "${_destination_path}"
    return $?
}

restore_backup() {
    local _app_contents_path="${1}/${APP_BUNDLE_CONTENTS_DIR}"
    local _backup_contents_path="${BACKUP_PATH}/${APP_BUNDLE_CONTENTS_DIR}"

    write_log "restoring backup..."

    if [[ ! -d "${_app_contents_path}" ]] && [[ -d "${_backup_contents_path}" ]]; then
        move_to "${_backup_contents_path}" "$_app_contents_path"
    else
        write_log "nothing to restore"
    fi
}

schedule_backup_cleanup() {
    if [ -d "${BACKUP_PATH}" ]; then
        write_log "backup '${BACKUP_PATH}' will be removed..."
        delete_later "${BACKUP_PATH}"
    fi
}

schedule_update_cleanup() {
    local _update_path="${1}"

    if [ -d "${_update_path}" ]; then
        write_log "update '${_update_path}' will be removed..."
        delete_later "${_update_path}"
    fi
}

run_app() {
    local _app_install_path="${1}"
    local _launch_code="${2}"
    local _exitcode=0

    local _macos_version=$(sw_vers -productVersion)
    write_log "macOS version: ${_macos_version}"

    write_log "checking ${LSREGISTER_SERVICE}..."
    if [ -f "${LSREGISTER_SERVICE}" ]; then
        write_log "running ${LSREGISTER_SERVICE}..."
        ${LSREGISTER_SERVICE} -lazy 1 -v -f "${_app_install_path}" 2>> "${UPDATE_LOG_PATH}"

    else
        # workaround for DES-17028: [MAC Big Sur] - Error dialog appears after update
        write_log "${LSREGISTER_SERVICE} not found..."
        pause 2
    fi

    if [ "${_launch_code}" -eq 0 ]; then
        write_log "running ${_app_install_path} after update successful"
        open -n -a "${_app_install_path}" --args AfterUpdate
        _exitcode="$?"

        # fix for 17028: - Error dialog appears after update

        if [ "${_exitcode}" -ne 0 ]; then
            pause 2

            write_log "rerunning ${_app_install_path} after an unsuccessful first opening"
            open -n -a "${_app_install_path}" --args AfterUpdate
            _exitcode="$?"
        fi
    else
        write_log "running ${_app_install_path} after update failed"
        
        local _error_string="Auto update failed"
        if [ "${_launch_code}" -eq 2 ]; then
            local _error_string="Update failed: current OS will no longer be supported."
        fi

        unblock_app
        open -n -a "${_app_install_path}" --args AfterUpdate UpdateFailed "${_error_string}" ErrorDetails "${ERROR_DETAILS}"
        _exitcode="$?"
    fi

    write_log "app was run with code... = ${_exitcode}"
    return $_exitcode
}

emergency_exit() {
    restore_backup "${normalized_app_install_path}"

    run_app "${normalized_app_install_path}" 1

    schedul_backup_cleanup
    schedul_update_cleanup "${UPDATE_WORK_PATH}"
    cleanup_all

    write_error_log "script working has been unexpectedly interrupted"
    Exit 1
}

# ----------------------------------------------------- #
# -- Check error code --
# ----------------------------------------------------- #

check_return_code() {
    local _operation="${1}"
    local _code="${2}"

    if [[ "${_code}" -ne 0 ]]; then
        write_error_log "app update has been failed during the '${_operation}' operation with code = ${_code}"
        emergency_exit
    else
        write_log "operation '${_operation}' has been completed with code = ${_code}"
    fi
}

# ------------------------------------------------------- #
# -- Terminate process to install os dependency
# ------------------------------------------------------- #

process_is_terminated() {
    local _app_pid="${1}"

    for pgrep_pid in $(ps -xf | grep "${APP_NAME}" | awk '{print $2}'); do
        if [ "${pgrep_pid}" == "${_app_pid}" ]; then
            false; return
        fi
    done

    write_log "process with pid = ${_app_pid} was terminated"
    true; return
}