from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import configparser
import urllib.request
# import firebase_admin
# from firebase_admin import credentials
# from firebase_admin import db

iniFile      = ''
bookList     = []

def main():

    iniFile = getIniFile()
    driver = initDriver(iniFile)
    
    driver.get('https://www.oml.city.osaka.lg.jp/?page_id=266')
    

    driver.quit()
    exit()

class Book():

    def __init__(self, name, status):
        self.name  = name
        self.status  = status

def getIniFile():
    iniFile = configparser.ConfigParser()
    iniFile.read('./config/config.ini', 'UTF-8')
    return iniFile

def initDriver(iniFile):

    options = webdriver.ChromeOptions()

    options.add_argument('--user-data-dir=' + iniFile.get('settings', 'USER_DIR'))
    return webdriver.Chrome(options=options)

def getBookList(iniFile):
    global bookList
    with open(iniFile.get('settings', 'READFILE'),'r') as f:
        line = f.readline()
        while line:
            bookList.append(line.strip())
            line = f.readline()
    Book
    return bookList

if __name__ == '__main__':
    main()

