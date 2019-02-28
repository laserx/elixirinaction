package main

import (
	"fmt"
	"time"
)

func print(s string, sleep time.Duration, c chan bool) {
	time.Sleep(sleep * time.Second)

	fmt.Println("show me the message: ", s)
	c <- true
}

func main() {
	c := make(chan bool)

	fmt.Println("print now")
	go print("go now", 5, c)
	fmt.Println("quit")
	<-c
}
