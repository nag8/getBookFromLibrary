package main

import (
	"fmt"
	"strconv"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

func main() {

	fmt.Println("処理実行")
	dbc := initDB()
	getBookList()
}

func getBookList() {

	doc, err := goquery.NewDocument("https://bookmeter.com/users/763253/books/wish")
	if err != nil {
		panic(err)
	}
	selection := doc.Find("div.detail__title").Find("a")
	selection.Each(func(index int, s *goquery.Selection) {
		url, _ := s.Attr("href")
		id, _ := strconv.Atoi(strings.Trim(url, "/books/"))
		b := newBook(id, s.Text(), 1)
		writeFireStore(ctx, client, b)

	})
}
