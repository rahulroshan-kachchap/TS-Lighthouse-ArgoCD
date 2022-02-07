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
curl -uadmin:AP4BnoFbWBX2EmdxfEdi15G4xm3 -O "https://hcss.jfrog.io/artifactory/tsls-dev-os-image/argocd-poc/docker-$version.tgz"
mkdir docker-$version
tar zvxf /home/rahul/docker-$version.tgz -C docker-$version
sudo cp docker-$version/docker/* /usr/bin
sudo dockerd &
end=`date +%s`
echo runtime=$((end-start))s
d=`date`
echo $d
echo "-------Docker Upgrade Completed-------"
echo `docker --version`
