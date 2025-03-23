#!/bin/sh

PROXY_SERVER=$1

if [ -z "$PROXY_SERVER" ]; then
    echo "Usage: $0 <proxy_server>"
    exit 1
fi

# $1 is "clear"
if [ "$PROXY_SERVER" = "clear" ]; then
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "Cleared http and https proxy"
    exit 0
fi 

# http
return=`git config --global --get http.proxy`
if [ -z "$return" ]; then
    git config --global http.proxy $PROXY_SERVER
    echo "Set http proxy to $PROXY_SERVER"
else
    echo "Http proxy is already set to $return"
fi

# https
return=`git config --global --get https.proxy`
if [ -z "$return" ]; then
    git config --global https.proxy $PROXY_SERVER
    echo "Set https proxy to $PROXY_SERVER"
else
    echo "Https proxy is already set to $return"
fi
