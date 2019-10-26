# coding: UTF-8

# require './book'

require 'selenium-webdriver'
require 'yaml'

@wait_time = 3 
@timeout = 4

def main
    '処理開始'
    config = getIniFile()
    driver = initDriver()
    bookBook(config, driver)
end

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

def bookBook(config, driver)

    driver.get('https://web.oml.city.osaka.lg.jp/webopac/mobmopsre.do')
    sleep 2

    # driver.find_element(:name, 'valclm2').send_keys config['login']['id']

    driver.find_element(:name, 'valclm2').send_keys '生活者の平成30年'
    driver.find_element(:class, 'ui-btn-hidden').click

    sleep 2
    driver.find_element(:class, 'ui-btn-hidden').click


    # ドライバーを閉じる
    # driver.quit
end

if __FILE__ == $0
    main
end