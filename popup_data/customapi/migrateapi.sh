#!/bin/bash

echo '---------------------------------- create apps repository start'

#sudo su -s /bin/bash edxapp
#cd /edx/app/edxapp/edx-platform/lms/djangoapps
#/edx/bin/python.edxapp ../../manage.py lms --setting aws startapp customapi

#sudo su -s /bin/bash edxapp
sudo -H -u edxapp bash << EOF
cd /edx/app/edxapp/edx-platform/
/edx/bin/python.edxapp ./manage.py lms --setting aws makemigrations customapi
/edx/bin/python.edxapp ./manage.py lms --setting aws migrate customapi
EOF
exit


echo '---------------------------------- create apps repository done'
