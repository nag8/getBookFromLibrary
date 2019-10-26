# coding: UTF-8

require './book'

require 'selenium-webdriver'
require 'yaml'
require 'logger'

@wait_time = 3 
@timeout = 4
# TODO 設定ファイルに移す
LIBRARY_NANIWA = '59'

STATUS_SUCCESS  = 1
STATUS_MULTIPLE = 2
STATUS_ERROR    = 3

def getIniFile
    config = YAML.load_file("./config/config.yml")
    return config
end

def initDriver
    Selenium::WebDriver.logger.output = File.join("./", "selenium.log")
    Selenium::WebDriver.logger.level = :warn
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = @timeout
    wait = Selenium::WebDriver::Wait.new(timeout: @wait_time)
    return driver
end

def bookBook(bookList)

    config = getIniFile()
    driver = initDriver()

    for book in bookList

        begin
            driver.get('https://web.oml.city.osaka.lg.jp/webopac/mobmopsre.do')

            driver.find_element(:name, 'valclm2').send_keys book.getName
            driver.find_element(:class, 'ui-btn-hidden').click
            # sleep 2

            # 書類詳細画面
            # TODO 候補が複数あった場合以下のクラスは存在しない（はず）。そのため、if文で予約に進ませないようにする仕組みが必要
            if false then
                status = STATUS_MULTIPLE
            else
                driver.find_element(:class, 'ui-btn-hidden').click

                # ログイン画面
                # TODO 2回目以降スキップ？
                if true then
                    driver.find_element(:name, 'userid').send_keys config['login']['id']
                    driver.find_element(:name, 'password').send_keys config['login']['password']
                    driver.find_element(:class, 'ui-btn-hidden').click
                end

                # 予約確認画面
                select = Selenium::WebDriver::Support::Select.new(driver.find_element(:name, 'hopar'))
                select.select_by(:value, LIBRARY_NANIWA)
                # driver.find_element(:class, 'ui-btn-hidden').click

                status = STATUS_SUCCESS
            end
        rescue
            status = STATUS_ERROR
        end
    end

    driver.quit
end