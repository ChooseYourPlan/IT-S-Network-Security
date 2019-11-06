#!/usr/bin/env python3
import subprocess
import socket
import sys
import datetime
address = []

subp = subprocess.Popen(["python", "sniff_add.py"], stdout=subprocess.PIPE, bufsize=1,universal_newlines=True)
with subp as p:
    for line in p.stdout:
        address.append(line)

subprocess.call('clear', shell=True)

t1 = datetime.datetime.now()

try:
    for remoteServerIP in address:
        print(remoteServerIP.rstrip())
        for port in range(1,525):  
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            result = sock.connect_ex((remoteServerIP.rstrip(), port))
            if result == 0:
                print("Port {}: 	 Offen".format(port))
            sock.close()

except socket.gaierror:
    print('IP-Adresse nicht bekannt')
    sys.exit()

except socket.error:
    print("IP-Adresse nicht erreichbar")
    sys.exit()

t2 = datetime.datetime.now()

total = t2 - t1
#datetime.datetime.strptime(str(total),"%H:%M")
print('\nDauer: ', str(total)[:-5])
