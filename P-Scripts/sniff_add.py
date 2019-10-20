import subprocess 

a_ava = []
 
for ping in range(1,255): 
    address = "192.168.0." + str(ping)
    res = subprocess.call(['ping','-c','1','-W','0,01',address],shell=False, stdout=subprocess.PIPE) 
    if res == 0: 
        a_ava.append(address);

for string in a_ava:
    print string
