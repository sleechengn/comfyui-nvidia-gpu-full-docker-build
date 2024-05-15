#!/usr/bin/bash

if [ $ROOT_PASSWORD ]; then
	echo "root:$ROOT_PASSWORD" | chpasswd
	echo "change root's password $ROOT_PASSWORD"
	else
	echo "root pw root"
fi
