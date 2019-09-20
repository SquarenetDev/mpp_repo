#!/bin/bash


theme_name="$1"
echo $theme_name


echo '------------------------------------- overwrite folder'

sudo cp -rf ./aps/notice/ /edx/app/edxapp/edx-platform/lms/djangoapps/
sudo cp -rf ./aps/repository /edx/app/edxapp/edx-platform/lms/djangoapps/





echo '------------------------------------- overwrite folder'

sudo cp -rf ./templ/notice /edx/app/edxapp/themes/$theme_name/lms/templates/
sudo cp -rf ./templ/repository /edx/app/edxapp/themes/$theme_name/lms/templates/
sudo cp -rf ./templ/popup.html /edx/app/edxapp/themes/$theme_name/lms/templates/


sudo chmod -R 777 /edx/app/edxapp/edx-platform/lms
sudo sed -e 's,\(INSTALLED_APPS = (\),\1\n''\ ''\ ''\ ''\ '\''repository'\''\,'',g' /edx/app/edxapp/edx-platform/lms/envs/common.py > /edx/app/edxapp/edx-platform/lms/envs/com_t.py
sudo mv /edx/app/edxapp/edx-platform/lms/envs/com_t.py  /edx/app/edxapp/edx-platform/lms/envs/common.py
sudo chmod 777 /edx/app/edxapp/edx-platform/lms/envs/common.py

sudo chmod -R 777 /edx/app/edxapp/edx-platform/lms
sudo sed 's,\(notice_detail")\,\),\1\n''\ ''\ ''\ ''\ ''url(r'\''\^repository_list$'\''\, '\''repository.views.list'\''\, name="repository_list")\,\n'\ ''\ ''\ ''\ 'url(r'\''\^repository_detail$'\''\, '\''repository.views.detail'\''\, name="repository_detail")\,\n''\ ''\ ''\ ''\ ''url(r'\''\^customApi/checkPopup'\''\, '\''notice.views.checkPopup'\''\, name="checkpopup")\,\n'',g' /edx/app/edxapp/edx-platform/lms/urls.py > /edx/app/edxapp/edx-platform/lms/urls_t.py
sudo mv /edx/app/edxapp/edx-platform/lms/urls_t.py /edx/app/edxapp/edx-platform/lms/urls.py
sudo chmod 777 /edx/app/edxapp/edx-platform/lms/urls.py
