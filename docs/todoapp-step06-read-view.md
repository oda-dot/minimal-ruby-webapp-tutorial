# todoapp Step 06 READ ルート + ビュー

## 目的と成果物

### 目的
一覧ページを作成し、DB のレコードをブラウザに表示する。

### 成果物
views/index.erb
app.rb (更新)
config.ru (更新)

## 作業

### 1. app.rb を更新してルーティングとモデル読み込みを追加
```bash
cursor app.rb   # VS Code で開き、下記内容に更新して保存
```

### app.rb 例 (更新後)
```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

### 2. ビュー用ディレクトリとindex.erbを作成
```bash
mkdir -p views

touch views/index.erb
cursor views/index.erb   # VS Code で開き、下記内容を貼り付けて保存
```

### views/index.erb 例
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Todo List</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
</head>
<body class="p-4">
  <h1>Todos</h1>
  <a href="/todos/new" class="btn btn-primary mb-3">New</a>
  <table class="table">
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td><%= todo.done ? "✅" : "❌" %></td>
      </tr>
    <% end %>
  </table>
</body>
</html>
```

### 3. config.ru を更新して app.rb をロード
```bash
cursor config.ru   # VS Code で開き、下記内容に更新して保存
```

### config.ru 例 (更新後)
```ruby
require_relative "./app"
run Sinatra::Application
``` 

## ポイント解説
- `erb :index` は `views/index.erb` をレンダリング。
- `@todos` はコントローラからビューへ渡るインスタンス変数。
- `require_relative` でプロジェクト内のファイルを相対パスで読み込む。

### 用語メモ
- **ビュー (View)**: 画面表示を担当する層。HTML + Embedded Ruby (ERB)。
- **インスタンス変数 (@)**: ビューに値を渡すためのローカル変数。
- **require_relative**: 相対パスでファイルを読み込む Ruby のメソッド。現在のファイルから見た位置を指定。

### app.rb を分解してみよう
| 行 | 説明 |
|----|------|
| `require "sinatra"` | Sinatra 本体を読み込む |
| `require "sinatra/activerecord"` | DB 橋渡し機能を追加 |
| `require_relative "models/todo"` | 作った `Todo` クラスを読み込む |
| `get "/" do ... end` | `/` に来たらブロックを実行 |
| `@todos = Todo.order(...)` | DB から Todo を取り出し日時順に並べる |
| `erb :index` | `views/index.erb` を使って表示 |

### require_relative を分解してみよう
- `require_relative "models/todo"` : 現在のファイル（app.rb）から見て `models/todo.rb` を読み込む。
- 絶対パスではなく **相対パス** なので、プロジェクトの構造が分かりやすい。
- Step 05 で作ったモデルをアプリケーションで使えるようにする橋渡し。

### views/index.erb を分解してみよう
- `<% @todos.each do |todo| %>` : Ruby でループ開始。
- `<%= todo.title %>` : 変数を **表示(=)** する。
- `✅ / ❌` : 完了フラグをアイコンで表現。

## 動作確認
`bundle exec rackup` → ブラウザに Todo 一覧が表示される。

## Commit Point 🚩
```bash
git add app.rb views/index.erb config.ru
git commit -m "STEP06: list todos with erb view"
```

## 理解チェック
- [ ] MVC の役割分担を説明できる
- [ ] require_relative の役割を説明できる

## もっと詳しく

- Sinatra Views: https://sinatrarb.com/intro.html#Views%20/%20Templates
- ERB 基本文法チートシート
- Sinatra で layout.erb を使う方法
- Bootstrap テーブルのカスタマイズ例

AI への質問例
```
layout.erb を使うと複数ページでどんなメリットがありますか？
```