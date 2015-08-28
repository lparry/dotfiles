#!/bin/sh
curl -s -H "Authorization: Bearer $LIFX_TOKEN" -X PUT -d "color=kelvin:9000 brightness:0.8;duration=1.0" "https://api.lifx.com/v1beta1/lights/all/color" 

