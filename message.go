package main

import (
	"fmt"
	"time"
	// "encoding/json"
)

type Message struct {
	Origin      string    `json:"origin"`      //node from which the message was initially sent
	Destination string    `json:"destination"` //node to which the message is being sent
	Relayer     string    `json:"relayer"`     //last node which relayed the message
	Timestamp   time.Time `json:"timestamp"`   //time at which the message was first broadcast
	Data        string    `json:"data"`        //message payload
	MessageID   string    `json:"messageid"`   //a unique identified associated with a message
	Nonce       int64     `json:"nonce"`       //counter representing order in which message was sent from origin
}

type Response struct {
	Message Message
}

type Request struct {
	Message Message
}

type Handler struct {
	Relayer string//Passed to relayer
}

func (h *Handler) Execute(req Request, res *Response) (err error) {
	
	fmt.Printf("Received Request: %#v\n",req)

	res.Message = Message{
		Origin:"0x0",
		Destination: "0x0",
		Relayer: h.Relayer,
		Timestamp: time.Now(),
		Data: "peepeepoopookaka",
		MessageID: "0x0",
		Nonce: 1,
	}
	return nil
}
