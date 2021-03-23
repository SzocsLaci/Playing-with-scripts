#!/bin/bash
#Calculate the RAM usage and send mail to "tail /var/mail/ubuntu"
ramusage=$(free | awk '/Mem/{printf("%.0f\n"), $3/$2*100}')
if  (("$ramusage" > 20))
        then
        echo 0 | sendmail ubuntu
        exit 0
        else
        echo "$ramusage%" | sendmail ubuntu
        exit 1
fi



