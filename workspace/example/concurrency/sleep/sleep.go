package main

import (
	"fmt"
	"time"
)

func print(s string, sleep time.Duration) {
	time.Sleep(sleep * time.Second)

	fmt.Println("show me the message: ", s)
}

func main() {
	print("print now", 1)
	go print("go now", 5)

	time.Sleep(time.Second * 6)

	fmt.Println("quit")
}
