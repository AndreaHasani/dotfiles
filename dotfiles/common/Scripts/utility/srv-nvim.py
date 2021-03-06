#!/usr/bin/python

import os
from random import randint
import sys

try:
    os.makedirs("/tmp/nvim_servers")
except:
    pass

servers = os.listdir("/tmp/nvim_servers")

def makename(servers):
    name = "srv_{}".format(len(servers) + 1)
    if len(servers) == 0:
        return name
    while True:
        for r in servers:
            if name in r:
                name = "srv_{}".format(len(servers) + randint(1, 10))
            else:
                return name



command = "NVIM_LISTEN_ADDRESS=/tmp/nvim_servers/{} nvim {}".format(makename(servers), ' '.join(sys.argv[1:]))
os.system(command)
