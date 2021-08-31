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
    cp -R /Volumes/share/All_City/mBox_Installs/Server\ Install ~/Desktop/temp_install
else
    cp -R /Volumes/share/All_City/mBox_Installs/Server\ 101\ Install ~/Desktop/temp_install
fi

#Desktop Image Moved
cp ~/Desktop/temp_install/Desktop\ Backgrounds/server\ $ID.png ~/Pictures

#Computer Name
scutil --set ComputerName mbox $ID
scutil --set LocalHostName mbox $ID

#Disk Name
disktuil rename / mbox\ $ID

#File Share
#AFP
launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
#SMB
launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist

#Static IPs
networksetup -setmanual 'Ethernet 2' 192.168.15.$ID 255.255.255.0
networksetup -setmanual 'Ethernet 1' 192.168.11.$ID 255.255.255.0

#Wi-Fi Off
networksetup -setairportpower en2 off

#Bluetooth Off
sudo defaults write  /Library/Preferences/com.apple.Bluetooth ControllerPowerState 0

#Mount and Install Mbox
#hdiutil attach ~/Desktop/temp_install/mBox\ Software/Mbox*.dmg
#installer -pkg /Volumes/Mbox\ Studio\ v4.4.3\ r10342/*.pkg -target /Applications
#hdiutil detach /Volumes/Mbox*

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


