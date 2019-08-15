#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
echo "Stopping Iguana"
pkill -15 iguana
./assets-cli stop
komodo-cli stop
