import pysftp

cnopt = pysftp.CnOpts()
cnopt.hostkeys = None   

with pysftp.Connection("weissenfels.tech",username="foo",password="pass",cnopts=cnopt, port=2222) as sftp: 
    sftp.get("/CameraSample.apk")
