# Todoアプリ (Sinatra + SQLite3)
Sinatra と ActiveRecord を用いて作成したシンプルな Todo 管理 Web アプリケーションです。タスクの作成・更新・削除・ステータス管理 (完了 / 未完了) をブラウザから簡単に行うことができます。

## 🎯 主な機能
- Todo の一覧表示
- 新規作成
- 編集（タイトル変更・完了フラグ更新）
- 削除
- 作成日時でソート（新しい順）

## 🛠️ 技術スタック
| 役割 | 技術 |
|------|------|
| Web フレームワーク | [Sinatra](https://sinatrarb.com/) |
| ORM | [Sinatra-ActiveRecord](https://github.com/sinatra-activerecord/sinatra-activerecord) |
| データベース | SQLite3 |
| アプリケーションサーバ | Puma / Rack |

## 🖥️ 動作環境
- Ruby 3.0 以降（開発確認: 3.2.3）
- Bundler 2 系
- SQLite3（gem が自動インストールされるので別途セットアップ不要）

## 🏁 セットアップ手順

### 1. リポジトリを取得
```bash
git clone <REPO_URL>
cd todo_app
```

### 2. 依存ライブラリをインストール
```bash
bundle install
```

### 3. データベースを初期化 (SQLite3)
```bash
bundle exec rake db:migrate
```

### 4. サーバを起動 (開発モード)
```bash
bundle exec rackup        # または `ruby app.rb` でも可
# => デフォルトで http://localhost:9292 が立ち上がります
```

**ファイル保存を自動リロードしたい場合** は `rerun` を利用できます。
```bash
bundle exec rerun 'rackup'
```

## 📁 ファイル構成
```text
.
├── app.rb              # ルーティングとコントローラ
├── models/
│   └── todo.rb        # Todo モデル
├── views/              # ERB テンプレート
│   ├── index.erb
│   ├── new.erb
│   └── edit.erb
├── db/
│   ├── migrate/        # マイグレーションファイル
│   ├── schema.rb
│   └── development.sqlite3
├── config/
│   └── database.yml    # DB 設定
├── Gemfile             # 依存宣言
├── Rakefile            # DB タスクなど
└── config.ru           # Rack エントリポイント
```

## 🌐 主要エンドポイント
| HTTP | パス | 説明 |
|------|------|------|
| GET  | /           | Todo 一覧 |
| GET  | /todos/new  | 新規作成フォーム |
| POST | /todos      | Todo 作成 |
| GET  | /todos/:id/edit | 編集フォーム |
| PATCH| /todos/:id  | Todo 更新 |
| DELETE | /todos/:id | Todo 削除 |

## ⚙️ データベース設定のカスタマイズ
デフォルトでは SQLite3 を使用しますが、`config/database.yml` を編集することで 
PostgreSQL や MySQL など任意のデータベースに切り替え可能です。変更後は該当 DB を作
成し、マイグレーションを再実行してください。