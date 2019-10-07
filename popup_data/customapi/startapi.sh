#!/bin/bash

echo '---------------------------------- create apps repository start'

#su -s /bin/bash edxapp
sudo -H -u edxapp bash << EOF
cd /edx/app/edxapp/edx-platform/lms/djangoapps
/edx/bin/python.edxapp ../../manage.py lms --setting aws startapp customapi
EOF

exit
#sudo su -s /bin/bash edxapp
#cd /edx/app/edxapp/edx-platform/
#/edx/bin/python.edxapp ./manage.py lms --setting aws makemigrations customapi
#/edx/bin/python.edxapp ./manage.py lms --setting aws migrate customapi



echo '---------------------------------- create apps repository done'
