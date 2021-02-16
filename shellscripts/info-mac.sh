#!/bin/sh
echo "#####################################################"
echo "############ $(date) ############"
echo "#####################################################"
echo "computername:			$(scutil --get ComputerName)"
echo "local hostname:			$(scutil --get LocalHostName)"
echo "hostname:			$(scutil --get HostName)"
echo "user:				$(id -F) (shortname: $(whoami))"
echo "processor:			$(sysctl -n machdep.cpu.brand_string)"
echo "serialnumber:			$(ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}')"
echo "operating system:		macOS $(sw_vers -productVersion)"
echo "model:				$(curl -s http://support-sp.apple.com/sp/product?cc=`system_profiler SPHardwareDataType | awk '/Serial/ {print $4}' | cut -c 9-` | sed 's|.*<configCode>\(.*\)</configCode>.*|\1|') "
echo "kernel version:			$(uname -a | grep Darwin | awk '{print $7}')"
echo "LAN IP: 			$(ipconfig getifaddr en0)"
echo "wireless MAC: 			$(ifconfig en0 | grep ether | awk '{print $2}')"
echo "ethernet MAC: 			$(ifconfig en1 | grep ether | awk '{print $2}')"
echo "#####################################################"