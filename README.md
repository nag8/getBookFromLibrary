# getBookFromLibrary
 図書館の本を自動で予約する

## 仕様
- 大阪市図書館を想定

## 方法
### 1
1. 読書メーターの「[読みたい本](https://bookmeter.com/users/763253/books/wish)」から情報を[firebase](https://console.firebase.google.com/u/0/project/bookbook-eaf17/database/bookbook-eaf17/data)に転記
2. firebaseの未予約のものを予約

### 2
1. ユーザーが読書メーターの「[読みたい本](https://bookmeter.com/users/763253/books/wish)」に情報を登録
2. プログラムが「読みたい本」から[firebase](https://console.firebase.google.com/u/0/project/bookbook-eaf17/database/bookbook-eaf17/data)に情報を転記
3. プログラムがfirebaseから[カーリル](https://calil.jp/)に転記
4. 画面遷移に沿って予約
   
   
## memo
https://japan.flow.microsoft.com/manage/environments/406b1399-7294-4b63-9fc3-042173f84eb6/flows/df5d73b1-8368-41c9-81c1-1d850eff5e10/details
### ruby


### goLang
- https://qiita.com/kou_pg_0131/items/dab4bcbb1df1271a17b6
- https://qiita.com/Yaruki00/items/b50e346551690b158a79
- https://firebase.google.com/docs/admin/setup?authuser=0
- https://firebase.google.com/docs/firestore/quickstart?hl=ja

#### cmd
cd go
go run main.go book.go csv.go

### python
- https://github.com/nag8/mixiPhotoDL/blob/master/mixi.py

