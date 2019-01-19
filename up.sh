#!/bin/bash
if [[ ! -e ~/v-agent/.env ]] ; then
    exit 1
fi

SHOULDEXPORT=$(<~/v-agent/.env)

export $SHOULDEXPORT

IP_ADDRESS=`curl ipv4.icanhazip.com`
UP_URL="$PANEL_URL/api/account/up?ip=$IP_ADDRESS&username=$username"

curl $UP_URL >> /dev/null