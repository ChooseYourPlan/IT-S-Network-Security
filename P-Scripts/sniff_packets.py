#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyshark
import socket

packs = pyshark.LiveCapture(interface="wlan0")

def get_host(ip):
    try:
        host = socket.gethostbyaddr(ip)
    except:
        host = " "
    finally:
        return host[0]

def print_conversation_header(pkt):
    try:
        protocol = pkt.transport_layer
        src_addr = pkt.ip.src
        src_port = pkt[pkt.transport_layer].srcport
        dst_addr = pkt.ip.dst
        s = dst_addr.split(".")[0]
        
        if s == "192":
            raise AttributeError
        
        dst_port = pkt[pkt.transport_layer].dstport
        print('%s %s:%s --> %s %s:%s' % (protocol, src_addr, src_port,get_host(dst_addr), dst_addr, dst_port))
    
    except AttributeError as e:
        pass
   
packs.apply_on_packets(print_conversation_header)
