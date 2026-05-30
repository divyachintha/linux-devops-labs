#!/bin/bash

services=("nginx","ssh")

for service in ${services[@]}
do
    systemctl is-active --quiet $service
    if [ $? -ne 0 ] ; then
	echo " service is not running"
	systemctl restart service

    else
	echo "service is running"
    fi
done

