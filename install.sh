#!/bin/bash

diff=false
compare() {
    if ! diff "$1" "$2" >/dev/null 2>&1; then
        diff=true
    fi
}

compare galendae         /usr/local/bin/galendae
compare config/dark.conf /usr/share/galendae/config/galendae.conf

if [[ "$diff" == "false" ]]; then
    echo "skip install"
    exit 0
fi

sudo mkdir -p /usr/share/galendae/config/
sudo cp galendae         /usr/local/bin/galendae
sudo cp config/dark.conf /usr/share/galendae/config/galendae.conf
sudo cp config/*.csv /usr/share/galendae/config/
