# 📄 todoapp Step 06 READ ルート + ビュー

一覧ページを作成し、データベース内の Todo をブラウザに表示するステップです。MVC の "V" (View) にあたる部分が出てきます。

---

## 🎯 目的と成果物

### 目的
- `/` ルートを実装して Todo 一覧を表示する。
- 初めて ERB ビューを使う。
- エラー駆動で問題を切り分けるコツを学ぶ。

### 成果物
- `app.rb` (更新)
- `config.ru` (更新)
- `views/index.erb`

---

## 🚀 作業フロー

### 1. app.rb に一覧ルートを追加する（意図的に不完全な状態にしてます）
```bash
cursor app.rb
```
```ruby
require "sinatra"
require "sinatra/activerecord"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

> **ポイント**: 本来はここでは `require_relative "models/todo"` を書くのですが、今回はあえて書かないことで、発生するエラーを見てみます。

---

### 2. config.ru を app.rb 方式へ切り替える
```bash
cursor config.ru
```
```ruby
require_relative "./app"
run Sinatra::Application
```

### 3. サーバーを起動し初回エラーを確認する
```bash
bundle exec rackup
```
ブラウザで `http://localhost:9292` を開くと、`NameError: uninitialized constant Todo` が確認できるはずです。

### 4. エラーを解決する
- **原因**: `Todo` クラスが読み込まれていない。`Todo`を使っているのに、そんなの見つからないよということです。`models/todo`ファイルが読み込まれていないと推測できます。
- **対応**: `app.rb` を開き、先頭付近に次の 1 行を追加して保存してみましょう。
  ```ruby
  require_relative "models/todo"
  ```

### 5. 再起動して次のエラーを確認する
今度は `views/index.erb` がないと怒られるはずです (`Errno::ENOENT`)。

- **原因**: index.erb が見つからない → ビューファイルがまだ存在しない
- **対応**: 次の手順でビューファイルを作成してみましょう。

### 6. ビューファイルを作成する


```bash
mkdir -p views
touch views/index.erb
cursor views/index.erb
```
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Todo List</title>
</head>
<body>
  <h1>Todos</h1>
  <a href="/todos/new">新規作成</a>
  <table>
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td><%= todo.done ? "完了" : "未完了" %></td>
      </tr>
    <% end %>
  </table>
</body>
</html>
```

もう一度、`bundle exec rackup`するとエラーが消えているはずです。

### 7. モデルの require を整理する (Step05 のおさらい)
`models/todo.rb` から `require "sinatra/activerecord"` を削除しておく。すでに削除済みならスキップ。


> app.rb で先に `require "sinatra/activerecord"` して、その
後に `require_relative "models/todo"` で読み込むため削除します。読み込まれる時点でActiveRecord は既に使える状態になっているため、重複して読み込む必要はありません。
---

## 🛠️ ファイルを分解してみよう

### app.rb
| 行 | 説明 |
|----|------|
| `require "sinatra"` | Sinatra 本体を読み込む |
| `require "sinatra/activerecord"` | DB 橋渡し機能を追加する |
| `require_relative "models/todo"` | モデルを読み込む |
| `get "/" do ... end` | ルーティング: `/` にアクセスしたときの処理 |
| `@todos = Todo.order(...)` | レコードを作成日時降順で取得する |
| `erb :index` | `views/index.erb` をテンプレートとしてレンダリングする |

### config.ru
- Rack アプリを起動するエントリポイント。
- `require_relative "./app"` で Sinatra アプリを読み込む。
- `run Sinatra::Application` で Rack ハンドラに渡す。

### views/index.erb
- `<% %>` Ruby 実行、`<%= %>` 変数表示。
- `@todos` インスタンス変数にコントローラでセットした値が使える。

---

## ✅ 動作確認
- `bundle exec rackup` → ブラウザに Todo 一覧が表示される。

---

## 🚩 Commit Point
```bash
git add app.rb models/todo.rb views/index.erb config.ru
git commit -m "STEP06: list todos with erb view"
```

---

## 📝 理解チェック
- [ ] MVC の各層 (Model / View / Controller) を説明できる。
- [ ] `require_relative` と `require` の違いを説明できる。
- [ ] エラー文 `uninitialized constant` が示す意味を説明できる。

---

## 🔗 もっと詳しく知りたいとき
- Sinatra Views: https://sinatrarb.com/intro.html#Views%20/%20Templates
- ERB チートシート: https://devhints.io/erb
- Ruby 変数スコープまとめ: https://docs.ruby-lang.org/ja/latest/doc/spec=2fvariables.html

---

🤔 AI に聞いてみよう 🤖
```
`erb :index` と `erb ":index"` の違いは？

`@todos` が空配列のときに表示を工夫するには？

ERB を Haml や Slim に置き換えるメリットは？
```
