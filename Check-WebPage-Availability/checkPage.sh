#!/bin/sh
STATUS_CODE=$(curl -LI $1 -o /dev/null -w '%{http_code}\n' -s)
if [ $STATUS_CODE -lt 400 ]
then
	echo "Subject: Alert: $1 is ready" | sendmail $2 
fi
