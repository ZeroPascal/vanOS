#!/bin/bash
echo "Starting vanOS Config!"
open 'smb://pi:1123H@192.168.11.230/share'
echo "Enter Server ID"
read  ID
#echo "Server ID $ID"

# Screen Saver Off
#defaults -currentHost write com.apple.screensaver idelTime 0

#gets temp folder

if [[ $ID -gt 101 ]]
then
    cp -R /Volumes/share/All_City/-\ mBox\ files\ for\ install/Server\ Install ~/Desktop/temp_install
else
    cp -R /Volumes/share/All_City/-\ mBox\ files\ for\ install/Server\ 101\ Install ~/Desktop/temp_install
fi



hdiutil attach ~/Desktop/temp_install/mBox\ Software/Mbox-Studio-v443-r10342.dmg

#sudo installer -package /Volumes/Mbox-Studio-v443-r10342/Mbox-Studio-v443-r10342.pkg -target /

#sudo hdiutil detach /Volumes/Mbox-*

# Do Not Disturb
#defaults -currentHost write com.apple.notificationcenterui dndEnd 1319
#defaults -currentHost write com.apple.notificationcenterui dndStart 1320
#defaults -currentHost write com.apple.notificationcenterui doNotDistrub 0

while true; do
    read -p "Done?" yn
    case $yn in
        [Yy]* ) diskutil unmount /Volumes/share; rm -rf ~/Desktop/temp_install; break;;
        [Ny]*) echo 'Okay...'; exit;;
        *) echo "Please answer yes or no"
    esac
done

