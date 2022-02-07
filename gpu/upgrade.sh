#!/bin/bash -x
version=`jq -r '.docker' config.json`
echo "-------Current docker version--------"
echo `docker --version`
echo
echo
echo "----------------"
d=`date`
echo "Upgrading Docker Package started at $d"
start=`date +%s`
curl -utsls-bot:AP3exSDEXZrntT8ZRYU9LMW8gQAydbzwv1abGz -O "https://hcss.jfrog.io/artifactory/tsls-dev-os-image/argocd-poc/docker-$version.tgz"
if [ $? -eq 0 ];
then
        echo "New package download completed"
else
        echo "New package doenload failed"
	exit 1
fi

mkdir docker-$version
tar zvxf /home/rahul/docker-$version.tgz -C docker-$version
if [ $? -eq 0 ];
then
        echo "Unzipping file completed"
else
        echo "unzipping file failed"
	exit 1
fi

sudo pkill dockerd
if [ $? -eq 0 ];
then
        echo "Killing process successfully"
else
        echo "Killing process failed"
	exit 1
fi

sudo cp docker-$version/docker/* /usr/bin
sudo dockerd &
if [ $? -eq 0 ];
then
        echo "Started new process "
else
        echo "Starting new process failed"
	exit 1
fi

sleep 5s
end=`date +%s`
echo "-------Docker Upgrade Completed-------"
echo runtime=$((end-start))s
echo `docker --version`
