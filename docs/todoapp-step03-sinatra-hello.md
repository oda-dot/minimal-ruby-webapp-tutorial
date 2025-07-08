# todoapp Step 03 Sinatra "Hello"

## 目的
Sinatra が起動し、ブラウザに文字列を表示できることを確認する。

## 作業
### 1. config.ru を作成して VS Code で開く
```bash
touch config.ru
code config.ru
```
> 以下の「config.ru 例」を貼り付けて保存。

---

### 2. サーバーを起動
```bash
bundle exec rackup -p 4567
```
ターミナルにアクセスログが流れ、ブラウザで `http://localhost:4567` が表示できれば OK。
---

### config.ru 例
```ruby
require "sinatra"
run ->(env) { [200, {"Content-Type" => "text/plain"}, ["Hello Sinatra"]] }
```
ブラウザで `http://localhost:4567` を開き "Hello Sinatra" が表示される。

## ポイント解説
- Rack は Ruby Web サーバーインターフェース。Sinatra は Rack アプリ。
- `config.ru` は Rack 用の起動スクリプト。

## 動作確認
ターミナルにアクセスログが出れば成功。

## 理解チェック
- [ ] Rack と Sinatra の関係を説明できる

## もっと詳しく
### 公式ドキュメント
- Sinatra: https://sinatrarb.com/intro.html

### 検索キーワード例
```rackup sinatra hello world
sinatra running on different port
```

### 深く理解するために
- Rack と Sinatra の関係を図で理解: https://qiita.com/hnw/items/65cad6fa-7cab-49c3-b9ec-8456b7d09b08
- ルーティングとは何か（HTTP メソッドとパスの組）

AI への質問例
```
Sinatra で `get "/hello"` が実行されたとき、処理の流れをざっくり教えてください。
```

## 用語メモ
- **Rack**: Ruby Web サーバーインターフェースの標準仕様。Sinatra/Rails などは Rack アプリ。
- **ポート (port)**: ネットワークでプロセスを識別する番号。本手順では 4567 を使用。

## Commit Point 🚩
```bash
git add config.ru
git commit -m "STEP03: boot hello sinatra via rackup"
```

## 自分でやってみよう
- ポート番号を 9292 に変更し、ブラウザでアクセスできるか確認してみましょう。
- `run -> ...` を小さなクラスに置き換えてみましょう。

## 完成コード例
config.ru と app.rb の完成版は docs/todoapp-final-code.md を参照してください。

## config.ru を分解してみよう
- `require "sinatra"` : Sinatra ライブラリを読み込む合図。
- `run ->(env) { ... }` : Rack に "このブロックを Web アプリとして動かして" と渡す。
  - `env` : リクエスト情報が入ったハッシュ。
  - `[200, {"Content-Type" => "text/plain"}, ["Hello Sinatra"]]` : **配列 3 つセット** が Rack の取り決め。
    - `200` : 成功を示す番号。
    - `Content-Type` : ブラウザへ返すデータ種別。ここではプレーンテキスト。
    - `body` : 表示文字列を配列で包む。