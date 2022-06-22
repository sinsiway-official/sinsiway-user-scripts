#!/bin/sh
USER_SCRIPT_HOME=$(readlink -e $BASH_SOURCE | xargs dirname)
USER_MODULE_PATH=${USER_SCRIPT_HOME}/.modules
USER_SCRIPT_VERSION_FILE=${USER_SCRIPT_HOME}/.git-commit.ignore

autoupdate() {
    hasGit=$(
        which git 2>/dev/null | wc -l
    )
    lastestCommit=$(cd $USER_SCRIPT_HOME && git log | head -1 | cut -d" " -f 2)
    [ ! -f $USER_SCRIPT_VERSION_FILE ] && echo $lastestCommit >$USER_SCRIPT_VERSION_FILE
    commit=$(cat $USER_SCRIPT_VERSION_FILE)
    echo "commit : ${commit}"
    echo "lasgit logtestCommit : ${lastestCommit}"
    [ "$commit" != "$lastestCommit" ] && echo "need updated."
    # [ "commit" != "lastestCommit" ] && $(cd $USER_SCRIPT_HOME && git pull)
}

autoupdate
#test

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

#run
