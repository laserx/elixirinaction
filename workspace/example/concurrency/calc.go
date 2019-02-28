package main

import "fmt"

func sum(s []int, c chan int) {
	sum := 0
	for _, v := range s {
		sum += v
	}
	c <- sum // send sum to c
}

func gen(t int) []int {
	var r []int
	for i := 1; i <= t; i++ {
		r = append(r, i)
	}

	return r
}

func main() {
	s := gen(10)

	fmt.Println(s)

	c := make(chan int)
	go sum(s[:len(s)/2], c)
	go sum(s[len(s)/2:], c)
	x, y := <-c, <-c // receive from c

	fmt.Println(x, y, x+y)
}
