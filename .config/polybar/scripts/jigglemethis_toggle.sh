#!/usr/bin/env bash

# get the pid of the jigglemethis.py script, if it is running
pid=$(ps -ef | grep -e 'python3.*jigglemethis.py' | grep -v grep | awk '{print $2}')

# check to see if a pid was found
if [ -z "$pid" ]
    then
        # jigglemethis is not running, start it in quiet mode with no end and minimal movement
        jigglemethis.py -q --no-end -m &
    else
        # jigglemethis is running, kill it
        ps -ef|grep jigglemethis.py|grep -v grep|cut -c 10-16|xargs kill -15
fi
