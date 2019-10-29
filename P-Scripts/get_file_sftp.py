import os
import pysftp
from configparser import ConfigParser

parser = ConfigParser()

if os.path.isfile('../config_payload.ini'):
    parser.read('../config_payload.ini')
elif os.path.isfile('config_payload.ini'):
    parser.read('config_payload.ini')
else:
    raise SystemExit

cnopt = pysftp.CnOpts()
cnopt.hostkeys = None   

IP = parser.get('SFTP-Server','IP-Adress')
uname = parser.get('SFTP-Server','Username')
pword = parser.get('SFTP-Server','Password')
sftp_port = parser.get('SFTP-Server','Port')
filename = parser.get('Filename','Original')

with pysftp.Connection(IP,username=uname,password=pword,cnopts=cnopt,port=int(sftp_port)) as sftp: 
    sftp.get(filename)
