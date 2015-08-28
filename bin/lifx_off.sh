#!/bin/sh
curl -H "Authorization: Bearer $LIFX_TOKEN" -X PUT -d "state=off;duration:30" "https://api.lifx.com/v1beta1/lights/all/power"

