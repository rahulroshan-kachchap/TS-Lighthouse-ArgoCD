#!/bin/bash
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
mkdir docker-$version
tar zvxf /home/rahul/docker-$version.tgz -C docker-$version
sudo pkill dockerd
sudo cp docker-$version/docker/* /usr/bin
sudo dockerd &
sleep 5s
end=`date +%s`
echo "-------Docker Upgrade Completed-------"
echo runtime=$((end-start))s
echo `docker --version`
