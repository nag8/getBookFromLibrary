# coding: UTF-8
import csv
import time
import requests
from bs4 import BeautifulSoup

require './book'
require './scraping'


# authenticity_tokenの取得
session = requests.session()
r = session.get('https://bookmeter.com/users/763253/books/wish')
soup = BeautifulSoup(r.text, "lxml")
auth_token = soup.find(attrs={'name': 'authenticity_token'}).get('value')
login_info['authenticity_token'] = auth_token


# login
res = session.post(url_login, data=login_info)
res.raise_for_status()


books_list = []
current_pagination = 1

# 読んだ本ページへ。URLは自分のやつを入れる
next_url = "https://bookmeter.com/users/117579/books/read?display_type=list"


while True:
    time.sleep(30)
    res = session.get(next_url)
    res.raise_for_status
    s = BeautifulSoup(res.text, "lxml")

    # 読んだ本の取得
    books_s = s.select("li.group__book")
    for b in books_s:
        t = b.find("div", class_="detail__title").find("a").string
        d = b.find("div", class_="detail__date").string
        a = b.find("ul", class_="detail__authors").find("a").string
        p = b.find("div", class_="detail__page").string

        l = Book(t,a,d,p)
        books_list.append(l)

    # 次のページが有るのか
    current_pagination = current_pagination + 1
    next_url = get_next_page(current_pagination,s)
    if next_url is not None:
        next_url = url_base + next_url
        continue
    break

# output
with open("book.csv", "w", newline="") as f:
    writer = csv.writer(f)
    for b in books_list:
        writer.writerow([b.readed_date, b.title,b.auther,b.page])
        print(b.title, b.auther, b.readed_date, b.page)
f.close()