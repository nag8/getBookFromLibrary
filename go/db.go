package main

import (
	"context"
	"fmt"
	"log"
	"strconv"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

type DBConfig struct {
	ctx    context.Context
	client firestore.Client
}

func newDBConfig(ctx context.Context, client firestore.Client) DBConfig {
	dbc := new(DBConfig)
	dbc.ctx = ctx
	dbc.client = client
	return *dbc
}

func initDB() DBConfig {

	ctx := context.Background()
	sa := option.WithCredentialsFile("./config/gserviceaccount.json")
	app, err := firebase.NewApp(ctx, nil, sa)
	if err != nil {
		log.Fatalln(err)
	}

	client, err := app.Firestore(ctx)
	if err != nil {
		log.Fatalln(err)
	}

	return newDBConfig(ctx, *client)
}

func seachDB(dbc DBConfig, id int) (*Book, error) {

	db := dbc.client.Doc("books/" + strconv.Itoa(id))

	docsnap, err := db.Get(dbc.ctx)
	if err != nil {
		return nil, err
	}
	dataMap := docsnap.Data()
	fmt.Println(dataMap)

	var b *Book

	if err := docsnap.DataTo(&b); err != nil {
		return nil, err
	}

	return b, nil
}

func addDB(dbc DBConfig, b Book) {

	db := dbc.client.Doc("books/" + strconv.Itoa(b.id))

	wr, err := db.Create(dbc.ctx, b)
	if err != nil {
		log.Fatalf("Failed adding alovelace: %v", err)
	}
	fmt.Println(wr)

	// _, _, err := dbc.client.Collection("books").Add(dbc.ctx, map[string]interface{}{
	// 	"id":     b.id,
	// 	"name":   b.name,
	// 	"status": b.status,
	// })
	// if err != nil {
	// 	log.Fatalf("Failed adding alovelace: %v", err)
	// }
}
