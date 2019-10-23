from wifi import Cell,Scheme, exeptions


scheme = Scheme.for_cell('wlan0', 'home', cell, 'test')
scheme.activate()
    print("Connect to {} with `{}` passkey works!!".format(cell, 'test'))
sys.exit(0)
