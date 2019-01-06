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
DOWN_URL="$PANEL_URL/api/account/down?ip=$IP_ADDRESS&username=$username"

curl $DOWN_URL >> /dev/null