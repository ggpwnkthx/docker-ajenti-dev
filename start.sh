#!/bin/bash
if [ -z $1 ]
then
	echo "No github username provided."
	exit 2
fi
if [ -z $2 ]
then
	echo "No GitHub project handle provided."
	exit 2
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
git clone https://github.com/$1/$2.git
rm -r plugin
mv $2 plugin
docker build -t "coach/ajenti:dev" .
docker kill coach_ajenti_dev
docker rm coach_ajenti_dev
docker run -d \
	--name coach_ajenti_dev \
	--net=host \
	--privileged \
	coach/ajenti:dev
