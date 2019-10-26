require 'google_drive'

client_id     = 'xxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.apps.googleusercontent.com'
client_secret = 'xxxxxxx-xxxxxxxxxxxxxxxx'
refresh_token = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# 認証情報を生成する
credentials = Google::Auth::UserRefreshCredentials.new(client_id: client_id,
                                                       client_secret: client_secret,
                                                       refresh_token: refresh_token)

# セッションを生成する
session = GoogleDrive::Session.from_credentials(credentials)

# スプレッドシートIDを元にスプレッドシートを取得
spreadsheet_id = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
spreadsheet    = session.spreadsheet_by_key(spreadsheet_id)
p spreadsheet
# => #<GoogleDrive::Spreadsheet id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" title="スプレッドシートのタイトル">

# 全てのワークシートを配列で取得
worksheets = spreadsheet.worksheets
pp worksheets
# => [#<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート1">,
#     #<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート2">,
#     #<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート3">,
#     #<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート4">,
#     #<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート5">]

# ワークシートをシート名を元に取得
worksheet_title = 'シート1'
worksheet = spreadsheet.worksheet_by_title(worksheet_title)
p worksheet
# => #<GoogleDrive::Worksheet spreadsheet_id="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", gid="xxxxxxxxxx", title="シート1">

# 全ての行を取得
# ２次元配列で取得される
# 空のセルは空文字が入る
rows = worksheet.rows
pp rows
# => [["A1セル", "B1セル", "C1セル", "D1セル"],
#     ["A2セル", "B2セル", "C2セル", "D2セル"],
#     ["A3セル", "B3セル", "C3セル", ""]]

# セルから値を取得
p worksheet[1, 1]
# => "A1セル"

# セルに値を入力
# NOTE: worksheet.saveを実行しない限り、変更は保存されない
worksheet[1, 1] = 'hogehoge'
p worksheet[1, 1]
# => "hogehoge"

# 変更を保存
worksheet.save