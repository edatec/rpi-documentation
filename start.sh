#!/bin/bash

cd /opt/rpi-documentation

bundle install

# pip3 install --user -r requirements.txt

make

make serve_html

tail -f /dev/null