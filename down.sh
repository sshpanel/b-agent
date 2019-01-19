#!/bin/bash

if [[ ! -e ~/v-agent/.env ]] ; then
    exit 1
fi

SHOULDEXPORT=$(<~/v-agent/.env)

export $SHOULDEXPORT

IP_ADDRESS=`curl ipv4.icanhazip.com`
DOWN_URL="$PANEL_URL/api/account/down?ip=$IP_ADDRESS&username=$username"

curl $DOWN_URL >> /dev/null