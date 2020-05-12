import firebase
import bookMeter

def main():
    
    updateFirebase()
    
    
    
def updateFirebase():
    books = bookMeter.getBooks()
    for book in books:
        firebase.addBook(book)
    
    
if __name__ == '__main__':
    main()
