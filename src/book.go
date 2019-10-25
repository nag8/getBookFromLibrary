package main

// Book 本の構造体
type Book struct {
	id     int    `CSV:"id"`
	name   string `CSV:"name"`
	status int    `CSV:"status"`
}

func newBook(id int, name string, status int) Book {
	b := new(Book)

	b.id = id
	b.name = name
	b.status = status

	return *b
}
