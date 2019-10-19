import firebase_admin
from firebase_admin import credentials
from firebase_admin import db

cred = credentials.Certificate("path/to/serviceAccountKey.json")

firebase_admin.initialize_app(cred, {
    'databaseURL': 'https://<your database url>',
    'databaseAuthVariableOverride': {
        'uid': 'my-service-worker'
    }
})

##databaseに初期データを追加する
ref = db.reference('/book')

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

# # databaseにデータを追加する
# users_ref.child('user003').set({
#     'date_of_birth': 'Aug 23, 1980',
#     'full_name': 'Masuo Isono'
#     })

##データを取得する
print(ref.get())
