# ✍️ todoapp Step 07 CREATE 機能

フォームから Todo を新規登録できるようにするステップです。今回は MVC の "C" (Controller) でデータを受け取り、DB へ保存します。

---

## 🎯 目的と成果物

### 目的
- 新規作成フォーム (`/todos/new`) を実装する。
- 送信されたパラメータを受け取り Todo を保存する。
- 保存後にトップページへリダイレクトする流れを理解する。

### 成果物
- `app.rb` (更新)
- `views/new.erb`

---

## 🚀 作業フロー

### 1. app.rb に CREATE ルートを追記する（まずはフォーム表示のみ）
```bash
cursor app.rb  # 末尾に以下を貼り付け
```
```ruby
# ... 既存コードの下に追記

get "/todos/new" do
  @todo = Todo.new
  erb :new
end
```

ここでは **POST ルートはまだ書いていない** ので、フォームを送信すると "No route matches POST /todos" のエラーが出るはずです。

### 2. views/new.erb を作成する
```bash
touch views/new.erb
cursor views/new.erb
```
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>新規Todo作成</title>
</head>
<body>
  <h1>新規Todo作成</h1>
  <form action="/todos" method="post">
    <div>
      <label for="title">タイトル</label>
      <input type="text" name="todo[title]" id="title" />
    </div>
    <div>
      <label>
        <input type="checkbox" name="todo[done]" />
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

### 3. サーバーを起動してフォームを開く
```bash
bundle exec rackup
```
- `http://localhost:9292/todos/new` を開きフォームが表示される。
- ボタンを押すと **`POST /todos` が見つからない** エラーになることを確認する。

### 4. POST ルートを追加してエラーを解決する
```bash
cursor app.rb  # 先ほどの get ルートの下に追記
```
```ruby
post "/todos" do
  @todo = Todo.new(params[:todo])
  if @todo.save
    redirect "/"
  else
    erb :new
  end
end
```

再起動してフォーム投稿→一覧にリダイレクトされること、タイトルが空だと再表示されることを確認する。

---

## 🛠️ ファイルを分解してみよう

### app.rb (新規ルート)
| 行 | 説明 |
|----|------|
| `get "/todos/new"` | 新規作成フォームを表示するルート |
| `post "/todos"` | フォーム送信を受け取り Todo を保存するルート |
| `@todo = Todo.new(params[:todo])` | 受け取ったパラメータをまとめてモデルへ渡す |
| `redirect "/"` | 保存成功時にトップへリダイレクトする |

### views/new.erb
- `<form action="/todos" method="post">` : 送信先 URL と HTTP メソッドを指定。
- `name="todo[title]"` のように書くことで `params[:todo][:title]` 形式で届く。
- バリデーションエラー時は同じテンプレートを再表示 (`erb :new`) してやり直しができる。

---

## ✅ 動作確認
1. `bundle exec rackup` でサーバー起動。
2. フォームからタイトルを入力して作成する → 一覧に表示される。
3. タイトルを空にして作成する → 同じ画面に戻り作成されない。

---

## 🚩 Commit Point
```bash
git add app.rb views/new.erb
git commit -m "STEP07: implement create action with form"
```

---

## 📝 理解チェック
- [ ] `params` ハッシュの構造を説明できる。
- [ ] POST 送信後にリダイレクトする理由 (PRG パターン) を説明できる。
- [ ] `redirect` と `erb` の違いを説明できる。

---

## 🔗 もっと詳しく知りたいとき
- Sinatra Params: https://sinatrarb.com/intro.html#Parameters
- POST-Redirect-GET パターン: https://en.wikipedia.org/wiki/Post/Redirect/Get
- HTML フォーム要素リファレンス: https://developer.mozilla.org/ja/docs/Web/HTML/Element/form

---

🤔 AI に聞いてみよう 🤖
```
バリデーションエラー時に、入力した値を残すにはどうすればいいですか？

バリデーションエラー時にエラーをユーザーに伝えるにはどうすればよいですか？
```
