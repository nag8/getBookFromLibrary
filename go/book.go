package main

// Book 本の構造体
type Book struct {
	id     int    `csv:"id"`
	name   string `csv:"name"`
	status int    `csv:"status"`
}

func newBook(id int, name string, status int) *Book {
	b := new(Book)
	b.id = id
	b.name = name
	b.status = status
	return b
}
