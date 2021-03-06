#!/bin/bash
# Script for NetworkLatency Chaos Monkey

# Adds 1000ms +- 500ms of latency to each packet
ip -o link show | awk -F': ' '{print $2}' | while read -r IF; do
	tc qdisc add dev "${IF}" root netem delay 1000ms 500ms &
done

wait
