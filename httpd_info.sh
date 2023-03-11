#!/bin/bash
httpd_v=$(httpd -v 2>&1 | awk -F '/' 'NR==1{print $2}' | awk '{print $1}')
httpd_s=$(systemctl status httpd | grep Active | awk '{print $2}')
httpd_p=$(cat /etc/httpd/conf/httpd.conf | grep ^Listen | awk '{print $2}')
echo "The httpd version is: $httpd_v"
echo "The httpd status is: $httpd_s"
echo "The httpd port is: $httpd_p"
