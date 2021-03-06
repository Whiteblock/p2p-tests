#!/bin/bash

export NO_PRETTY=1

#(size,name)
log(){
	for ((i=0;i<$1;i++))
	do
		wb get log $i > "./data/${2}/node${i}.log"
	done
}

wait_for_results(){
	sleep 2m
}


SENDERS=50
NODES=100
SIZE=200
CONNS=10
INTERVAL=7812

#SERIES4: bandwidth
#a
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -b 50

wait_for_results
wb netconfig off

log $NODES series4a

#b
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -b 250

wait_for_results
wb netconfig off

log $NODES series4b

#c
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -b 750

wait_for_results
wb netconfig off

log $NODES series4c


#Series 5: Network Latency

#a
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -d 10

wait_for_results
wb netconfig off

log $NODES series5a

#b
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -d 100

wait_for_results
wb netconfig off

log $NODES series5b

#c
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -d 500

wait_for_results
wb netconfig off

log $NODES series5c

#Series 6: Packet Loss

#a
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 0.01

wait_for_results
wb netconfig off

log $NODES series6a

#b
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 0.1

wait_for_results
wb netconfig off

log $NODES series6b

#c
wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 1

wait_for_results
wb netconfig off

log $NODES series6c

#Series 7 - Stress Test

#a

wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 0.1 -b 10 -d 150

wait_for_results
wb netconfig off

log $NODES series7b

#b

wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 0.1 -b 10 -d 150

wait_for_results
wb netconfig off

log $NODES series7b

#c

wb build -b libp2p-test -n $NODES -m 0 -c 0 -y -o"senders=$SENDERS" -o"payloadSize=$SIZE" -o"connections=$CONNS" -o"interval=$INTERVAL"
wb netconfig all -l 0.1 -b 10 -d 150

wait_for_results
wb netconfig off

log $NODES series7c
