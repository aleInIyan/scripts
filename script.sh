#!/bin/bash

# Name of your wireless network (SSID)
SSID="YourSSID"

# Wireless password (if your network is secured)
PASSWORD="YourPassword"

# Wireless interface name (replace with your actual wireless interface, e.g., wlan0)
INTERFACE="wlan0"

# Connect to the wireless network
ifconfig $INTERFACE up
iwconfig $INTERFACE essid "$SSID" key s:"$PASSWORD"

# Obtain an IP address using DHCP (if needed)
dhclient $INTERFACE

# Check if the connection is successful
if ifconfig $INTERFACE | grep -q "inet"; then
  echo "Connected to $SSID successfully!"
else
  echo "Failed to connect to $SSID. Check your settings."
fi
