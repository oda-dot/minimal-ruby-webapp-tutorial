# todoapp Step 08 UPDATE & DELETE 機能

## 目的と成果物

### 目的
既存 Todo を編集・削除できるようにし、`Rack::MethodOverride` の仕組みを理解する。

### 成果物
views/edit.erb
views/index.erb (更新)
app.rb (更新)

## 作業

### 1. app.rb に UPDATE & DELETE ルートを追記
```bash
cursor app.rb   # ファイルを開き、コード例を貼り付けて保存
```

### app.rb 追記例
```ruby
# Rack::MethodOverride を有効化
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

### 2. edit.erb ビューを新規作成
```bash
touch views/edit.erb
cursor views/edit.erb   # コード例を保存
```

### views/edit.erb 例
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Todo編集</title>
</head>
<body>
  <h1>Todo編集</h1>
  <form action="/todos/<%= @todo.id %>" method="post">
    <input type="hidden" name="_method" value="patch">
    <div>
      <label for="title">タイトル</label>
      <input type="text" name="title" id="title" value="<%= @todo.title %>">
    </div>
    <div>
      <label>
        <input type="checkbox" name="done" <%= @todo.done ? 'checked' : '' %>>
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

### 3. index.erb を更新し Edit / Delete ボタンを追加
```bash
cursor views/index.erb  # コード例を貼り付けて保存
```

### views/index.erb (更新)
```erb
<tr>
  <td><%= todo.title %></td>
  <td><%= todo.done ? "完了" : "未完了" %></td>
  <td>
    <a href="/todos/<%= todo.id %>/edit">編集</a>
    <form action="/todos/<%= todo.id %>" method="post" style="display: inline">
      <input type="hidden" name="_method" value="delete">
      <button type="submit">削除</button>
    </form>
  </td>
</tr>
```

## ポイント解説
- HTML フォームは GET/POST しか送れない → hidden `_method` で `patch/delete` をエミュレート。
- `Rack::MethodOverride` がリクエスト変換を担当。

### 用語メモ
- **PATCH / DELETE**: HTTP メソッド。リソースの部分更新・削除を表す。
- **Rack::MethodOverride**: hidden `_method` パラメータなどをもとに HTTP メソッドを書き換える Rack ミドルウェア。

### app.rb 追記を分解してみよう
- `enable :method_override` : hidden フィールド `_method` を有効にするスイッチ。
- `get "/todos/:id/edit"` : id 付き URL で編集フォーム表示。
- `patch "/todos/:id"` : 更新。
- `delete "/todos/:id"` : 削除。

### views/edit.erb を分解してみよう
- `<input type="hidden" name="_method" value="patch" />` : 本当は 
PATCH を送りたい合図。
- チェックボックス `todo[done]` : true/false を DB の boolean に保
存。 

### 既存データの表示
- `value="<%= @todo.title %>"` で現在の値を表示
- `<%= @todo.done ? 'checked' : '' %>` で状態を反映

### 動作確認のポイント
1. [ ] 編集リンクをクリックして現在の値が表示される
2. [ ] 値を変更して更新ボタンを押すと反映される
3. [ ] 削除ボタンを押すとレコードが消える
4. [ ] タイトルを空にして更新するとエラーになる


## 動作確認
編集→保存で一覧が更新される。Delete ボタンで行が消える。

## Commit Point 🚩
```bash
git add app.rb views/edit.erb views/index.erb
git commit -m "STEP08: add update & delete actions with method_override"
```

## 理解チェック
- [ ] `Rack::MethodOverride` の役割を説明できる
- [ ] HTTPメソッドの使い分けを説明できる
- [ ] 異なる種類のパラメータを説明できる
- [ ] フォームの再利用方法を説明できる

## もっと詳しく

- Rack: https://rack.github.io/
- PATCH / DELETE が必要な理由（CRUD 完成）
- `method_override` ミドルウェアの役割を図解

AI への質問例
```
HTML フォームが GET と POST しか送れないのはなぜですか？

削除する前に確認ダイアログを表示するにはどうすればいいですか？
```