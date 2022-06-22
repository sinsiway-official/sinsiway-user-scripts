#!bin/sh

getInstallDirectory() (
    local defaultInstallDirectory=~/.user.scripts
    printf "Please enter the installation path. [ $defaultInstallDirectory ] : "
    local inputDirectory
    read inputDirectory
    [ -z $inputDirectory ] && inputDirectory=$(readlink -e $defaultInstallDirectory)
    echo $inputDirectory
)

run() (
    installDirectory=getInstallDirectory

    # printf "target install directory is '$installDirectory'."
)

run
