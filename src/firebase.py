import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from models import Book



cred = credentials.Certificate("../config/serviceAccountKey.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://bookbook-eaf17.firebaseio.com/',
    'databaseAuthVariableOverride': {
        'uid': 'my-service-worker'
    }
})

# users_ref.set({
#     'user001': {
#         'date_of_birth': 'June 23, 1984',
#         'full_name': 'Sazae Isono'
#         },
#     'user002': {
#         'date_of_birth': 'December 9, 1995',
#         'full_name': 'Tama Isono'
#         }
#     })

# databaseにデータを追加する
# users_ref.child('user003').set({
#     'date_of_birth': 'Aug 23, 1980',
#     'full_name': 'Masuo Isono'
#     })

##データを取得する
def readBooks():
    books = db.reference('/books').order_by_child('status').equal_to(0).get()
    list = []
    for id in books:
        book = Book(
            id,
            books[id]['name'],
            books[id]['auther'],
            books[id]['status'])
        
        list.append(book)
    
    return list
    
##データを取得する
def addBook(book):
    ref = db.reference('/books/' + book.id)
    if ref.get() is None:
        ref.set({
            'name': book.name,
            'auther': book.auther,
            'status': book.status
        })


# ##データを更新する
# updates = {}
# updates['/user001/full_name'] = 'Sazae Fuguta'
# users_ref.update(updates)
