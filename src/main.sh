#!/bin/sh
USER_SCRIPT_HOME=$HOME/.user.scripts
USER_MODULE_PATH=${USER_SCRIPT_HOME}/.modules
autoReload=true
userScriptVersion=v0.0

# global functions
scriptbanner() {
    echo "user scripts version ${userScriptVersion}"
}

# global functions
run() {
    local modules=$(ls $USER_MODULE_PATH)
    for module in $modules; do
        local scriptPath=${USER_MODULE_PATH}/${module}/index.sh
        source ${scriptPath} ${module}
    done
}

run
