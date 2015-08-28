#!/bin/sh
curl -s -H "Authorization: Bearer $LIFX_TOKEN" "https://api.lifx.com/v1beta1/lights/all"
