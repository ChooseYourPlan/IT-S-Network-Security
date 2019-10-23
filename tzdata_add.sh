#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
sudo apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata
