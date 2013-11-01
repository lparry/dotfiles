#!/bin/bash
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z
#sudo scselect -n
ifconfig en0 | grep ether
sudo ifconfig en0 ether "$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"
ifconfig en0 | grep ether
