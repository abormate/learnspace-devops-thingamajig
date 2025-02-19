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