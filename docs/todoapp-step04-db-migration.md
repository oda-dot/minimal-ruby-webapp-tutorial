# todoapp Step 04 DB 設定 & マイグレーション

## 目的
SQLite3 に Todo テーブルを作成し、ActiveRecord マイグレーションの流れを理解する。

## 作業
```bash
mkdir -p config db/migrate

touch config/database.yml
code  config/database.yml   # VS Code で開き、下記内容を貼り付けて保存

# Rakefile を作成 (ActiveRecord 用タスクを読み込む)
touch Rakefile
code  Rakefile              # VS Code で開き、下記内容を貼り付けて保存

# マイグレーション生成
bundle exec rake db:create_migration NAME=create_todos

# db/migrate/XXXXXX_create_todos.rb を VS Code で編集し、下記内容を貼り付け

# マイグレーション実行
bundle exec rake db:migrate
```

### database.yml 例
```yaml
development:
  adapter: sqlite3
  database: db/development.sqlite3
```

### database.yml を分解してみよう
| キー | 意味 |
|------|------|
| `adapter` | どの DB を使うか指定。ここでは `sqlite3`. |
| `database` | DB ファイルの場所。`db/development.sqlite3` が作られる |

### マイグレーション例
```ruby
class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string  :title, null: false
      t.text    :description
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
```

### マイグレーション例を分解してみよう
- `class CreateTodos < ActiveRecord::Migration` : **テーブル変更用のクラス** を定義。
- `def change` : ここに「どう変えるか」を書くメソッドを作る。
- `create_table :todos do |t|` : `todos` というテーブルを新規作成。
  - `t.string :title, null: false` : 文字列型 `title` 列、空 NG。
  - `t.text :description` : 長い文字用の列。
  - `t.boolean :done, default: false` : true/false 列、初期値は false。
  - `t.timestamps` : `created_at` / `updated_at` を自動追加。

## ポイント解説
- `rake db:create_migration` でテンプレートファイルを生成。
- DSL → SQL に変換され、SQLite ファイルに適用される。

## 動作確認
```bash
sqlite3 db/development.sqlite3 '.schema todos'
```
テーブル定義が表示されれば OK。

## 理解チェック
- [ ] マイグレーション→テーブル作成の流れを口頭で説明できる

## もっと詳しく
### 公式ドキュメント
- ActiveRecord Migrations: https://guides.rubyonrails.org/active_record_migrations.html

### 検索キーワード例
```
activerecord rake db migrate undefined method_version
sqlite3 no such table
```

### AI への質問テンプレ
```
`bundle exec rake db:migrate` で "Could not find table migrations" と表示されます。
エラー全文を添付しますので、原因と解決策を教えてください。
```

### 用語メモ
- **マイグレーション (migration)**: スキーマ変更履歴を Ruby DSL で管理する仕組み。
- **スキーマ (schema)**: テーブル定義 (列名・型・制約) の集合。
- **DSL**: Domain Specific Language。特定領域に特化した記述方式。

## Commit Point 🚩
```bash
git add db/migrate config/database.yml
git commit -m "STEP04: create todos table via migration"
```

### 自分でやってみよう
- `title` 列に `limit: 100` を付けてみて、`sqlite3` でスキーマ差分を確認してください。
- `bundle exec rake db:rollback` を実行し、テーブルが消えることを確認してみましょう。

### 完成コード例
マイグレーションと database.yml の完成版は docs/todoapp-final-code.md を参照してください。

### 深く理解するために
- ActiveRecord マイグレーション入門: https://railsguides.jp/active_record_migrations.html
- テーブル設計の基本（カラム型と制約）

AI への質問例
```
マイグレーションって一言でいうと何をする仕組みですか？
```

### Rakefile 例
```ruby
require 'sinatra/activerecord/rake'
``` 