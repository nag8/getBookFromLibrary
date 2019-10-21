package main

import (
    "github.com/PuerkitoBio/goquery"
    "fmt"
)

func main() {

    fmt.Println("処理実行")
    getBookList()
}

func getBookList(){

    doc, err := goquery.NewDocument("https://bookmeter.com/users/763253/books/wish")
    if err != nil {
        panic(err)
    }
    selection := doc.Find("div.detail__title").Find("a")
    selection.Each(func(index int, s *goquery.Selection) {
        // fmt.Println(s.Text())
        url, _ := s.Attr("href")
        fmt.Println(url)
        
    })
}

