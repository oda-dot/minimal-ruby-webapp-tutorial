# todoapp 用語・記号リファレンス 📚

このファイルでは、todoapp チュートリアルで登場する **専門用語・記号・ファイル名** を、プログラミング初学者向けにまとめています。

---

## 🗂️ 目次
1. 開発まわりの一般用語
2. Web & HTTP
3. Ruby・Bundler 周辺
4. フレームワーク（Rack／Sinatra／ActiveRecord）
5. ファイル・ディレクトリ対応表
6. Git & バージョン管理用語

---

## 1. 開発まわりの一般用語
| 用語 | 説明 | 具体例・イメージ |
|------|------|-----------------|
| 依存 (dependency) | **動くために必要な外部ソフト／ライブラリ** | アプリが SQLite ライブラリを使う → SQLite は依存 |
| 依存管理 | 必要ライブラリを **一覧で宣言・固定** すること | Gemfile, package.json |
| 依存解決 | バージョン衝突を解消し、実際にインストールする作業 | `bundle install` |
| プロジェクトローカル | システム全体ではなく **このプロジェクトフォルダだけ** に適用 | `vendor/bundle` に Gem を置く |
| ファイルベース DB | データが **単一ファイルにまとまる** 形式の DB | SQLite (`.sqlite3` ファイル) |
| ストア | 「保存場所」の意。データストア＝データの保管庫 | DB = データストア |
| CLI | Command Line Interface。**ターミナル操作** | `ls`, `git` |
| IRB | Interactive Ruby。Ruby を 1 行ずつ試せる電卓 | `irb` と入力して `2+3` |
| REPL | Read–Eval–Print Loop。IRB のように **入力→実行→表示を繰り返す** 仕組み | Node.js `node` コマンド など |
| Linter | **書式やコード品質チェック** を自動で行うツール | RuboCop, ESLint |
| ポート (port) | **ネットワーク上でプログラムを識別する番号** | Sinatra 例では `localhost:9292` の `9292` |
| パス (path) | **ファイルや URL の"場所"を示す文字列** | `/home/user/app.rb`, `/todos/:id` |

---

## 2. Web & HTTP
| 用語・記号 | 説明 | 備考 |
|-------------|------|------|
| サーバーインターフェース (Rack) | **Ruby アプリ ↔ Web サーバー** の共通ルール | `[status, headers, body]` を返す |
| 200 / 404 / 302 | HTTP ステータスコード。`200=成功`,`404=ページ無し`,`302=リダイレクト` | ブラウザの開発者ツールで確認可 |
| Content-Type | ブラウザへ送る **データ種別** を示すヘッダ | `text/html`,`application/json` |
| URL | **Web 上の住所**。スキーム＋ホスト＋パスで構成 | `https://example.com/todos` |
| ルーティング (Route) | URL + HTTP メソッド を **アプリ内の処理に結びつける** 仕組み | `get "/todos" do ... end` |
| GET / POST / PATCH / DELETE | ブラウザ→サーバーで使う **動詞 (HTTP メソッド)** | CRUD と対応 |
| CRUD | Create・Read・Update・Delete の総称 | SQL の INSERT/SELECT/UPDATE/DELETE |
| env | Rack で受け取る **リクエスト環境情報** が入ったハッシュ | ミドルウェア間で共有 |
| run | Rack へ **「このアプリを起動して」** と伝えるキーワード | `run Sinatra::Application` |
| Method Override | ブラウザが送れない `PATCH/DELETE` を **POST + hidden フィールド** で擬似的に送る仕組み | Sinatra では `Rack::MethodOverride` を使用 |

---

## 3. Ruby・Bundler 周辺
| キーワード/記号 | 意味 | メモ |
|-----------------|------|------|
| `require` / `require_relative` | 他ファイル・Gem を **読み込む** | 相対パス版が `require_relative` |
| `class` / `def` | **クラス定義 / メソッド定義** を始めるキーワード |  |
| `do ... end` | **ブロック**（処理のかたまり）の囲み |  |
| `:symbol` | 軽量な名前（数値と文字列の中間のようなもの） | `:title` |
| `@変数` | **インスタンス変数**。ビューへ値を渡す時にも使う | `@todos` |
| `=>` | ハッシュの **キーと値を結ぶ矢印**（旧記法） | `{ :status => 200 }` |
| Gem | Ruby のライブラリパッケージ | Python の pip パッケージに相当 |
| Bundler | Gem の **依存解決とバージョン固定** を行うツール | `bundle install` / `bundle exec` |
| Gemfile | **依存宣言ファイル**。入れたい Gem とバージョンを列挙 | `gem "sinatra"` |
| Gemfile.lock | 解決結果を **ピン留め** したファイル。再インストール時に同じバージョンを取得 | Git で共有 |
| `bundle exec` | Gemfile に書かれた **正しいバージョン** でコマンドを実行 | `bundle exec rackup` |
| Shebang (`#!/usr/bin/env ruby`) | **スクリプトの最初の行**。実行に使うプログラムを指定 | Unix 系システムで有効 |
| `vendor/bundle` | **プロジェクト内** に Gem をインストールするディレクトリ | チームで環境差異を減らす |
| Rake | Ruby 製の **タスクランナー**。make の Ruby 版 | `rake db:migrate` |

---

## 4. フレームワーク（Rack／Sinatra／ActiveRecord）
| 用語 | 説明 | 関係ファイル・Gem |
|------|------|-----------------|
| Sinatra | 軽量 Web フレームワーク。**ルーティングとビュー** を提供 | `sinatra` Gem / `app.rb` |
| ActiveRecord | **ORM**。Ruby オブジェクト ↔ DB 行 を変換 | `sinatra-activerecord` Gem / `models/*.rb` |
| バリデーション | モデル保存前に **値が正しいか検証** する機能 | `validates :title, presence: true` |
| マイグレーション | **テーブル変更の履歴ファイル**。Ruby DSL で書く | `db/migrate/*.rb` |
| Rakefile | Rake タスクを宣言する **Ruby スクリプト** | `Rakefile` |
| Rack::Test | Rack アプリを **HTTP なしでテスト** する軽量ライブラリ | `test/app_test.rb` |
| Rack::MethodOverride | フォームからの **PATCH/DELETE 擬似送信** を実現するミドルウェア | `use Rack::MethodOverride` |
| ERB (Embedded Ruby) | HTML の中に **Ruby を埋め込める** テンプレートエンジン | `views/*.erb` |
| Layout (layout.erb) | ビューの **共通 HTML** を集約したテンプレート | `views/layout.erb` |
| MVC | Model–View–Controller。**役割分担の設計パターン** | Sinatra でも簡易的に採用 |

---

## 5. ファイル・ディレクトリ対応表
```
app.rb            # ルーティング & コントローラ
models/todo.rb    # DBテーブル <-> Ruby オブジェクト
views/*.erb       # 画面表示 (HTML)
views/layout.erb  # 共通レイアウト
config/database.yml # DB 接続設定
config.ru         # Rack 起動スクリプト
Rakefile          # Rake タスク定義 (db:migrate など)
test/app_test.rb  # Rack::Test で書いた簡易テスト
```

> すべてが **Sinatra (ルーティング) + ActiveRecord (DB) + Rack (インターフェース)** で繋がり、`bundle exec` により *正しい Gem バージョン* で実行されます。 

---

## 6. Git & バージョン管理用語
| 用語 | 説明 | 例・コマンド |
|------|------|-------------|
| リポジトリ (repository) | **プロジェクトの履歴を保存する場所** | `.git` フォルダ |
| コミット (commit) | 変更を **スナップショットとして保存** する単位 | `git commit -m "msg"` |
| ステージング (index) | **コミット予定の変更を置く一時エリア** | `git add file.rb` |
| ブランチ (branch) | **並行開発用の線路**。コミットの連なり | `git checkout -b feature` |
| マージ (merge) | ブランチを **1 つに統合** する操作 | `git merge` |
| リモート (remote) | **別の場所にあるリポジトリ** を登録した名前 | `origin` |
| プッシュ / プル | リモートへ **送信 (push)** / **取得 (pull)** する操作 | `git push origin main` |
| HEAD | 今チェックアウトしている **最新コミットのラベル** | `git log --oneline` | 