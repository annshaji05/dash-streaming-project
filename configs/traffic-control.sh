#!/bin/bash

# TBF -Token Bucket Filter (on server)
# sudo tc qdisc add dev enp0s8 root tbf rate 2.5mbit burst 20k latency 50ms

# HTB - Hierarchical Token Bucket (on server)
# sudo tc qdisc add dev enp0s8 root handle 1: htb default 10
# sudo tc class add dev enp0s8 parent 1: classif 1:10 htb rate 2.5mbit ceil 5mbit burst 20k

# Traffic Policing (on client)
# sudo tc qdisc add dev enp0s8 ingress
# sudo tc filter add dev enp0s8 parent ffff: protocol ip u32 match u32 0 0 police rate 3.5mbit burst 20k drop flowid :1

#Remove all rules
# sudo tc qdisc del dev enp0s8 root
# sudo tc qdisc del dev enp0s8 ingress
