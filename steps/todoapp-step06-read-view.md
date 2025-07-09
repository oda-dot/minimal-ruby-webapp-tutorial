# todoapp Step 06 READ ルート + ビュー

## 目的と成果物

### 目的
一覧ページを作成し、DB のレコードをブラウザに表示する。

### 成果物
views/index.erb
app.rb (更新)
config.ru (更新)

## 作業

### 1. app.rb を更新してルーティングを追加
```bash
cursor app.rb   # VS Code で開き、下記内容に更新して保存
```

### app.rb 例 (まずは require_relative なしで)
```ruby
require "sinatra"
require "sinatra/activerecord"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

### 2. config.ru を更新して app.rb を読み込む
```bash
cursor config.ru   # VS Code で開き、下記内容に更新して保存
```

### config.ru 例 (更新後)
```ruby
require_relative "./app"
run Sinatra::Application
```

### 3. 一度実行してエラーを確認（その1）
```bash
bundle exec rackup
```
ブラウザで `http://localhost:4567` にアクセスすると **エラーが発生** します。

期待するエラー: `NameError: uninitialized constant Todo`

### 4. エラーの原因を理解して修正（その1）
エラーの意味: `Todo` クラスが見つからない
→ models/todo.rb を読み込んでいないため

```bash
cursor app.rb   # VS Code で開き、require_relative を追加
```

### app.rb 例 (修正後)
```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

### 5. 再度実行してエラーを確認（その2）
```bash
bundle exec rackup
```
ブラウザで `http://localhost:4567` にアクセスすると **新しいエラーが発生** します。

期待するエラー: `Errno::ENOENT: No such file or directory @ rb_sysopen - /path/to/views/index.erb`

### 6. エラーの原因を理解して修正（その2）
エラーの意味: `views/index.erb` ファイルが見つからない
→ ビューファイルをまだ作成していないため

### 7. ビュー用ディレクトリとindex.erbを作成
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
  <meta charset="utf-8">
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

### 8. Step 05 のモデルを Web アプリ用に調整
```bash
cursor models/todo.rb   # VS Code で開き、require 文を削除して保存
```

### models/todo.rb 例 (require 文を削除)
```ruby
class Todo < ActiveRecord::Base
  validates :title, presence: true
end
```
> **なぜ削除？**: app.rb で先に `require "sinatra/activerecord"` して、その後に `require_relative "models/todo"` で読み込むため。読み込まれる時点で ActiveRecord は既に使える状態になっています。

 

## ポイント解説
- `erb :index` は `views/index.erb` をレンダリング。
- `@todos` はコントローラからビューへ渡るインスタンス変数。
- `require_relative` でプロジェクト内のファイルを相対パスで読み込む。

### 用語メモ
- **ルーティング (Routing)**: URL のパスと HTTP メソッドの組み合わせで、どの処理を実行するかを決める仕組み。
- **ビュー (View)**: 画面表示を担当する層。HTML + Embedded Ruby (ERB)。
- **インスタンス変数 (@)**: ビューに値を渡すためのローカル変数。
- **require_relative**: 相対パスでファイルを読み込む Ruby のメソッド。現在のファイルから見た位置を指定。
- **NameError**: クラスや定数が見つからない時に発生するエラー。


### エラー駆動学習のポイント
- **エラーメッセージを読む習慣**:
  - `uninitialized constant` = 「定義されていない定数」
  - `No such file or directory` = 「ファイルが見つからない」
- **原因の推測**:
  - Todo クラスが見つからない → ファイルが読み込まれていない
  - index.erb が見つからない → ビューファイルがまだ存在しない
- **解決方法の検索**:
  - require と require_relative の違いを調べる
  - Sinatra のビューの配置場所を確認する
- **依存関係の理解**:
  - app.rb で ActiveRecord を読み込むため、models では不要になる
  - Sinatra は views ディレクトリ内のビューファイルを探す

### app.rb を分解してみよう
| 行 | 説明 |
|----|------|
| `require "sinatra"` | Sinatra 本体を読み込む |
| `require "sinatra/activerecord"` | DB 橋渡し機能を追加 |
| `require_relative "models/todo"` | 作った `Todo` クラスを読み込む |
| `get "/" do ... end` | **ルーティング**: ブラウザが `/` にアクセスした時の処理を定義 |
| `@todos = Todo.order(...)` | DB から Todo を取り出し日時順に並べる |
| `erb :index` | `views/index.erb` を使って表示 |

### ルーティングを分解してみよう
- `get` : HTTP の GET メソッド（ブラウザで普通にアクセスする方法）
- `"/"` : URL のパス部分。`http://localhost:4567/` の `/` に対応
- `do ... end` : このパスにアクセスされた時に実行する処理のブロック

### config.ru の変更を分解してみよう
- **Step 03**: `run ->(env) { ... }` で固定文字列 "Hello Sinatra !" を返す
- **Step 06**: `require_relative "./app"` + `run Sinatra::Application` で app.rb のルーティングを使用
- この変更により、複数のルート（URL パス）を app.rb で管理できるようになる

### require_relative を分解してみよう
- `require_relative "models/todo"` : 現在のファイル（app.rb）から見て `models/todo.rb` を読み込む。
- 絶対パスではなく **相対パス** なので、プロジェクトの構造が分かりやすい。
- Step 05 で作ったモデルをアプリケーションで使えるようにする橋渡し。

### views/index.erb を分解してみよう
- `<% @todos.each do |todo| %>` : Ruby でループ開始。
- `<%= todo.title %>` : 変数を **表示(=)** する。
- `<%= todo.done ? "完了" : "未完了" %>` : doneフラグによって表示分け。

## 動作確認
`bundle exec rackup` → ブラウザに Todo 一覧が表示される。

## Commit Point 🚩
```bash
git add models/todo.rb app.rb views/index.erb config.ru
git commit -m "STEP06: list todos with erb view"
```

## 理解チェック
- [ ] MVC の役割分担を説明できる
- [ ] require_relative の役割を説明できる
- [ ] NameError の意味を説明できる

## もっと詳しく

- Sinatra Views: https://sinatrarb.com/intro.html#Views%20/%20Templates
- ERB 基本文法チートシート

AI への質問例
```

```