#!/bin/bash


theme_name="$1"
echo $theme_name


#if [ "$theme_name" == "" ]; then
#        echo "Please insert parameter theme-name"
#        exit
#fi

#sudo ./startapi.sh << EOF
#EOF


echo '------------------------------------- copy aps folder start'

sudo cp -rf ../aps/customapi/ /edx/app/edxapp/edx-platform/lms/djangoapps/
#sudo cp -rf ./aps/repository /edx/app/edxapp/edx-platform/lms/djangoapps/

echo '------------------------------------- copy aps folder done'



#echo '------------------------------------- copy templates folder'

#sudo cp -rf ./templ/notice /edx/app/edxapp/themes/$theme_name/lms/templates/
#sudo cp -rf ./templ/repository /edx/app/edxapp/themes/$theme_name/lms/templates/
#sudo cp -rf ./templ/popup.html /edx/app/edxapp/themes/$theme_name/lms/templates/

#echo '------------------------------------- copy templates folder done'

echo '------------------------------------- modify common.py start'

sudo chmod -R 777 /edx/app/edxapp/edx-platform/lms
sudo sed -e 's,\(INSTALLED_APPS = (\),\1\n''\ ''\ ''\ ''\ '\''customapi'\''\,'',g' /edx/app/edxapp/edx-platform/lms/envs/common.py > /edx/app/edxapp/edx-platform/lms/envs/com_t.py
sudo mv /edx/app/edxapp/edx-platform/lms/envs/com_t.py  /edx/app/edxapp/edx-platform/lms/envs/common.py
sudo chmod 777 /edx/app/edxapp/edx-platform/lms/envs/common.py

echo '------------------------------------- modify common.py done'

echo '------------------------------------- modify urls.py start'

sudo chmod -R 777 /edx/app/edxapp/edx-platform/lms
sudo sed 's,\(notice_detail")\,\),\1\n''\ ''\ ''\ ''\ ''url(r'\''\^customApi/getServerInfo'\''\, '\''customapi.views.getServerInfo'\''\, name="customApi/getServerInfo")\,\n'',g' /edx/app/edxapp/edx-platform/lms/urls.py > /edx/app/edxapp/edx-platform/lms/urls_t.py
sudo mv /edx/app/edxapp/edx-platform/lms/urls_t.py /edx/app/edxapp/edx-platform/lms/urls.py
sudo chmod 777 /edx/app/edxapp/edx-platform/lms/urls.py

echo '------------------------------------- modify urls.py done'

#echo '------------------------------------- migrtation'
#cd /edx/app/edxapp/edx-platform/lms/djangoapps
#/edx/bin/python.edxapp ../../manage.py lms --setting aws startapp customapi

#sudo ./migrateapi.sh << EOF
#EOF
