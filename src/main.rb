# coding: UTF-8

require './book'
require './web'
require './db'

def main
  p 'start...'
  bookList = getBookList
  # bookBook bookList
  p 'end!'
end

def getBookList

  # TODO　spreadsheetから情報を取得
  unless ARGV[0] == nil
    book = Book.new(1, ARGV[0])
  else
    book = Book.new(1, 'Vue.js入門 基礎から実践アプリケーション開発まで')
  end
  bookList = [book]
end

if __FILE__ == $0
  main
end