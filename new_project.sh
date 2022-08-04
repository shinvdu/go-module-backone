#!/bin/bash

set -o errexit

# DOMAIN=git2.sky-city.me  USERNAME=silas PROJECT_NAME=govpn ./new_project.sh

if [[ -z $DOMAIN ]]; then
	# echo 'please input your username';
	read -p "Enter your domain(no space): " DOMAIN
fi

if [[ -z $USER_NAME ]]; then
	read -p "Enter your username(no space): " USER_NAME
fi


if [[ -z $PROJECT_NAME ]]; then
	read -p "Enter your project(no space): " PROJECT_NAME
fi

echo "domain: $DOMAIN"
echo "username: $USER_NAME"
echo "project: $PROJECT_NAME"

# mv src/git.sky-city.me "src/${DOMAIN}"
# mv "src/${DOMAIN}/tony" "src/${DOMAIN}/${USERNAME}"
# mv "src/${DOMAIN}/${USERNAME}/project" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}"

# mv  "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/project.go" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/${PROJECT_NAME}.go"
if [[ ! -d  src/git.sky-city.me/tony/project/ ]]; then
	echo 'exit, you have generate the project!'
	exit 1;
fi

cp -r src/git.sky-city.me/tony/project/ "$PROJECT_NAME"

rm -fR src/git.sky-city.me

mkdir -p "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/cmd"
mkdir -p "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-client/"
mkdir -p "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-server/"
mkdir -p "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/config"

cp "${PROJECT_NAME}/cmd/project-client/project-client.go" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-client/${PROJECT_NAME}-client.go"

cp "${PROJECT_NAME}/cmd/project-server/project-server.go" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/cmd/${PROJECT_NAME}-server/${PROJECT_NAME}-server.go"

cp "${PROJECT_NAME}/project.go" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/${PROJECT_NAME}.go"

cp "${PROJECT_NAME}/config/config.go" "src/${DOMAIN}/${USERNAME}/${PROJECT_NAME}/config/config.go"

rm -fR "$PROJECT_NAME"



