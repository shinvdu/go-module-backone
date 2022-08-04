package project

import (
	"fmt"
	"git.sky-city.me/tony/project/config"
)

func HelloServer() {
    fmt.Println("hello Server")
    a := config.GetConfig()
    fmt.Println(a)
}

func HelloClient() {
    fmt.Println("hello Client")
    a := config.GetConfig()
    fmt.Println(a)
}