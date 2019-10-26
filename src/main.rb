# coding: UTF-8

require './book'
require './scraping'

def main
    p 'start...'
    bookList = getBookList()
    bookBook(bookList)
    p 'end!'
end

def getBookList

    # TODO　spreadsheetから情報を取得

    # TODO　spreadsheetから情報を取得

    # test
    book = Book.new(1, '生活者の平成30年')
    puts book.getName
    return book
end

if __FILE__ == $0
    main
end