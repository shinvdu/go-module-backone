package main

import (
	"fmt"
	"git.sky-city.me/tony/project/config"
	"git.sky-city.me/tony/project"
)


func main() {
    fmt.Println("hello world")
    a := config.GetConfig()
    fmt.Println(a)
    project.HelloClient();
}