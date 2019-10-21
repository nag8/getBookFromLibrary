package main

// Book 本の構造体
type Book struct {
	id, status int
	name       string
}

func newBook(id int, name string, status int) Book {
	b := new(Book)

	b.id = id
	b.name = name
	b.status = status

	return *b
}
