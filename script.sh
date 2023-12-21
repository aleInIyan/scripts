#!/bin/bash

# Name of your wireless network (SSID)
SSID="YourSSID"

# Wireless password (if your network is secured)
PASSWORD="YourPassword"

# Wireless interface name
INTERFACE="wlp3s0"

# Connect to the wireless network
ip link set $INTERFACE up
iw dev $INTERFACE connect -w "$SSID" key 0:"$PASSWORD"

# Obtain an IP address using DHCP (if needed)
dhclient $INTERFACE

# Check if the connection is successful
if ip a show $INTERFACE | grep -q "inet"; then
  echo "Connected to $SSID successfully!"
else
  echo "Failed to connect to $SSID. Check your settings."
fi
