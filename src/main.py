import firebase
import bookMeter
import library

def main():

    # updateFirebase()
    books = firebase.readBooks()
    for book in books:
        library.book(book)
        firebase.update(book)

def updateFirebase():
    books = bookMeter.getBooks()
    for book in books:
        firebase.addBook(book)
    
if __name__ == '__main__':
    main()
