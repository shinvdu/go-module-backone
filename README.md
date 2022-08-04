## A go module backone template

### Prepare

- 1. turn off GO111MODULE

go env -w GO111MODULE=off

- 2. replace with your project info

DOMAIN=github.com  AUSER=silas PROJECT_NAME=govpn ./new_project.sh

- 3. add custom command and  build

cd {project path}

GOPATH=$(pwd) go build git.sky-city.me/tony/project/cmd/project-command

