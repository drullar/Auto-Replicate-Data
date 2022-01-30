#!/bin/bash
#chmod a+x auto-copy-file.sh


smbSourceDirs=("Plex/" "Kavita/" "Others/") #Add any necessary dirs in this array
topLvlDir="/srv/dev-disk-by-uuid-fb9348a0-6752-4838-9e09-84b6cdb12512/" #Common Folder for both Linux and Windows Shared Folders
linuxTopDir="${topLvlDir}SharePassport/" #Linux Shared folder
windowsTopDir="${topLvlDir}nfsShare/" #Windows Shared folder
echo $windowsTopDir
for dir in ${smbSourceDirs[@]}
do
    srcDir="$windowsTopDir$dir"
    dstDir="$linuxTopDir$dir"

    if [ -d "$srcDir" ];then
        echo "The source folder exists!"

        for eachfile in $(ls $srcDir)
        do
            echo $eachfile
            if [ ! -d $dstDir ];then
                mkdir $dstDir
            fi

            if [ ! -f "$dstDir$eachfile" ];then
                cp $srcDir$eachfile $dstDir
            else
                continue
            fi
        done
    elif [ ! -d "$srcDir" ];then
        echo "The folder $srcDir doesn't exist"
        continue
    fi

done
