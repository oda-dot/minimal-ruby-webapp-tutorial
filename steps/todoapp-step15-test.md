# todoapp Step 15 簡易テスト（Rack::Test）

## 目的と成果物

### 目的
Rack::Test を使ってアプリの HTTP レスポンスをテストする方法を学ぶ。

### 成果物
Gemfile（更新）  
test/app_test.rb

## 作業

### 1. テスト用 Gem を追加
```bash
cursor Gemfile
```
Gemfile の最下部に追加:
```ruby
group :test do
  gem "rack-test"
  gem "minitest"
end
```
インストール:
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

### test/app_test.rb 例
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
`0 failures` と表示されれば成功。

## ポイント解説
- Rack::Test は Sinatra/Rails を Rack 経由でテストする軽量ライブラリ。
- `app` メソッドで Rack アプリを返すのが決まり。
- `get`, `post` など HTTP メソッドを呼び出し、`last_response` で結果確認。

## Commit Point 🚩
```bash
git add Gemfile Gemfile.lock test/app_test.rb
git commit -m "STEP15: add simple Rack::Test test"
```

## 理解チェック
- [ ] Rack::Test がどのように HTTP リクエストをシミュレートするか説明できる

## もっと詳しく
- Rack::Test README: https://github.com/rack/rack-test
- Minitest ドキュメント: https://docs.seattlerb.org/minitest/ 