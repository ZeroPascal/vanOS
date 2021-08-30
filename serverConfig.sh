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
    cp -R /Volumes/share/All_City/-\ mBox\ files\ for\ install/Server\ Install ~/Desktop/temp_install
    

else
    cp -R /Volumes/share/All_City/-\ mBox\ files\ for\ install/Server\ 101\ Install ~/Desktop/temp_install
fi




# Do Not Disturb
#defaults -currentHost write com.apple.notificationcenterui dndEnd 1319
#defaults -currentHost write com.apple.notificationcenterui dndStart 1320
#defaults -currentHost write com.apple.notificationcenterui doNotDistrub 0


echo "Done y/n?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) diskutil unmount /Volumes/share; rm -rf ~/Desktop/temp;;
        No) echo 'Okay...';;
    esac
done

