package main

import (
	"context"
	"log"

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

func addDB(dbc DBConfig, b Book) {

	_, _, err := dbc.client.Collection("books").Add(dbc.ctx, map[string]interface{}{
		"id":     b.id,
		"name":   b.name,
		"status": b.status,
	})
	if err != nil {
		log.Fatalf("Failed adding alovelace: %v", err)
	}

	// 切断
	defer dbc.client.Close()
}
