# coding: UTF-8

require './book'

require 'selenium-webdriver'
require 'yaml'
require 'logger'
require 'twitter'

@wait_time = 3 
@timeout = 4
# TODO 設定ファイルに移す
LIBRARY_NANIWA = '59'

def getIniFile
  YAML.load_file './config/config.yml'
end

def initDriver
  Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
  Selenium::WebDriver.logger.level = :warn
  driver = Selenium::WebDriver.for :chrome
  driver.manage.timeouts.implicit_wait = @timeout
  wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
  driver
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
        if true
        # if driver.find_element(:name, 'userid').displayed?
          driver.find_element(:name, 'userid').send_keys config['login']['id']
          driver.find_element(:name, 'password').send_keys config['login']['password']
          driver.find_element(:class, 'ui-btn-hidden').click
        end

        # 予約確認画面
        select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'hopar'))
        select.select_by(:value, LIBRARY_NANIWA)
        # driver.find_element(:class, 'ui-btn-hidden').click

        status = Book::STATUS_SUCCESS
      end
    rescue
      status = Book::STATUS_ERROR
    end
  end

  driver.quit
end

def initTwitter

  config = getIniFile

  client = Twitter::REST::Client.new do |c|
  c.consumer_key        = config['twitter']['consumerKey']
  c.consumer_secret     = config['twitter']['consumerSeacret']
  c.access_token        = config['twitter']['accessTocen']
  c.access_token_secret = config['twitter']['accessSeacret']
end

def get_tweets

  COUNT = 200

  # countに満たないtweet数でも、エラーは起きない
  epoc_count = (COUNT / 200) + 1

  tweets = [@client.user_timeline(count: 1)][0]
  epoc_count.times do
    @client.user_timeline(count: 200, max_id: tweets.last.id-1).each do |t|
      if tweets.count == count
        break
      end
      tweets << t
    end
  end

  # Array
  tweets.map! {|t| t.text}
end