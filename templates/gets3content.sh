#!/bin/sh
aws s3 cp s3://$(curl 169.254.169.254/latest/user-data)/haproxy189.cfg /etc/haproxy/haproxy.cfg --region eu-west-2
/etc/ssl/certs/make-dummy-cert /etc/ssl/certs/self-signed-cert
sudo /sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -x /var/run/haproxy.sock -sf $(cat /var/run/haproxy.pid)
