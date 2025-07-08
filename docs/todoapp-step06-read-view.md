# todoapp Step 06 READ ルート + ビュー

## 目的
一覧ページを作成し、DB のレコードをブラウザに表示する。

## 作業
```bash
# app.rb を作成

touch app.rb
code app.rb   # VS Code で開き、下記内容を貼り付けて保存

mkdir -p views

touch views/index.erb
code views/index.erb   # VS Code で開き、下記内容を貼り付けて保存

# config.ru を上書きして app.rb をロード
code config.ru   # VS Code で開き、下記内容を貼り付けて保存
```

### app.rb を分解してみよう
| 行 | 説明 |
|----|------|
| `require "sinatra"` | Sinatra 本体を読み込む |
| `require "sinatra/activerecord"` | DB 橋渡し機能を追加 |
| `require_relative "models/todo"` | 作った `Todo` クラスを読み込む |
| `get "/" do ... end` | `/` に来たらブロックを実行 |
| `@todos = Todo.order(...)` | DB から Todo を取り出し日時順に並べる |
| `erb :index` | `views/index.erb` を使って表示 |

### views/index.erb を分解してみよう
- `<% @todos.each do |todo| %>` : Ruby でループ開始。
- `<%= todo.title %>` : 変数を **表示(=)** する。
- `✅ / ❌` : 完了フラグをアイコンで表現。
- <!-- Edit/Delete 機能は STEP08 で追加します -->

### app.rb 例
```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
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

## ポイント解説
- `erb :index` は `views/index.erb` をレンダリング。
- `@todos` はコントローラからビューへ渡るインスタンス変数。

## 動作確認
`bundle exec rackup` → ブラウザに Todo 一覧が表示される。

## 理解チェック
- [ ] MVC の役割分担を説明できる

## もっと詳しく
### 公式ドキュメント
- Sinatra Views: https://sinatrarb.com/intro.html#Views%20/%20Templates

### 検索キーワード例
```
sinatra erb instance variable nil
bootstrap table styling sinatra
```

### AI への質問テンプレ
```
`@todos` がビューで nil になってしまいます。
app.rb と index.erb のコードを添付するので原因を教えてください。
```

### 用語メモ
- **ビュー (View)**: 画面表示を担当する層。HTML + Embedded Ruby (ERB)。
- **インスタンス変数 (@)**: ビューに値を渡すためのローカル変数。

## Commit Point 🚩
```bash
git add app.rb views/index.erb
git commit -m "STEP06: list todos with erb view"
```

### 自分でやってみよう
- Bootstrap クラスを変更してデザインをカスタマイズしてみましょう。
- `@todos` の並び順を昇順に変えてみて、SQL がどう変化するか確認しましょう。

### 完成コード例
app.rb と index.erb の完成版は docs/todoapp-final-code.md を参照してください。

### 深く理解するために
- ERB 基本文法チートシート
- Sinatra で layout.erb を使う方法
- Bootstrap テーブルのカスタマイズ例

AI への質問例
```
layout.erb を使うと複数ページでどんなメリットがありますか？
```

### config.ru (更新後)
```ruby
require_relative "./app"
run Sinatra::Application
``` 