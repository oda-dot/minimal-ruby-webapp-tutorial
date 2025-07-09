# 🌐 todoapp Step 03 Sinatra "Hello"

Sinatra を起動し、ブラウザで "Hello" を表示してみるステップです。アプリが HTTP リクエストを受け取ってレスポンスを返す最小構成を体験します。

---

## 🎯 目的と成果物

### 目的
- Sinatra アプリを起動してブラウザ表示を確認する。
- Rack と Sinatra の関係を把握する。

### 成果物
- `app.rb`
- `config.ru`

---

## 🚀 作業フロー

### 1. app.rb を作成してエディタで開く
```bash
touch app.rb
cursor app.rb  # VS Code の場合は code app.rb
```
ファイルに下記をコピーして保存する。

```ruby
require "sinatra"

get "/" do
  "Hello Sinatra!"
end
```

### 2. config.ru を作成してエディタで開く
```bash
touch config.ru
cursor config.ru
```
下記を貼り付けて保存する。

```ruby
require_relative "./app"
run Sinatra::Application
```

### 3. サーバーを起動する
```bash
bundle exec rackup -p 9292
```
- 起動メッセージが表示されたら `http://localhost:9292` を開き、`Hello Sinatra!` と表示されることを確認する。
- サーバーの停止は `Ctrl + C`。

---

## 💡 ポイント解説
| 用語 | 意味 | ひとこと |
|------|------|-----------|
| Rack | Ruby Web サーバーインターフェースの標準仕様 | アプリと Web サーバーの“橋渡し” |
| Sinatra | Rack ベースの軽量 Web フレームワーク | ルーティングとビューをシンプルに実装できる |
| `config.ru` | Rack アプリを起動するスクリプト | Puma や Rackup がこのファイルを読む |
| `rackup` | `config.ru` を読み込んで Rack アプリを起動する CLI | デフォルトポートは 9292 |

### config.ru を分解してみる
- `require_relative "./app"` : Sinatra アプリ (`app.rb`) を読み込む。
- `run Sinatra::Application` : Sinatra が自動生成した Rack アプリを Rack に渡す。

> ポート番号は空いていれば何番でも OK。チーム開発では重複しない番号を選ぶとトラブルを防げる。

---

## 🛠️ ファイルを分解してみよう

### app.rb
```ruby
require "sinatra"

get "/" do
  "Hello Sinatra!"
end
```
- `require "sinatra"` : Sinatra 本体を読み込む。
- `get "/" do ... end` : HTTP GET `/` にマッチしたときの処理を定義するルーティングブロック。文字列を返すとそのままブラウザに表示される。

### config.ru
```ruby
require_relative "./app"
run Sinatra::Application
```
- `require_relative "./app"` : Sinatra アプリを読み込む。
- `run Sinatra::Application` : Sinatra が生成した Rack アプリ (`Sinatra::Application`) を Rack ハンドラに渡す。

---

## ✅ 動作確認
- ターミナルにアクセスログ (GET / 200) が表示される。
- ブラウザで `Hello Sinatra!` が表示される。

---

## 🚩 Commit Point
```bash
git add app.rb config.ru
git commit -m "STEP03: boot hello sinatra via rackup"
```

---

## 📝 理解チェック
- [ ] `rackup` が `config.ru` をどのように読み込むか説明できる。
- [ ] Rack と Sinatra の関係を図示して説明できる。

---

## 🔗 もっと詳しく知りたいとき
- Sinatra 公式イントロ: https://sinatrarb.com/intro.html
- Rack の概要とミドルウェア入門: https://rack.github.io/
- Rack ⇔ Sinatra ⇔ Rails の位置づけ (記事): https://qiita.com/hnw/items/65cad6fa-7cab-49c3-b9ec-8456b7d09b08
- ルーティングとは？ HTTP メソッド & パスの基礎: https://developer.mozilla.org/ja/docs/Web/HTTP/Methods

---

🤔 AI に聞いてみよう 🤖
```
Sinatra で `get "/hello"` が呼ばれたとき、Rack のレイヤーを含めた処理フローをざっくり教えてください

`run Sinatra::Application` は内部で何を返す？

ポート 9292 が使用中だった場合の対処方法は？
```

