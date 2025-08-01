#!/bin/bash

read -p "To check the service status, please enter the service name",serivce

echo "$service"

if systemctl is-active --quiet $service;then
  echo "$service is running"
else 
  echo "$service is not running. Starting it now..."
  sudo systemctl start $service
  echo "Service is started"
fi
