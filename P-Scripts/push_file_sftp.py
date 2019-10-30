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

IP = parser.get('SFTP-Server-OUT','IP-Adress')
uname = parser.get('SFTP-Server-OUT','Username')
pword = parser.get('SFTP-Server-OUT','Password')
sftp_port = parser.get('SFTP-Server-OUT','Port')
sftp_path = parser.get('SFTP-Server-OUT','Path')
filename_pay = parser.get('Filename','Payload')
filename_org = parser.get('Filename','Original')

with pysftp.Connection(IP,username=uname,password=pword,cnopts=cnopt,port=int(sftp_port)) as sftp:
    #sftp.remove("/upload/" + filename_org)
    sftp.put(filename_pay,sftp_path + "new" + filename_org)
