#!/bin/bash

#clears dock
defaults write "com.apple.dock" "persistent-apps" '()'

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/System/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'


#kills dock
killall Dock

# Do Not Disturb
defaults -currentHost write com.apple.notificationcenterui dndEnd 1319
defaults -currentHost write com.apple.notificationcenterui dndStart 1320
defaults -currentHost write com.apple.notificationcenterui doNotDistrub 0

# Screen Saver Off
#defaults -currentHost write com.apple.screensaver idelTime 0

#Disable Siri
defaults -currentHost write "com.apple.assistant.support" "Assistant Enabled" '0'

#Sounds Disabled
defaults -currentHost write "Apple Global Domain" "com.apple.sound.uiaudio.enabled" '0'

#Alert Volume
defaults -currentHost write "Apple Global Domain" "com.apple.sound.beep.volume" '0'

#Remove Sound Icon from Menu Bar
defaults -currentHost delete "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.volume"

#Keyboard Flag
defaults -currentHost write "com.apple.TextInputMenu" "visible" "0"

#Energy
#defaults -currentHost write "com.apple.systempreferences" "com.apple.preferences.energysaver" '{hasBeenWarnedAboutEnergyUsage=YES;}'

#Screen Mirror Icon
defaults -currentHost write "com.apple.airplay" "showInMenuBarIfPresent" '0'

#Wifi Icon 
defaults -currentHost delete "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.airport"
#defaults -currentHost write "com.apple.systemuiserver" "menuExtras" '("/System/Library/CoreServices/Menu Extras/Clock.menu",)'

#Bluetooth Menu Bar
defaults -currentHost delete "com.apple.systemuiserver" "NSStatusItem Visible com.apple.menuextra.bluetooth"

#--Finder--
echo 'Finder/ Desktop Settings'
sleep 2

#Show HD
defaults -currentHost write "com.apple.finder" "ShowHardDrivesOnDesktop" '1'

#Show Mounted Servers
defaults -currentHost write "com.apple.finder" "ShowMountedServersOnDesktop" '1'

defaults -currentHost write "com.apple.finder" "DesktopViewSettings" 

#Bluetooth Off
defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState 0

#Snap to Grid
defaults -currentHost write "com.apple.finder" "DesktopViewSettings" '<dict><key>IconViewSettings</key><dict><key>arrangeBy</key><string>grid</string><key>backgroundColorGreen</key><string>1</string><key>backgroundColorRed</key><string>1</string><key>backgroundColorBlue</key><string>1</string><key>backgroundType</key><string>0</string><key>gridOffsetX</key><string>0</string><key>gridOffsetY</key><string>0</string><key>gridSpacing</key><string>54</string><key>iconSize</key><string>54</string><key>labelOnBottom</key><string>1</string><key>showIconPreview</key><string>1</string><key>showItemInfo</key><string>0</string><key>textSize</key><string>12</string><key>viewOptionsVersion</key><string>1</string></dict></dict>'

#HD to Upper Right
defaults -currentHost write "com.apple.finder" "FXDesktopVolumePositions" '<dict><key>Macintosh HD_0x1.36d734c90e88p+29</key><dict><key>AnchorRelativeTo</key><string>1</string><key>ScreenID</key><string>0</string><key>xRelative</key><string>-65</string><key>yRelative</key><string>63</string></dict></dict>'

killall cfprefsd 
