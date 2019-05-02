#!/bin/sh
#set -x
bridge=br0

if [ -n "$1" ];then
#   ip tuntap add $1 mode tap  
    ip link set dev $1 up promisc on
    ip link set $1 master $bridge
    exit 0
else
    echo "Error: no interface specified"
    exit 1
fi

# *https://unix.stackexchange.com/questions/189033/tunctl-complains-that-device-or-resource-is-busy-if-used-in-etc-qemu-ifup-scrip
