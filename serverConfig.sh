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


defaults write com.apple.dock persistent-apps {
        GUID = 3213084235;
        "tile-data" =         {
            book = {length = 608, bytes = 0x626f6f6b 60020000 00000410 30000000 ... 04000000 00000000 };
            "bundle-identifier" = "com.apple.systempreferences";
            "dock-extra" = 1;
            "file-data" =             {
                "_CFURLString" = "file:///System/Applications/System%20Preferences.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = "System Preferences";
            "file-mod-date" = 3674274208;
            "file-type" = 41;
            "parent-mod-date" = 3686918753;
        };
        "tile-type" = "file-tile";
    }


defaults write com.apple.dock persistent-others {}

killall Dock



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


