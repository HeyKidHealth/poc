package main

import (
	"time"

	log "github.com/sirupsen/logrus"
)

func main() {
	log.Info("Iniciou")
	
	var d time.Time
	log.Info(d.IsZero())
	
	d = time.Now()
	log.Info(d.IsZero())
}