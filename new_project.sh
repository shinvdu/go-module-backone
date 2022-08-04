#!/bin/bash

if [[ -z $DOMAIN ]]; then
	# echo 'please input your username';
	read -p "Enter your domain(no space): " DOMAIN
fi

if [[ -z $USERNAME ]]; then
	read -p "Enter your username(no space): " USERNAME
fi


if [[ -z $PROJECT_NAME ]]; then
	read -p "Enter your project(no space): " PROJECT_NAME
fi

echo "domain: $DOMAIN"
echo "username: $USERNAME"
echo "project: $PROJECT_NAME"

# DOMAIN=git.sky-city.me  USERNAME=tony PROJECT_NAME=gopvn ./new_project.sh