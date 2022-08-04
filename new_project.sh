#!/bin/bash

set -o errexit

# DOMAIN=github.com  AUSER=silas PROJECT_NAME=govpn ./new_project.sh

if [[ -z $DOMAIN ]]; then
	# echo 'please input your username';
	read -p "Enter your domain(no space): " DOMAIN
fi

if [[ -z $AUSER ]]; then
	read -p "Enter your username(no space): " AUSER
fi


if [[ -z $PROJECT_NAME ]]; then
	read -p "Enter your project(no space): " PROJECT_NAME
fi

echo "domain: $DOMAIN"
echo "username: $AUSER"
echo "project: $PROJECT_NAME"

export DOMAIN
export AUSER
export PROJECT_NAME


if [[ ! -d  src/git.sky-city.me/tony/project/ ]]; then
	echo 'exit, you have generate the project!'
	exit 1;
fi

export PROJECT_PATH="src/${DOMAIN}/${AUSER}/${PROJECT_NAME}"

function filepathChange {

	cp -r src/git.sky-city.me/tony/project/ "$PROJECT_NAME"

	rm -fR src/git.sky-city.me

	mkdir -p "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/cmd"
	mkdir -p "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-client/"
	mkdir -p "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-server/"
	mkdir -p "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/config"

	cp "${PROJECT_NAME}/cmd/project-client/project-client.go" "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-client/${PROJECT_NAME}-client.go"

	cp "${PROJECT_NAME}/cmd/project-server/project-server.go" "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-server/${PROJECT_NAME}-server.go"

	cp "${PROJECT_NAME}/project.go" "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/${PROJECT_NAME}.go"

	cp "${PROJECT_NAME}/config/config.go" "src/${DOMAIN}/${AUSER}/${PROJECT_NAME}/config/config.go"	
	rm -fR "$PROJECT_NAME"

}

function replaceToken {
	perl -pi -e 's#git.sky-city.me\/tony\/project#$ENV{PROJECT_PATH}#g' "$1"
	perl -pi -e 's#project#$ENV{PROJECT_NAME}#g' "$1"
	perl -pi -e 's#tony#$ENV{AUSER}#g' "$1"
	perl -pi -e 's#git.sky-city.me#$ENV{DOMAIN}#g' "$1"
}


filepathChange

replaceToken "${PROJECT_PATH}/${PROJECT_NAME}.go"
replaceToken "${PROJECT_PATH}/cmd/${PROJECT_NAME}-client/${PROJECT_NAME}-client.go"
replaceToken "${PROJECT_PATH}/cmd/${PROJECT_NAME}-server/${PROJECT_NAME}-server.go"

