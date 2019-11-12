# coding: UTF-8

require './book'
require './web'
require './db'
require 'yaml'

def main
  p 'start...'
  bookList = getBookList
  bookBook bookList
  p 'end!'
end

def getBookList

  # TODO　spreadsheetから情報を取得
  unless ARGV[0] == nil
    book = Book.new(1, ARGV[0], Book::STATUS_YET)
  else
    book = Book.new(1, 'RSpecによるRailsテスト入門', Book::STATUS_YET)
  end
  bookList = [book]
end

def getIniFile
  YAML.load_file './config/config.yml'
end

if __FILE__ == $0
  main
end