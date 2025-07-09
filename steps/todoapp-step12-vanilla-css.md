# 🎨 todoapp Step 12 バニラ CSS でスタイリング

素の CSS（ライブラリなし）で画面の見た目を整えます。ここではクラス名の付け方やリンクの装飾など CSS の基本を体験します。

---

## 🎯 目的と成果物

### 目的
- HTML の見た目を改善し、CSS クラスによる装飾を学ぶ。

### 成果物
- `public/styles.css`
- `views/index.erb` (更新)

---

## 🚀 作業フロー

### 1. `public/styles.css` を作成する
```bash
mkdir -p public
touch public/styles.css
cursor public/styles.css
```
```css
/* 全体のスタイル */
body {
  max-width: 800px;
  margin: 20px auto;
  font-family: sans-serif;
}

/* テーブルの基本スタイル */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

td {
  padding: 12px;
  border: 1px solid #ddd;
}

/* 新規作成リンク */
.new-link {
  display: inline-block;
  padding: 8px 16px;
  background: #4CAF50;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  margin: 10px 0;
}

/* 完了状態の表示 */
.status {
  padding: 4px 8px;
  border-radius: 4px;
}

.status-done {
  background: #E8F5E9;
  color: #2E7D32;
}

.status-undone {
  background: #FFEBEE;
  color: #C62828;
}
```

### 2. `views/index.erb` に CSS を読み込む
```bash
cursor views/index.erb
```
必要な部分だけ差し替え（ヘッダ部とリンク部分）。
```erb
<link rel="stylesheet" href="/styles.css" />
...
<a href="/todos/new" class="new-link">新規作成</a>
```
（既に書いてある場合はクラス名だけ付与すれば OK。）

---

## 💡 ポイント解説
- **Vanilla CSS** = 純粋な CSS。追加ツールなしで使える。
- `.new-link` のように **クラス** で部品名を付けると後から再利用しやすい。
- **box model**（margin / padding / border）を意識するとレイアウト調整がラク。

### クラス分岐のアイデア
| 状態 | 例 | 目的 |
|------|----|------|
| 完了 / 未完了 | `.status-done` / `.status-undone` | 色分けで判別しやすくする |
| ボタン | `.btn` / `.btn-danger` | 統一スタイルにカラーバリエを付与 |

---

## ✅ 動作確認
- `bundle exec rackup` でサーバーを起動し、ブラウザで一覧を確認。
- テーブルに枠線が付き、`新規作成` ボタンが緑色になっていれば成功。

---

## 🚩 Commit Point
```bash
git add public/styles.css views/index.erb
git commit -m "STEP12: add vanilla CSS styling"
```

---

## 📝 理解チェック
- [ ] `.status-done` と `.status-undone` の色指定を変えてみて動作を確認できる。
- [ ] `.new-link` にホバーエフェクトを追加できる。

---

## 🔗 もっと詳しく知りたいとき
- CSS ボックスモデル: https://developer.mozilla.org/ja/docs/Learn/CSS/Building_blocks/The_box_model
- Color in CSS: https://developer.mozilla.org/ja/docs/Web/CSS/color_value
- Flexbox 入門（レイアウト強化）: https://css-tricks.com/snippets/css/a-guide-to-flexbox/

---

🤔 AI に聞いてみよう 🤖
```
border-radius とは何ですか？

CSS で色を指定する方法にはどのようなものがありますか？
```