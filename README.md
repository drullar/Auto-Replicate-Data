# Auto-Replicate-Data

The idea of this project is to make a bash script that would check sertain files in the SMB Folder Share of OpenMediaVault and if they are not in the NFS Folder Share it will replicate it. There is going to be a list of folders that would be checked and the folders should exist in both Folders/File Systems. If the Folder is missing from the NFS one, it will be automatically created and populated with a copy of whatever files are in the SMB one.
