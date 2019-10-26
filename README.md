# getBookFromLibrary
 図書館の本を自動で予約する

## 仕様
- 大阪市図書館を想定

## 方法
1. ユーザーがブクログの「[読みたい本](https://booklog.jp/users/35d54b5702603b20)」に情報を登録
2. [microsoft flow](https://japan.flow.microsoft.com/manage/environments/406b1399-7294-4b63-9fc3-042173f84eb6/flows/df5d73b1-8368-41c9-81c1-1d850eff5e10/details)が読書メーターの投稿twitterから[google spreadsheet](https://docs.google.com/spreadsheets/d/1dtuq7_muh5k2opEVKz-ODfkuSRDsAacGyW8upmADv3w/edit?usp=sharing)に転記
3. 当プログラムがspreadsheetから図書館サイトに転記
4. 画面遷移に沿って予約


## memo
https://github.com/nag8/getBookFromLibrary/blob/ruby/README.md

### ruby
```
cd src
ruby main.rb
```

- https://qiita.com/tomerun/items/9cb81d7a98150ff22f53
