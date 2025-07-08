# todoapp Step 07 CREATE 機能

## 目的と成果物

### 目的
フォームから Todo を新規登録できるようにする。

### 成果物
- views/new.erb (新規)
- app.rb (更新)


## 作業
### 1. app.rb に CREATE ルートを追記
```bash
cursor app.rb   # 既存ファイルを開き、末尾にコード例を貼り付け
```

```ruby
# ...省略

get "/todos/new" do
  @todo = Todo.new
  erb :new
end

post "/todos" do
  @todo = Todo.new(params[:todo])
  if @todo.save
    redirect "/"
  else
    erb :new
  end
end

```

### 2. views/new.erb を作成
```bash
touch views/new.erb
cursor views/new.erb   # VS Code で開き、下記内容を貼り付けて保存
```

```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新規Todo作成</title>
</head>
<body>
  <h1>新規Todo作成</h1>
  <form action="/todos" method="post">
    <div>
      <label for="title">タイトル</label>
      <input type="text" name="todo[title]" id="title">
    </div>
    <div>
      <label>
        <input type="checkbox" name="todo[done]">
        完了
      </label>
    </div>
    <div>
      <button type="submit">作成</button>
      <a href="/">戻る</a>
    </div>
  </form>
</body>
</html>
```


## ポイント解説
- `params[:todo]` はネストされたハッシュで受け取れる。

### 用語メモ
- **フォーム (HTML form)**: ブラウザからサーバーへデータを送信する 
UI。
- **リダイレクト (redirect)**: サーバーがクライアントに別 URL へ移動す
るよう指示する応答。

### フォームの基本
- `<form>` の `action` 属性：投稿先のURL
- `<form>` の `method` 属性：HTTPメソッド（post）
- `<input>` の `name` 属性：パラメータのキー名
- `<label>` の `for` 属性：対応する入力要素のid

### app.rb 追記を分解してみよう
- `get "/todos/new"` : 新規作成フォームを表示。
- `post "/todos"` : フォーム送信を受け取りレコード保存。
  - `Todo.new(params[:todo])` : 送られた値で Todo を作成。
  - `redirect "/"` : 保存できたら一覧へジャンプ。

### views/new.erb を分解してみよう
- `<form action="/todos" method="post">` : 送信先は `/todos`。POST で送る。
- `name="todo[title]"` : `params[:todo][:title]` という形で届くようキーをネスト。 


## 動作確認

`bundle exec rackup`でサーバーを起動し、ブラウザで確認

1. [ ] 新規作成リンクをクリックしてフォームを表示
2. [ ] タイトルを入力して作成ボタンを押す
3. [ ] 一覧に戻り、新しいTodoが表示される
4. [ ] タイトルを空にして作成すると一覧に戻らない、作成されない

## Commit Point 🚩
```bash
git add app.rb views/new.erb
git commit -m "STEP07: implement create action & form"
```

## 理解チェック
- [ ] `params` の構造を説明できる
- [ ] フォームのHTMLを説明できる
- [ ] パラメータの受け取り方を説明できる
- [ ] リダイレクトの使い方を説明できる

## もっと詳しく

- Sinatra Params: https://sinatrarb.com/intro.html#Parameters
- HTTP メソッドと CRUD 対応表
- リダイレクト（POST-Redirect-GET）とは？

AI への質問例
```
バリデーションエラー時に、入力した値を残すにはどうすればいいですか？

バリデーションエラー時にエラーをユーザーに伝えるにはどうすればよいですか？
```
