# Step 15: Rack::Test でサクッとテストを書く 🧪

## 🎯目的・成果物
### 目的
- Rack::Test を使ってアプリの HTTP レスポンスをチェックする方法を学びます。

### 成果物
- `Gemfile`（更新）
- `test/app_test.rb`（新規）

## 🚀作業フロー

### 1. テスト用 Gem を追加
```bash
cursor Gemfile
```
`Gemfile` の最下部に追記
```ruby
group :test do
  gem "rack-test"
  gem "minitest"
end
```
そしてインストール！
```bash
bundle install --path vendor/bundle
```

---

### 2. テストディレクトリを作成
```bash
mkdir -p test
touch test/app_test.rb
cursor test/app_test.rb
```

`test/app_test.rb` にサンプルを書き込む👇
```ruby
ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require_relative "../app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_root_ok
    get "/"
    assert last_response.ok?
    assert_includes last_response.body, "Hello"
  end
end
```

---

### 3. テスト実行
```bash
bundle exec ruby test/app_test.rb
```
`0 failures` と出れば 🎉 合格！

## 💡ポイント解説
- **Rack::Test** は Sinatra / Rails など Rack アプリを軽量にテストできる便利ライブラリ。
- `app` メソッドでテスト対象の Rack アプリを返すのがお約束。
- `get`, `post` などでリクエスト → `last_response` でステータスや本文をチェック。

## ✅動作確認
- [ ] コマンド実行後に `0 failures` が表示されたか

## 🚩Commit Point
```bash
git add Gemfile Gemfile.lock test/app_test.rb
git commit -m "STEP15: add simple Rack::Test test"
```

## 📝理解チェック
- Rack::Test がどのように HTTP リクエストをシミュレートするか説明できる

## 🔗もっと詳しく知りたいとき
- Rack::Test README: https://github.com/rack/rack-test
- Minitest ドキュメント: https://docs.seattlerb.org/minitest/

🤔 AI に聞いてみよう 🤖
```
Rack::Test と capybara / rspec の違いは？ 使い分けポイントを教えてください。
```