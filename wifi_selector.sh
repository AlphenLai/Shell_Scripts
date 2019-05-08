#!/bin/bash

#Usage: enter to root, edit /etc/rc.local, add "bash <dir of this file>" into the rc.local

desire_network=("HTC Portable Hotspot 1624" "Hex_office")
network_psk=("" "")

arrlength=${#desire_network[@]}

nmcli device wifi rescan

list=$(nmcli -f SSID device wifi)

for (( i=1; i<${arrlength}+1; i++ )); do
  if [[ $list =~ ${desire_network[$i-1]} ]]; then
    echo "Connecting to: " ${desire_network[$i-1]}
    #nmcli device wifi connect ${desire_network[$i-1]} password ${network_psk[$i-1]}
    nmcli con up "${desire_network[$i-1]}"
    break
  fi
  #echo $i ":"${desire_network[$i-1]}
done


read -n1 -p "Press any key to exit..." any
