# 🧩 todoapp Step 05 モデル実装

ActiveRecord モデル `Todo` を作成し、バリデーションを追加するステップです。ここからアプリの“データを扱う層”が見えてきます。

---

## 🎯 目的と成果物

### 目的
- `Todo` モデルを作成してテーブルと連携する。
- `validates` を使って入力チェックの基本を学ぶ。

### 成果物
- `models/todo.rb`

---

## 🚀 作業フロー

### 1. モデル用ディレクトリを用意する
```bash
mkdir -p models
```

### 2. Todo モデルを作成してエディタで開く
```bash
touch models/todo.rb
cursor models/todo.rb
```
下記をコピーして保存します。
```ruby
require "sinatra/activerecord"

class Todo < ActiveRecord::Base
  validates :title, presence: true
end
```

---

## 🔍 Todo モデルをひも解く
| 行 | 役割 | メモ |
|----|------|------|
| `require "sinatra/activerecord"` | ActiveRecord と Sinatra の橋渡し | DB 接続設定を自動で読み込む |
| `class Todo < ActiveRecord::Base` | `todos` テーブルと 1:1 でマッピング | クラス名が単数形、テーブルは複数形 |
| `validates :title, presence: true` | `title` が空のまま保存されないようにする | 保存直前にチェックが走る |

> **ヒント**: モデルにロジックを集約するとコントローラがスッキリします。後でメソッドを追加してみても OK。

---

## ✅ 動作確認
```bash
bundle exec irb -r ./models/todo.rb
Todo.create(title: "Test")
```
- レコードが保存される。
- `Todo.create(title: "")` を試してエラーメッセージが出ればバリデーションが効いている。

---

## 🚩 Commit Point
```bash
git add models/todo.rb
git commit -m "STEP05: implement Todo model with validation"
```

---

## 📝 理解チェック
- [ ] `validates` がどのタイミングで実行されるか説明できる。
- [ ] モデル名とテーブル名の対応規則を説明できる。

---

## 🔗 もっと詳しく知りたいとき
- ActiveRecord Validations (公式): https://guides.rubyonrails.org/active_record_validations.html
- バリデーション一覧早見表: https://railsguides.jp/active_record_validations.html
- コールバック super 入門: https://guides.rubyonrails.org/active_record_callbacks.html

---

🤔 AI に聞いてみよう 🤖
```
`presence: true` 以外でよく使うバリデーションを 3 つ紹介してください。

モデルで `enum` を使うときのメリットは？
```

