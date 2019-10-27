# coding: UTF-8

require './book'
require './web'
require './db'

def main
  p 'start...'
  bookList = getBookList
  bookBook bookList
  p 'end!'
end

def getBookList

  # TODO　spreadsheetから情報を取得


  # test
  book = Book.new(1, 'ミレニアム 復讐の炎を吐く女　下')
  puts book.getName
  bookList = [book]
end

if __FILE__ == $0
  main
end