import yaml
import requests
from bs4 import BeautifulSoup as bs
import re
from models import Book

def getBooks():
    with open('../config/config.yml', 'r') as yml:
        config = yaml.load(yml, Loader=yaml.SafeLoader)
        
    r = requests.get('https://bookmeter.com/users/' + str(config['bookMeter']['userID']) + '/books/wish')
    soup = bs(r.content, 'html.parser')
    divs = soup(attrs={'class':'detail__title'})
    books = []

    for div in divs:
        id = div.find('a').get('href').lstrip('/books/')
        
        r = requests.get('https://bookmeter.com/books/' + id)
        soup = bs(r.content, 'html.parser')
        book = Book(
            id,
            soup.find(attrs={'class':'inner__title'}).text,
            soup.find(attrs={'class':'header__authors'}).find('a').text)
        
        books.append(book)
    
    return books
