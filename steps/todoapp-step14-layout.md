# todoapp Step 14 Layout Template で共通レイアウトを作成 🎨

## 🎯目的・成果物
### 目的
- 共通の HTML を 1 か所にまとめて、メンテしやすくします。

### 成果物
- `app.rb`（更新）
- `views/index.erb`（更新）
- `views/layout.erb`（新規）

## 🚀作業フロー

### 1. `views/layout.erb` を作成する
```bash
touch views/layout.erb
cursor views/layout.erb   # エディタで開いて下記をペースト
```
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><%= @title || 'Todo App' %></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container">
      <a class="navbar-brand" href="/">Todo App</a>
    </div>
  </nav>
  <div class="container">
    <%= yield %>
  </div>
</body>
</html>
```
- すべての画面で共通になる HTML をここに集約。
- `<nav>` でナビバー追加。ロゴをクリックすれば一覧 (`/`) へジャンプ。

### 2. `views/index.erb` をミニマム化
```bash
cursor views/index.erb   # 既存ファイルを以下に置き換え
```
```erb
<h1 class="mb-4">Todos</h1>
<div class="mb-4">
  <a href="/todos/new" class="btn btn-primary">
    <i class="bi bi-plus-circle"></i> 新規作成
  </a>
</div>

<div class="table-responsive">
  <table class="table table-hover">
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td>
          <span class="badge <%= todo.done ? 'bg-success' : 'bg-danger' %>">
            <%= todo.done ? '完了' : '未完了' %>
          </span>
        </td>
        <td>
          <a href="/todos/<%= todo.id %>/edit">編集</a>
          <form action="/todos/<%= todo.id %>" method="post" style="display: inline">
            <input type="hidden" name="_method" value="delete">
            <button type="submit">削除</button>
          </form>
        </td>
      </tr>
    <% end %>
  </table>
</div>
```
- `<head>` や `<body>` はレイアウトに任せ、ここでは「コンテンツ」だけ残す。

### 3. `app.rb` でタイトルをセット
```bash
cursor app.rb   # @title を設定
```
`get "/"` を次のように変更
```ruby
get "/" do
  @title = 'Todo 一覧'  # ページタイトル
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

## 💡ポイント解説
- **`yield`** は「ここにページ固有の HTML を差し込んで」の合図。
- レイアウト 1 枚でデザインを **一括管理** できるので、修正などメンテナンスが楽になる。
- `@title` を動的に渡せば、タブ名もページごとに変えられる。

### ページ表示の流れ
- yield は「ここにページ固有の HTML を挿入する」という合図。
- フレームワーク（Sinatra や Rails）は、アクション名や erb :index の引数から
　規約どおりのテンプレートファイル（例: views/index.erb）を自動で読み込む。
- 読み込んだテンプレートの出力をレイアウトにブロックとして渡し、
　<%= yield %> の位置で差し込む

### なぜレイアウトテンプレートを使うのか？
Step 13までの問題点：
- 各ビューファイルでHTMLの共通部分を重複して記述していた
- 全ページの共通デザインを変更する際に、全ファイルを修正する必要があった

## ✅動作確認
- [ ] 一覧ページのブラウザタブが「Todo 一覧」になっている
- [ ] どのページでもナビバーが表示されている

## 🚩Commit Point
```bash
git add views/layout.erb views/index.erb app.rb
git commit -m "STEP14: introduce layout template"
```

## 📝理解チェック
- `yield` がどんな流れで差し込まれるかを説明できる

## 🔗もっと詳しく知りたいとき
- Sinatra 公式ドキュメント: Layouts & Rendering
- Bootstrap Navbar リファレンス

🤔 AI に聞いてみよう 🤖
```
yieldと書くだけで、ページごとに適切なviewが読み込まれる仕組みを詳しく教えてください。
```