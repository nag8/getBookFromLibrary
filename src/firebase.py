import firebase_admin
from firebase_admin import credentials
from firebase_admin import db



cred = credentials.Certificate("../config/serviceAccountKey.json")
firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://bookbook-eaf17.firebaseio.com/',
    'databaseAuthVariableOverride': {
        'uid': 'my-service-worker'
    }
})

books_ref = db.reference('/books')

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
    print(books_ref.get())
    
##データを取得する
def addBook():
    books_ref.child('testID').set({
        'date_of_birth': 'Aug 23, 1980',
        'full_name': 'Masuo Isono'
    })


# ##データを更新する
# updates = {}
# updates['/user001/full_name'] = 'Sazae Fuguta'
# users_ref.update(updates)
