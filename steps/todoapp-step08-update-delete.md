# 🔄 todoapp Step 08 UPDATE & DELETE 機能

既存 Todo を編集・削除できるようにするステップです。ここでは `Rack::MethodOverride` を活用してフォームから PATCH / DELETE メソッドをエミュレートします。

---

## 🎯 目的と成果物

### 目的
- Todo を更新 (PATCH)・削除 (DELETE) できるようにする。
- `Rack::MethodOverride` でフォーム制限を回避する仕組みを理解する。

### 成果物
- `views/edit.erb`
- `views/index.erb` (更新)
- `app.rb` (更新)

---

## 🚀 作業フロー

### 1. app.rb に UPDATE & DELETE ルートを追記する
```bash
cursor app.rb
```
```ruby
# --- ここを追記 ---
# Rack::MethodOverride を有効化（require の後あたり）
enable :method_override
use Rack::MethodOverride

get "/todos/:id/edit" do
  @todo = Todo.find(params[:id])
  erb :edit
end

patch "/todos/:id" do
  @todo = Todo.find(params[:id])
  if @todo.update(params[:todo])
    redirect "/"
  else
    erb :edit
  end
end

delete "/todos/:id" do
  Todo.find(params[:id]).destroy
  redirect "/"
end
```

### 2. edit.erb ビューを作成する
```bash
touch views/edit.erb
cursor views/edit.erb
```
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Todo編集</title>
</head>
<body>
  <h1>Todo編集</h1>
  <form action="/todos/<%= @todo.id %>" method="post">
    <input type="hidden" name="_method" value="patch" />
    <div>
      <label for="title">タイトル</label>
      <input type="text" name="todo[title]" id="title" value="<%= @todo.title %>" />
    </div>
    <div>
      <label>
        <input type="checkbox" name="todo[done]" <%= "checked" if @todo.done %> />
        完了
      </label>
    </div>
    <div>
      <button type="submit">更新</button>
      <a href="/">戻る</a>
    </div>
  </form>
</body>
</html>
```

### 3. index.erb に Edit / Delete ボタンを追加する
```bash
cursor views/index.erb
```
`<tr>` 内を次のように差し替える。
```erb
<tr>
  <td><%= todo.title %></td>
  <td><%= todo.done ? "完了" : "未完了" %></td>
  <td>
    <a href="/todos/<%= todo.id %>/edit">編集</a>
    <form action="/todos/<%= todo.id %>" method="post" style="display:inline">
      <input type="hidden" name="_method" value="delete" />
      <button type="submit">削除</button>
    </form>
  </td>
</tr>
```

---

## 💡 ポイント解説
| 項目 | 内容 |
|------|------|
| HTML フォーム | GET / POST しか送れないため hidden `_method` で PATCH / DELETE を指示する |
| `Rack::MethodOverride` | hidden フィールドや HTTP ヘッダを見てリクエストメソッドを書き換えるミドルウェア |
| `enable :method_override` | Sinatra で上記ミドルウェアを有効にするスイッチ |

### app.rb 追記を分解してみよう
- `get "/todos/:id/edit"` : 編集フォームを表示。
- `patch "/todos/:id"` : 更新処理。
- `delete "/todos/:id"` : 削除処理。

### views/edit.erb を分解してみよう
- `<input type="hidden" name="_method" value="patch" />` : 本当は PATCH を送りたい合図。
- チェックボックスの `checked` 属性で完了状態を反映する。

---

## ✅ 動作確認
1. 一覧ページの「編集」をクリックしてフォームに現在の値が入っているか確認する。
2. タイトルを変更し「更新」→ 一覧に反映される。
3. 「削除」ボタンを押す → レコードが消える。

---

## 🚩 Commit Point
```bash
git add app.rb views/edit.erb views/index.erb
git commit -m "STEP08: add update & delete actions with method_override"
```

---

## 📝 理解チェック
- [ ] `Rack::MethodOverride` の役割を説明できる。
- [ ] PATCH / DELETE を hidden フィールドで送る理由を説明できる。
- [ ] フォームの再利用テクニックを説明できる。

---

## 🔗 もっと詳しく知りたいとき
- Rack ミドルウェア入門: https://rack.github.io/
- PATCH / DELETE が必要な理由 (CRUD 完成): https://developer.mozilla.org/ja/docs/Web/HTTP/Methods
- method_override の実装コードを読む: https://github.com/rack/rack/blob/main/lib/rack/method_override.rb

---

🤔 AI に聞いてみよう 🤖
```
HTML フォームが GET と POST しか送れないのはなぜですか？

削除する前に確認ダイアログを表示するにはどうすればいいですか？

`enable :method_override` を require の後に書くべき理由は？
```