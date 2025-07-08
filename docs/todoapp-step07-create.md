# todoapp Step 07 CREATE 機能

## 目的
フォームから Todo を新規登録できるようにする。

## 作業
### 1. app.rb に CREATE ルートを追記
```bash
code app.rb   # 既存ファイルを開き、末尾にコード例を貼り付け
```

### 2. new.erb ビューを作成
```bash
touch views/new.erb
code views/new.erb
```
> 下の「views/new.erb 例」をコピーして保存。

## ポイント解説
- `params[:todo]` はネストされたハッシュで受け取れる。
- バリデーションエラー時の再表示パターンを学ぶ。

## 動作確認
フォーム送信で一覧に追加されれば成功。

## 理解チェック
- [ ] `params` の構造を説明できる

## もっと詳しく
### 公式ドキュメント
- Sinatra Params: https://sinatrarb.com/intro.html#Parameters

### 検索キーワード例
```
sinatra nested params hash
activerecord validation errors sinatra
```

### AI への質問テンプレ
```
フォーム送信後に "Sinatra::NotFound" が出ます。
app.rb と new.erb を添付するので原因を教えてください。
```

### 用語メモ
- **フォーム (HTML form)**: ブラウザからサーバーへデータを送信する UI。
- **リダイレクト (redirect)**: サーバーがクライアントに別 URL へ移動するよう指示する応答。

## Commit Point 🚩
```bash
git add app.rb views/new.erb
git commit -m "STEP07: implement create action & form"
```

### 自分でやってみよう
- フォーム送信後、入力値が欠けているときにエラーメッセージを表示してみましょう。
- `required` 属性を HTML に付けてクライアント側で必須チェックを行う実験をしてみましょう。

### 完成コード例
new.erb と create ルートの完成版は docs/todoapp-final-code.md を参照してください。

### 深く理解するために
- HTTP メソッドと CRUD 対応表
- リダイレクト（POST-Redirect-GET）とは？

AI への質問例
```
リダイレクトを行うとブラウザ側では何が起こりますか？
```

### app.rb 追記を分解してみよう
- `get "/todos/new"` : 新規作成フォームを表示。
- `post "/todos"` : フォーム送信を受け取りレコード保存。
  - `Todo.new(params[:todo])` : 送られた値で Todo を作成。
  - `redirect "/"` : 保存できたら一覧へジャンプ。

### views/new.erb を分解してみよう
- `<form action="/todos" method="post">` : 送信先は `/todos`。POST で送る。
- `name="todo[title]"` : `params[:todo][:title]` という形で届くようキーをネスト。 

### app.rb 追記例
```ruby
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

### views/new.erb 例
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>New Todo</title>
</head>
<body class="p-4">
  <h1>New Todo</h1>
  <form action="/todos" method="post">
    <div>
      <label>Title</label>
      <input type="text" name="todo[title]" />
    </div>
    <div>
      <label>Description</label>
      <textarea name="todo[description]"></textarea>
    </div>
    <button class="btn btn-primary">Create</button>
  </form>
</body>
</html>
``` 