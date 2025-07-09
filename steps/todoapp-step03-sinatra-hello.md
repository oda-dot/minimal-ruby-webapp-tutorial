# todoapp Step 03 Sinatra "Hello"

## 目的と成果物

### 目的
Sinatra が起動し、ブラウザに文字列を表示できることを確認する。

### 成果物
app.rb  
config.ru

## 作業
### 1. app.rb を作成して VS Code で開く
```bash
touch app.rb
cursor app.rb
```
> 以下の「app.rb 例」をコピーして保存。

### app.rb 例
```ruby
require "sinatra"

get "/" do
  "Hello Sinatra!"
end
```

---

### 2. config.ru を作成して VS Code で開く
```bash
touch config.ru
cursor config.ru
```
> 以下の「config.ru 例」を貼り付けて保存。

### config.ru 例
```ruby
require_relative "./app"
run Sinatra::Application
```

---

### 3. サーバーを起動
```bash
bundle exec rackup -p 4567
```

- サーバーの終了は Ctrl + C

---

## ポイント解説
- Rack は Ruby Web サーバーインターフェース。Sinatra は Rack アプリ。
- `config.ru` は Rack 用の起動スクリプト。

### 用語メモ
- **Rack**: Ruby Web サーバーインターフェースの標準仕様。Sinatra/Rails などは Rack アプリ。
- **config.ru**: Rack アプリケーションの起動設定ファイル。どのアプリを動かすかを指定。
- **rackup**: config.ru ファイルを読み込んで Rack アプリケーションを起動するコマンド。
- **ポート (port)**: ネットワークでプロセスを識別する番号。本手順では 4567 を使用。

### config.ru を分解してみよう
- `require_relative "./app"` : Sinatra アプリ (app.rb) を読み込む。
- `run Sinatra::Application` : Sinatra が生成した Rack アプリを Rack に渡す。
- `Sinatra::Application` は Sinatra が自動生成する Rack アプリケーションクラス。

## 動作確認
ターミナルにアクセスログが流れ、ブラウザで `http://localhost:4567` が表示される
ブラウザで `http://localhost:4567` を開き "Hello Sinatra" が表示される。

## Commit Point 🚩
```bash
git add app.rb config.ru
git commit -m "STEP03: boot hello sinatra via rackup"
```

## 理解チェック
- [ ] Rack と Sinatra の関係を説明できる

## もっと詳しく

- Sinatra: https://sinatrarb.com/intro.html
- Rack と Sinatra の関係を図で理解: https://qiita.com/hnw/items/65cad6fa-7cab-49c3-b9ec-8456b7d09b08
- ルーティングとは何か（HTTP メソッドとパスの組）

AI への質問例
```
Sinatra で `get "/hello"` が実行されたとき、処理の流れをざっくり教えてください。
```

