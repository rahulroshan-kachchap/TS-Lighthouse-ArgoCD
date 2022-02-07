#!/bin/bash
version=`jq -r '.docker' config.json`
echo "-------Current docker version--------"
echo `docker --version`
echo
echo
echo "----------------"
echo "Upgrading Docker Package"
sudo pkill dockerd
start=`date +%s`
curl -uadmin:AP4BnoFbWBX2EmdxfEdi15G4xm3 -O "http://localhost:8081/artifactory/argocd-poc/docker-$version.tgz"
mkdir docker-$version
tar zvxf /home/rahul/docker-$version.tgz -C docker-$version
cp docker-$version/* /usr/bin
sudo dockerd &
end=`date +%s`
echo runtime=$((end-start))s
d=`date`
echo $d
echo "-------Docker Upgrade Completed-------"
echo `docker --version`
