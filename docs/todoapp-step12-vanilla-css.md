# Step 12: バニラCSSでスタイリング

## 目的と成果物

### 目的
- HTMLの見た目を改善し、CSSの基本を学ぶ

### 成果物
public/styles.css

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
  <a href="/todos/new">新規作成</a>
  <table>
    <% @todos.each do |todo| %>
      <tr>
        <td><%= todo.title %></td>
        <td>
          <span class="status <%= todo.done ? 'status-done' : 'status-undone' %>">
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
</body>
</html>
```

## ポイント解説

### 用語解説
- バニラ


## 動作確認
- [ ] 画面のレイアウトが反映された

## Commit Point 🚩
```bash
git add public/styles.css app.rb views/index.erb
git commit -m "STEP12: add vanilla CSS styling"
``` 

## 理解チェック
- [ ] `styles.css`に新規作成リンクのためのレイアウトが定義されていますが、まだ画面に反映されていないはずです。このレイアウトを画面に反映させるためにはどうすればよいでしょうか。正しく反映出来たらコミットしてください。

## もっと詳しく
- CSSセレクタの使い方
- ボックスモデル（margin, padding, border）
- 色とコントラスト
- レイアウトの基本（中央寄せ、幅の設定）
- クラスによるスタイル分岐

AI への質問例
```
border-radiusとは何ですか？

cssでの色の指定方法にはどのようなものがありますか？
```