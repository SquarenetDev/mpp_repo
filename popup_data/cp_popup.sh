#!/bin/bash


theme_name="$1"
echo $theme_name


if [ "$theme_name" == "" ]; then
        echo "Please insert parameter theme-name"
        exit
fi




echo '------------------------------------- copy popup.html'

sudo cp -rf ./templ/popup.html /edx/app/edxapp/themes/$theme_name/lms/templates/

echo '------------------------------------- done'