#!/usr/bin/env bash
# Transfer config files

# Xcode Policy
/Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild  -license accept
xcodebuild -runFirstLaunch
#installer -pkg /Applications/Xcode.app/Contents/Resources/Packages/MobileDevice.pkg -target /
#installer -pkg /Applications/Xcode.app/Contents/Resources/Packages/MobileDeviceDevelopment.pkg -target /


#see Users
dscl . list /Users | grep -v '_'
#delete a Users
sudo dscl . delete /Users/mac
sudo rm -rf /Users/mac

#create Users
sudo dscl . -create /Users/student
sudo dscl . -create /Users/student UserShell /bin/bash
sudo dscl . -create /Users/student RealName Student
sudo dscl . -create /Users/student UniqueID 503
sudo dscl . -create /Users/student PrimaryGroupID 20
sudo dscl . -create /Users/student NFSHomeDirectory /Users/new_user
sudo dscl . -passwd /Users/student plantlife
sudo dscl . append /Groups/student GroupMembership student
sudo createhomedir -u studenttest

#chalkboard image root
/Library/User Pictures/Fun/Chalk.tif

#change user Pictures
sudo dscl . delete /Users/student jpegphoto
sudo dscl . delete /Users/student Picture
sudo dscl . create /Users/student Picture /Library/User Pictures/Fun/Chalk.tif

# autologin to student when startup (TEST)
plist: com.apple.loginwindow.plist
sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser student

#Turn off Fast User Switching
defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool NO
defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool NO

#Clock settings in Menu
defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d  h:mm:ss a"
killall -KILL SystemUIServer

#Disable Mission Control
defaults write com.apple.dock mcx-expose-disabled -bool TRUE
killall -KILL Dock

#keyrepeat &  delay until repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

#trackpad to the right
defaults write -g com.apple.mouse.scaling -float 9.0
#scale goes 0 to 9

#displaysleep
sudo pmset -a displaysleep 10 sleep 15
sudo pmset -a displaysleep 10
sudo pmset -a sleep 15

#disable automatically check for updates
softwareupdate --schedule off
#or
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool FALSE

#disable screensaver to never
defaults -currentHost write com.apple.screensaver idleTime 0 #0 is never

#enable sharing remote login and remote management
#remote login
/usr/libexec/PlistBuddy /Library/Preferences/com.apple.RemoteDesktop.plist
set DOCAllowRemoteConnections true
#remotemangement
/usr/libexec/PlistBuddy /Library/Preferences/com.apple.RemoteManagement.plist
set

#changing computername
sudo scutil --set ComputerName <pairing-station>
#computer would need a restart

#reduce alet volume

#show volume in menu
/usr/libexec/PlistBuddy -c 'add "NSStatusItem com.apple.menuextra.volume" bool true' /Users/clarizzaarucan/Library/Preferences/com.apple.systemuiserver.plist
/usr/libexec/PlistBuddy /Users/$/Library/Preferences/com.apple.systemuiserver.plist
Add :menuExtras: string /System/Library/CoreServices/Menu Extras/Volume.menu


#disable show mirroring options in menu bar
#pretty sure that this is already disabled
Delete :menuExtras: string /System/Library/CoreServices/Menu Extras/Displays.menu
plbuddy -c "Delete: menuExtras: '/System/Library/CoreServices/Menu Extras/Displays.menu':6 string test" /Users/clarizzaarucan/Library/Preferences/com.apple.systemuiserver.plist

#enable wifi status in menu bar
/usr/libexec/PlistBuddy -c 'add "NSStatusItem com.apple.menuextra.airport" bool true' /Users/clarizzaarucan/Library/Preferences/com.apple.systemuiserver.plist
/usr/libexec/PlistBuddy /Users/$/Library/Preferences/com.apple.systemuiserver.plist
Add :menuExtras: string /System/Library/CoreServices/Menu Extras/airport.menu

#enable bluetooth in menu
/usr/libexec/PlistBuddy -c 'add "NSStatusItem com.apple.menuextra.bluetooth" bool true' /Users/clarizzaarucan/Library/Preferences/com.apple.systemuiserver.plist
/usr/libexec/PlistBuddy /Users/$/Library/Preferences/com.apple.systemuiserver.plist
Add :menuExtras: string /System/Library/CoreServices/Menu Extras/bluetooth.menu

#enable doNotDisturbDate
usr/bin/defaults write com.apple.notificationcenterui "dndEnd" -float 1000
usr/bin/defaults write com.apple.notificationcenterui "doNotDisturb" -bool FALSE
usr/bin/defaults write com.apple.notificationcenterui "dndStart" -float 0600
killall SystemUIServer


#disable password after sleep or screen screensaver
defaults write com.apple.screensaver askForPassword -bool false

#finder window is Column View
defaults write com.apple.Finder FXPreferredViewStyle -string 'Nlsv'
killall -kill Finder

defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"

#startup automatically after power failure
sudo /usr/sbin/systemsetup -setrestartpowerfailure on

#Point & Click  tracking speed
defaults write -g com.apple.trackpad.scaling -float 3.0 # a 3 is max

# Alert Voume 50%
defaults write .GlobalPreferences com.apple.sound.beep.volume -float 0.6065307 #half volume
defaults write .GlobalPreferences com.apple.sound.beep.volume -float 1.0 #full volume

#finder search default
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
killall -kill finder

#new finder window
defaults wrtie com.apple.finder NFWindowShows -string 'home'
