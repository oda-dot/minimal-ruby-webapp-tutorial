# Step 14: レイアウトテンプレートで共通部分を整理

## 目的と成果物

### 目的
共通のHTMLを1箇所にまとめ、メンテナンス性を向上させる

### 成果物
app.rb（更新）
views/index.erb（更新）
views/layout.erb

## 作業手順

### 1. views/layout.erbの作成
```bash
touch views/layout.erb
cursor views/layout.erb   # VS Code で開き、下記内容を貼り付けて保存
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

- 全ての画面共通で必要な要素を書いています。
- `<nav>`でナビゲーションバーを追加しました。UIがよくなります。「Todo App」部分クリックすると、一覧画面（ルートページ：`/`）に遷移します。

### 2. views/index.erbの簡略化
```bash
cursor views/index.erb   # VS Code で開き、下記内容に更新
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
            <%= todo.done ? "完了" : "未完了" %>
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

- `<head>`や`<body>`などを削除して簡略化されました。

### 3. app.rbでタイトルを設定
```bash
cursor app.rb   # VS Code で開き、@titleを設定
```

`get "/"`に`@tile`を設定します。
この`@title`の値が`views/layout.erb`の`@title`部分に入ってきます。

```ruby
get "/" do
  @title = 'Todo 一覧'  # ページタイトルを設定
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```
## ポイント解説

### ページ表示の流れ
- yield は「ここにページ固有の HTML を挿入する」という合図。
- フレームワーク（Sinatra や Rails）は、アクション名や erb :index の引数から
　規約どおりのテンプレートファイル（例: views/index.erb）を自動で読み込む。
- 読み込んだテンプレートの出力をレイアウトにブロックとして渡し、
　<%= yield %> の位置で差し込む

### なぜレイアウトテンプレートを使うのか？
Step 13までの問題点：
- 各ビューファイルでHTMLの共通部分を重複して記述
- 全ページの共通デザインを変更する際に、全ファイルを修正する必要がある
- コードの重複により保守性が低下

### 改善された点
1. **コードの重複削減**
   - HTMLの共通部分を1箇所で管理
   - 各ビューは本質的な内容のみに集中

2. **一貫性の向上**
   - ナビゲーションバーの追加
   - 全ページで同じレイアウトを使用

3. **保守性の向上**
   - デザイン変更が1ファイルで完結
   - 新規ページ作成が容易に

4. **機能の追加**
   - 動的なタイトル設定
   - 共通のナビゲーション
   - コピーライト表示

### Step 13との比較
手作業で実装した機能との比較：

| 機能 | Step 13（個別ファイル） | Step 14（レイアウト） |
|-----|---------------------|-------------------|
| HTML共通部分 | 各ファイルで重複 | layout.erbで一元管理 |
| デザイン変更 | 全ファイル修正が必要 | 1ファイルの修正で完了 |
| ナビゲーション | なし / 個別に実装 | 共通で自動的に表示 |
| 新規ページ追加 | HTML全体を記述 | コンテンツのみ記述 |

## 動作確認

- [ ] 一覧画面を開いたとき、ページタイトル（ブラウザタブに表示されるページ名）が「Todo一覧」になっている
- [ ] 一覧画面以外でも、ナビゲーションバーが表示される

## Commit Point 🚩
```bash
git add views/layout.erb views/index.erb app.rb
git commit -m "STEP14: introduce layout template"
``` 

## 理解度チェック

- [ ] ページ表示の流れを説明できる

## もっと詳しく
- 

AIへの質問例
```
yieldと書くだけで、ページごとに適切なviewが読み込まれる仕組みを詳しく教えてください。
```