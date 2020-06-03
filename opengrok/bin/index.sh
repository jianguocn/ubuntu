#!/bin/bash

TOP=$(pwd)
export PROJECT=$1
if [ a"$PROJECT" = a"" ]; then
  echo no project
  exit 1
fi

export SOURCE_DIR=$TOP/../src/$PROJECT/mydroid
export OPENGROK_TOMCAT_BASE="/var/lib/tomcat8"
export OPENGROK_INSTANCE_BASE="/mnt/work/opengrok/index/$PROJECT"
export OPENGROK_WEBAPP_NAME="$PROJECT"
export IGNORE_PATTERNS="-i prebuilts -i toolchain -i *.bin -i *.dat"

echo PROJECT=$PROJECT
echo SOURCE_DIR=$SOURCE_DIR
echo OPENGROK_TOMCAT_BASE=$OPENGROK_TOMCAT_BASE
echo OPENGROK_INSTANCE_BASE=$OPENGROK_INSTANCE_BASE
echo OPENGROK_WEBAPP_NAME=$OPENGROK_WEBAPP_NAME

./OpenGrok deploy
./OpenGrok index $SOURCE_DIR

#FIXME
sed -i "s#/var/opengrok#$TOP/../index/$PROJECT#" /var/lib/tomcat8/webapps/$PROJECT/WEB-INF/web.xml

