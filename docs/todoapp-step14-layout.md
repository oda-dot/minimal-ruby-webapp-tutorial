# Step 14: レイアウトテンプレートで共通部分を整理

## 目的
共通のHTMLを1箇所にまとめ、メンテナンス性を向上させる

## なぜレイアウトテンプレートを使うのか？
Step 13までの問題点：
- 各ビューファイルでHTMLの共通部分を重複して記述
- 全ページの共通デザインを変更する際に、全ファイルを修正する必要がある
- コードの重複により保守性が低下

## 作業手順

### 1. views/layout.erbの作成
```bash
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

  <footer class="container text-center text-muted py-4">
    <small>&copy; 2024 Todo App</small>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

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
    <thead class="table-light">
      <tr>
        <th>タイトル</th>
        <th>状態</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <% @todos.each do |todo| %>
        <tr>
          <td class="align-middle"><%= todo.title %></td>
          <td class="align-middle">
            <span class="badge <%= todo.done ? 'bg-success' : 'bg-danger' %>">
              <%= todo.done ? "完了" : "未完了" %>
            </span>
          </td>
          <td>
            <div class="btn-group" role="group">
              <a href="/todos/<%= todo.id %>/edit" class="btn btn-sm btn-outline-secondary">
                編集
              </a>
              <form action="/todos/<%= todo.id %>" method="post" style="display: inline">
                <input type="hidden" name="_method" value="delete">
                <button type="submit" class="btn btn-sm btn-outline-danger">削除</button>
              </form>
            </div>
          </td>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>
```

### 3. app.rbでタイトルを設定
```bash
cursor app.rb   # VS Code で開き、@titleを設定
```

```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

get "/" do
  @title = 'Todo 一覧'  # ページタイトルを設定
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

## 改善された点
1. **コードの重複削減**
   - HTMLの共通部分を1箇所で管理
   - 各ビューは本質的な内容のみに集中

2. **一貫性の向上**
   - ナビゲーションバーの追加
   - フッターの追加
   - 全ページで同じレイアウトを使用

3. **保守性の向上**
   - デザイン変更が1ファイルで完結
   - 新規ページ作成が容易に

4. **機能の追加**
   - 動的なタイトル設定
   - 共通のナビゲーション
   - コピーライト表示

## Step 13との比較
手作業で実装した機能との比較：

| 機能 | Step 13（個別ファイル） | Step 14（レイアウト） |
|-----|---------------------|-------------------|
| HTML共通部分 | 各ファイルで重複 | layout.erbで一元管理 |
| デザイン変更 | 全ファイル修正が必要 | 1ファイルの修正で完了 |
| ナビゲーション | なし / 個別に実装 | 共通で自動的に表示 |
| 新規ページ追加 | HTML全体を記述 | コンテンツのみ記述 |

## 次のステップのアイデア
1. **フラッシュメッセージ**
   - 操作の成功/失敗を表示
   - レイアウトで共通表示領域を用意

2. **部分テンプレート**
   - 繰り返し使用する要素を切り出し
   - より細かい単位での再利用

3. **アセットパイプライン**
   - JavaScript/CSSの管理
   - アセットの最適化

## Commit Point 🚩
```bash
git add views/layout.erb views/index.erb app.rb
git commit -m "STEP14: introduce layout template"
``` 