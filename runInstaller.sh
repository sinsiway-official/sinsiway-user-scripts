#!bin/sh

getInstallDirectory() {
    local defaultDirectory=$HOME/.user.scripts
    printf "Please enter the installation path. [ $defaultDirectory ] : "
    local inputDirectory
    read inputDirectory
    installDirectory=$(readlink -e ${inputDirectory:-${defaultDirectory}})
    [ -z $installDirectory ] && echo "no such directory '${inputDirectory}'." && return 255
    return 0
}

run() (
    installDirectory=""
    getInstallDirectory
    [ $? -ne "0" ] && exit 0
    echo
    echo "Start installing userscript in path '${installDirectory}'."
    echo

)

run
