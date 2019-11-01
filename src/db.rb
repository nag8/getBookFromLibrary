# coding: UTF-8

require 'csv'
require './book'
require './main'

def readCSV

  config = getIniFile
  csv = CSV.open(config['db']['csv'])
  csv.readline

  csv.each do |row|
    book = Book.new(row[0], row[1], row[2])
  end
end

def writeCSV(bookList)
  
  config = getIniFile

  CSV.open(config['db']['csv'],'w') do |row|
    row << ["id","タイトル","ステータス"]
    bookList.each do |b|
      row << [b.getName, b.getStatus]
    end
   end
end

if __FILE__ == $0
  readCSV
end