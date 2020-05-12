import yaml
import time
from selenium import webdriver
from selenium.webdriver.support.ui import Select
import bs4
import logging
import traceback
from models import Book



def book(book):
    
    options = webdriver.ChromeOptions()
    driver = webdriver.Chrome(options=options)
    try:
        driver.get('https://web.oml.city.osaka.lg.jp/webopac/mobmopsre.do')
        driver.find_element_by_name('valclm2').send_keys(book.name)
        driver.find_element_by_name('valclm3').send_keys(book.auther)
        driver.find_element_by_name('catsrhform').submit()

        time.sleep(1)
        if 'ヒット件数が0件です。' in driver.page_source:
            book.status = Book.STATUS_NO_BOOK
            return book
        
        driver.find_element_by_name('ui-link-inherit').click()
        time.sleep(1)
        
        driver.find_element_by_class_name('ui-btn-hidden').click()
        
        
        
    except Exception as e:
        logging.error(traceback.format_exc())
    finally:
        driver.quit()
