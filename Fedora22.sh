#!/bin/bash
continue=1

# Set some variables
version="7.1" # Increment major changes here
fvsupp="22" # Fedora release version this script targets
luser=$(< /tmp/FedPo/user) #Set the identity of the user who launched the script. Will be useful later.

### DEPRECATED ###
### SCRIPT NO LONGER RUNS AS ROOT BY DEFAULT ###
# Ensure script is being run as root
#if (( $EUID != 0 )); then
#/bin/echo "This script must be run as root. Type in 'sudo $0' to run it as root."
#exit 1
#fi

# Fedora Version Check
if (( $(rpm -E %fedora) != $fvsupp )); then
/bin/echo "This script is optimised for Fedora $fvsupp.
It may not run correctly on earlier/later versions of Fedora.
To force the script to run on this system, please remove the
\"Fedora Version Check\" section of the script, and attempt
to run the script again."
exit 1
fi

#Tell the script to look in the current directory
#and append the name of the plugins directory
#dir="$(dirname "$0")/Plugins"
dir="$(dirname "$0")/$fvsupp/plugins"

#Specify plugins here
. $dir/AutoUpdate
. $dir/Dotfiles
. $dir/Enable_RPMFusion
. $dir/Enable_SSH
. $dir/Exit
. $dir/Fix_Fonts
. $dir/Hosts_Block
. $dir/Install_Chrome
. $dir/Install_HTPC
. $dir/Install_NVIDIA
. $dir/Install_ownCloud
. $dir/Install_Packages
. $dir/Install_POL
#. $dir/Install_ZoL ## Temporarily disabled
. $dir/Installer
. $dir/Main
. $dir/Minimal_Setup
. $dir/Remove_Useless
. $dir/Start
. $dir/System_Update
. $dir/VBox_Guest
. $dir/VM_Guest
. $dir/Install_Steam
. $dir/Install_TBB
. $dir/ArcTheme
. $dir/WindowButtons
. $dir/MPVConf
. $dir/Install_VBox
. $dir/Install_Tor

until [ $continue = 0 ]; do
	Start
exit
done
