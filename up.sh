#!/bin/bash

source ~/.bashrc

# save the env into temporary file

alias vpnpanel
if [[ "$?" -ne "0" ]] ; then 
    source ~/.bashrc
fi

vpnpanel
if [[ "$?" -ne "0" ]] ; then 
    source ~/.bashrc
fi


# save the env into temp file
TEMP_ENV=`uuidgen`

echo "vpnpanel app:env:get-env" > /tmp/$TEMP_ENV

source /tmp/$TEMP_ENV

## DO THE AUTHENTICATION ##
# PANEL_URL = $PANEL_URL
# PANEL_TOKEN = $PANEL_TOKENhh

IP_ADDRESS=`curl ipv4.icanhazip.com`
UP_URL="$PANEL_URL/api/account/up?ip=$IP_ADDRESS&username=$username"

curl $UP_URL >> /dev/null