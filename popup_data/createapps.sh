#!/bin/bash

echo '---------------------------------- create apps repository start'

sudo su -s /bin/bash edxapp
cd /edx/app/edxapp/edx-platform/lms/djangoapps
/edx/bin/python.edxapp ../../manage.py lms --setting aws startapp repository
exit

echo '---------------------------------- create apps repository done'