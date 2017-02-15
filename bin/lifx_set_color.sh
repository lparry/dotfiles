#!/bin/sh
curl -s -H "Authorization: Bearer $LIFX_TOKEN" -X PUT -d "color=$*;duration=0" "https://api.lifx.com/v1beta1/lights/all/color"

