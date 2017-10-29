#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

id=$(docker images | grep "coach/ajenti" | grep "latest" | awk '{print $3}')

docker kill coach_ajenti_dev
docker rm coach_ajenti_dev
docker rmi $id
docker build -t "coach/ajenti:dev" .

if [ ! -z $1 ]
then
	if [ ! -z $2 ]
	then
		git clone https://github.com/$1/$2.git
		rm -r plugin
		mv $2 plugin
	fi
fi
docker run -d \
	--name coach_ajenti_dev \
	--net=host \
	-v $DIR/plugin:/plugin \
	coach/ajenti:dev
