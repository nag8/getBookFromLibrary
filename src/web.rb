# coding: UTF-8

require './book'
require './main'

require 'selenium-webdriver'
require 'logger'

@wait_time = 3
@timeout = 4
# TODO 設定ファイルに移す
LIBRARY_NANIWA = '59'

def initDriver
  Selenium::WebDriver.logger.output = File.join("./log/", "selenium.log")
  Selenium::WebDriver.logger.level = :warn
  driver = Selenium::WebDriver.for :chrome
  driver.manage.timeouts.implicit_wait = @timeout
  wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
  driver
end

def getBookData

  config = getIniFile
  driver = initDriver

  driver.get 'https://bookmeter.com/users/763253/books/wish'

  begin

    wait.until { driver.find_elements('div.thumbnail__action > div').displayed? }
    elements = driver.find_elements('div.thumbnail__action > div')
    puts elements
    elements.each do |element|
      puts element.data-modal
    end
  rescue
    # TODO ログ出力
  end

  driver.quit
end

def bookBook(bookList)

  config = getIniFile
  driver = initDriver

  for book in bookList

    begin
      driver.get 'https://web.oml.city.osaka.lg.jp/webopac/mobmopsre.do'

      driver.find_element(:name, 'valclm2').send_keys book.getName
      driver.find_element(:class, 'ui-btn-hidden').click
      # sleep 2

      # 書類詳細画面
      # TODO 候補が複数あった場合以下のクラスは存在しない（はず）。そのため、if文で予約に進ませないようにする仕組みが必要
      if false
        status = Book::STATUS_MULTIPLE
      else
        driver.find_element(:class, 'ui-btn-hidden').click

        # ログイン画面
        if driver.find_elements(:name, 'userid').size >= 1
          driver.find_element(:name, 'userid').send_keys config['login']['id']
          driver.find_element(:name, 'password').send_keys config['login']['password']
          driver.find_element(:class, 'ui-btn-hidden').click
        end

        # 予約確認画面
        select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'hopar'))
        select.select_by(:value, LIBRARY_NANIWA)
        driver.find_element(:class, 'ui-btn-hidden').click

        # 最終確認画面
        driver.find_element(:class, 'ui-btn-hidden').click

        # TODO 完了画面の動作
        if false
          # 書籍検索画面へ
          driver.find_element(:class, 'ui-icon-search').click
        end

        status = Book::STATUS_RESERVED
      end
    rescue
      status = Book::STATUS_ERROR
    end
  end

  driver.quit
end

if __FILE__ == $0
  getBookData
end