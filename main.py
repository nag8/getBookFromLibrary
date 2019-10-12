from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import configparser
import urllib.request

# 設定ファイル取得
def getIniFile():
    iniFile = configparser.ConfigParser()
    iniFile.read('./config.ini', 'UTF-8')
    return iniFile

# chromeを準備
def initDriver(iniFile):

    # driverを定義
    options = webdriver.ChromeOptions()

    #プロファイル場所を定義
    options.add_argument('--user-data-dir=' + iniFile.get('settings', 'user-data-dir'))
    return webdriver.Chrome(options=options)

# 写真IDのリストを取得
def getKeyList(iniFile):
    keyList = []
    with open(iniFile.get('settings', 'READFILE'),'r') as f:
        line = f.readline()
        while line:
            keyList.append(line.strip())
            line = f.readline()

    return keyList

# メイン処理
def main():

    # 設定ファイル取得
    iniFile = getIniFile()

    # chrome画面を準備
    driver = initDriver(iniFile)
    

    # 終了
    driver.quit()
    exit()


if __name__ == '__main__':
    main()

