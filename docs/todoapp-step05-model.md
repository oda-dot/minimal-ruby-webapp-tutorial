# todoapp Step 05 モデル実装

## 目的
ActiveRecord モデル `Todo` を作成し、バリデーションを学ぶ。

## 作業
### 1. モデル用ディレクトリを用意
```bash
mkdir -p models
```

---

### 2. Todo モデルを作成して VS Code で開く
```bash
touch models/todo.rb
code models/todo.rb
```
> 以下の「models/todo.rb 例」をコピーして保存。
---

## ポイント解説
- モデルはテーブルと 1:1 対応（慣例で単数形）。
- `validates` でデータ整合性を保つ。

## 動作確認
```bash
bundle exec irb -r ./models/todo.rb
Todo.create(title: "Test")
```
レコードが保存されれば成功。

## 理解チェック
- [ ] ActiveRecord のバリデーションがどこで呼ばれるか説明できる

## もっと詳しく
### 公式ドキュメント
- ActiveRecord Validations: https://guides.rubyonrails.org/active_record_validations.html

### 検索キーワード例
```
activerecord validates presence true not working
sinatra activerecord model path
```

### AI への質問テンプレ
```
IRB で `Todo.create(title: "")` を実行してもレコードが保存されます。
バリデーションが効かない原因を教えてください。
```

### 用語メモ
- **モデル (Model)**: アプリケーションのデータとビジネスロジックを表す層。
- **バリデーション (validation)**: レコード保存前に値が正しいかを検証する仕組み。

## Commit Point 🚩
```bash
git add models/todo.rb
git commit -m "STEP05: implement Todo model with validation"
```

### 自分でやってみよう
- `presence: true` の他に `length: { maximum: 50 }` を追加してみましょう。
- `irb` 上でバリデーションエラー時の `errors.full_messages` を確認してみましょう。

### 完成コード例
models/todo.rb の完成版は docs/todoapp-final-code.md を参照してください。

### 深く理解するために
- ActiveRecord バリデーション早見表: https://railsguides.jp/active_record_validations.html
- コールバックって何？（before_save などをざっくり）

AI への質問例
```
`presence: true` 以外でよく使うバリデーションを 3 つ教えてください。
```

### models/todo.rb を分解してみよう
- `class Todo < ActiveRecord::Base` : `todos` テーブルとつながる **Ruby の設計図** を宣言。
- `validates :title, presence: true` : `title` が空欄のまま保存されないようチェック。

### models/todo.rb 例
```ruby
class Todo < ActiveRecord::Base
  validates :title, presence: true
end
``` 