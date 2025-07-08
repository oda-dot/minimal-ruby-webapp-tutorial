# todoapp Step 05 モデル実装

## 目的と成果物

### 目的
ActiveRecord モデル `Todo` を作成し、バリデーションを学ぶ。

### 成果物


## 作業
### 1. モデル用ディレクトリを用意
```bash
mkdir -p models
```

---

### 2. Todo モデルを作成して VS Code で開く
```bash
touch models/todo.rb
cursor models/todo.rb
```
> 以下の「models/todo.rb 例」をコピーして保存。

### models/todo.rb 例
```ruby
class Todo < ActiveRecord::Base
  validates :title, presence: true
end
``` 

## ポイント解説
- モデルはテーブルと 1:1 対応（慣例で単数形）。
- `validates` でデータ整合性を保つ。

### 用語メモ
- **モデル (Model)**: アプリケーションのデータとビジネスロジックを表す層。
- **バリデーション (validation)**: レコード保存前に値が正しいかを検証する仕組み。
- 
### models/todo.rb を分解してみよう
- `class Todo < ActiveRecord::Base` : `todos` テーブルとつながる **Ruby の設計図** を宣言。
- `validates :title, presence: true` : `title` が空欄のまま保存されないようチェック。

## 動作確認
```bash
bundle exec irb -r ./models/todo.rb
Todo.create(title: "Test")
```
レコードが保存されれば成功。

## Commit Point 🚩
```bash
git add models/todo.rb
git commit -m "STEP05: implement Todo model with validation"
```

## 理解チェック
- [ ] ActiveRecord のバリデーションがどこで呼ばれるか説明できる

## もっと詳しく

- ActiveRecord Validations: https://guides.rubyonrails.org/active_record_validations.html
- ActiveRecord バリデーション早見表: https://railsguides.jp/active_record_validations.html
- コールバックって何？（before_save などをざっくり）

AI への質問例
```
`presence: true` 以外でよく使うバリデーションを 3 つ教えてください。
```

