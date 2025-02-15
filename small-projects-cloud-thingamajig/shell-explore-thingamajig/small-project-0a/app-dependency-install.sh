#!/bin/bash
# Shell script modular install software dependency

# ------------------------------------------------ #
# vars 

OS_UPDATER_PATH="$( cd "$(dirname "${BASH_SOURCE[0]})" && pwd )"

LSREGISTER_SERVICE="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"

# ------------------------------------------------ #
# common function
write_log() {
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@"
    echo $(date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"): "$@" >> "${UPDATE_LOG_PATH}"
}