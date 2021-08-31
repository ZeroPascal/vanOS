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

#Settings SH
sh ~/Desktop/settings.sh

#Computer Name
scutil --set ComputerName mbox\ $ID
scutil --set LocalHostName mbox\ $ID

#Disk Name
disktuil rename / mbox\ $ID

#File Share
#AFP
launchctl load -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist
#SMB
launchctl load -w /System/Library/LaunchDaemons/com.apple.smbd.plist

#Static IPs
networksetup -setmanual 'Ethernet 2' 192.168.15.$ID 255.255.255.0


#Wi-Fi Off
networksetup -setairportpower en2 off

#Mount and Install Mbox
# hdiutil attach ~/Desktop/temp_install/mBox\ Software/Mbox*.dmg
while true; do
    read -p 'mBox Install Done?' yn
    case $yn in
        [Yy]*) break;;
        *) 'Please Install mBox First'
    esac
done

[! -d "/Applications/Mbox"] && echo 'Liar'

#installer -pkg /Volumes/Mbox\ Studio\ v4.4.3\ r10342/*.pkg -target /Applications
# hdiutil detach /Volumes/Mbox*

# Do Not Disturb
#defaults -currentHost write com.apple.notificationcenterui dndEnd 1319
#defaults -currentHost write com.apple.notificationcenterui dndStart 1320
#defaults -currentHost write com.apple.notificationcenterui doNotDistrub 0


#Unmount Shared
diskutil unmount /Volumes/share
rm -rf ~/Desktop/temp_install

#Empty Trash    
osascript -e 'tell application "Finder" to empty trash'
networksetup -setmanual 'Ethernet 1' 192.168.11.$ID 255.255.255.0

while true; do
    read -p 'Restart?' yn
    case $yn in
    [Yn]*) reboot; break;;
    [Nn]*) exit;;
    esac
done

break





