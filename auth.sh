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

source $TEMP_ENV

## DO THE AUTHENTICATION ##
# PANEL_URL = $PANEL_URL
# PANEL_TOKEN = $PANEL_TOKENhh

IP_ADDRESS=`curl ipv4.icanhazip.com`
AUTHENTICATION_URL="$PANEL_URL/api/account/login?ip=$IP_ADDRESS&username=$username&password=$password"
STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null ${AUTHENTICATION_URL})

if [[ "$STATUS_CODE" -ne 200 ]] ; then 
    exit 1
else
    exit 0
fi
