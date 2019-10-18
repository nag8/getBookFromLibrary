from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import configparser
import urllib.request

def getIniFile():
    iniFile = configparser.ConfigParser()
    iniFile.read('./config.ini', 'UTF-8')
    return iniFile

def initDriver(iniFile):

    options = webdriver.ChromeOptions()

    options.add_argument('--user-data-dir=' + iniFile.get('settings', 'user-data-dir'))
    return webdriver.Chrome(options=options)

def getKeyList(iniFile):
    keyList = []
    with open(iniFile.get('settings', 'READFILE'),'r') as f:
        line = f.readline()
        while line:
            keyList.append(line.strip())
            line = f.readline()

    return keyList

def main():

    iniFile = getIniFile()

    driver = initDriver(iniFile)
    

    driver.quit()
    exit()


if __name__ == '__main__':
    main()

