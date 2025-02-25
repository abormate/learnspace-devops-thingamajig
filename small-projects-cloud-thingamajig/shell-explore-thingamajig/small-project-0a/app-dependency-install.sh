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