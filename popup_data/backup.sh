#!/bin/bash


theme_name="$1"
echo $theme_name


if [ "$theme_name" == "" ]; then
        echo "Please insert parameter theme-name"
        exit
fi



echo '---------------------------------- file backup start'

sudo cp /edx/app/edxapp/edx-platform/lms/envs/common.py /edx/app/edxapp/edx-platform/lms/envs/org_common.py
sudo cp /edx/app/edxapp/edx-platform/lms/urls.py /edx/app/edxapp/edx-platform/lms/org_urls.py
sudo cp -r /edx/app/edxapp/edx-platform/lms/djangoapps /edx/app/edxapp/edx-platform/lms/org_djangoapps
sudo cp -r /edx/app/edxapp/themes/$theme_name /edx/app/edxapp/themes/org_$theme_name

echo '---------------------------------- file backup done'

