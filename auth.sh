#!/bin/bash
if [[ ! -e ~/v-agent/.env ]] ; then
    exit 1
fi

SHOULDEXPORT=$(<~/v-agent/.env)

export $SHOULDEXPORT

IP_ADDRESS=`curl ipv4.icanhazip.com`
AUTHENTICATION_URL="$PANEL_URL/api/account/login?ip=$IP_ADDRESS&username=$username&password=$password"
STATUS_CODE=$(curl --write-out %{http_code} --silent --output /dev/null ${AUTHENTICATION_URL})

if [[ "$STATUS_CODE" -ne 200 ]] ; then 
    exit 1
else
    exit 0
fi
