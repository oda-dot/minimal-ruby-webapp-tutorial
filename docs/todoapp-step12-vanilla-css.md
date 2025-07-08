# Step 12: バニラCSSでスタイリング

## 目的
HTMLの見た目を改善し、CSSの基本を学ぶ

## なぜバニラCSSから始めるのか？
- CSSの基本概念を理解できる
- スタイリングの仕組みを体験的に学べる
- 後のフレームワーク導入で感じる便利さの土台になる

## 作業手順

### 1. public/styles.cssの作成
```bash
mkdir -p public
touch public/styles.css
cursor public/styles.css   # VS Code で開き、下記内容を貼り付けて保存
```

### styles.css 例
```css
/* 全体のスタイル */
body {
  max-width: 800px;
  margin: 20px auto;
  font-family: sans-serif;
}

/* テーブルの基本スタイル */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

td {
  padding: 12px;
  border: 1px solid #ddd;
}

/* 新規作成リンク */
.new-link {
  display: inline-block;
  padding: 8px 16px;
  background: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  margin: 10px 0;
}

/* 完了状態の表示 */
.status {
  padding: 4px 8px;
  border-radius: 4px;
}

.status-done {
  background: #E8F5E9;
  color: #2E7D32;
}

.status-undone {
  background: #FFEBEE;
  color: #C62828;
}
```

### 2. views/index.erbの更新
```bash
cursor views/index.erb   # VS Code で開き、下記内容に更新
```

```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Todo List</title>
  <link rel="stylesheet" href="/styles.css">
</head>
<body>
  <h1>Todos</h1>
  <a href="/todos/new" class="new-link">新規作成</a>
  <table>
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td>
          <span class="status <%= todo.done ? 'status-done' : 'status-undone' %>">
            <%= todo.done ? "完了" : "未完了" %>
          </span>
        </td>
      </tr>
    <% end %>
  </table>
</body>
</html>
```

### 3. app.rbの更新
```bash
cursor app.rb   # VS Code で開き、public設定を追加
```

```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

# 静的ファイルの提供を有効化
set :public_folder, File.dirname(__FILE__) + '/public'

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

## 学んだこと
- CSSセレクタの使い方
- ボックスモデル（margin, padding, border）
- 色とコントラスト
- レイアウトの基本（中央寄せ、幅の設定）
- クラスによるスタイル分岐

## 次のステップで分かること
このステップで経験した手作業が、フレームワークでいかに簡単になるかを体験します：
- 手作業で書いたボタンスタイルが、クラス1つで実現できる
- 配色やデザインの一貫性が自動的に保たれる
- レスポンシブ対応が簡単になる

## Commit Point 🚩
```bash
git add public/styles.css app.rb views/index.erb
git commit -m "STEP12: add vanilla CSS styling"
``` 