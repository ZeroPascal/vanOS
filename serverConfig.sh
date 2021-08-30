#!/bin/bash
echo "Starting vanOS Config!"
echo "Enter Server ID"
read ID
echo "Server ID $ID"

# Screen Saver Off
defaults -currentHost write com.apple.screensaver idelTime 0

#gets temp folder
open 'smb://pi:1123H@192.168.11.230/share'
if [$ID -gt 101]
then
    cp -R /Volumes/share/Server_Install_Folders/Server_Install ~/Desktop/temp_install
else
    cp -R ~/Volumes/share/Server_Install_Folders/Server_101_Install ~/Desktop/temp_install
fi




# Do Not Disturb
#defaults -currentHost write com.apple.notificationcenterui dndEnd 1319
#defaults -currentHost write com.apple.notificationcenterui dndStart 1320
#defaults -currentHost write com.apple.notificationcenterui doNotDistrub 0


echo "Done y/n?"
read done_yn
case $done_yn
    y ) diskutil unmount /Volumes/share && rm -rf ~/Desktop/temp
    n) echo 'Okay...'
esac

