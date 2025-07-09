# 🌟 todoapp Step 13 Bootstrap でモダン UI

Bootstrap というものを CDN で読み込み、クラスを付けるだけで一気に “それっぽい” デザインに仕上がります。スマホ対応も簡単。

---

## 🎯 目的と成果物

### 目的
- Bootstrap を導入して見た目をアップグレードする。
- 既存の手書き CSS を Bootstrap クラスへ置き換える。

### 成果物
- `views/index.erb` (更新)
- `public/styles.css` (不要なら削除)

---

## 🚀 作業フロー

### 1. `views/index.erb` を Bootstrap 版に差し替える
```bash
cursor views/index.erb
```
```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Todo List</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="container py-4">
  <h1 class="mb-4">Todos</h1>
  <div class="mb-4">
    <a href="/todos/new" class="btn btn-primary">
      <i class="bi bi-plus-circle"></i> 新規作成
    </a>
  </div>

  <div class="table-responsive">
    <table class="table table-hover">
      <% @todos.each do |todo| %>
        <tr>
          <td><%= todo.title %></td>
          <td>
            <span class="badge <%= todo.done ? 'bg-success' : 'bg-danger' %>">
              <%= todo.done ? "完了" : "未完了" %>
            </span>
          </td>
          <td>
            <a href="/todos/<%= todo.id %>/edit" class="me-2">編集</a>
            <form action="/todos/<%= todo.id %>" method="post" style="display:inline">
              <input type="hidden" name="_method" value="delete" />
              <button type="submit" class="btn btn-sm btn-outline-danger">削除</button>
            </form>
          </td>
        </tr>
      <% end %>
    </table>
  </div>
</body>
</html>
```

### 2. 旧 CSS を削除（任意）
Bootstrap だけで足りる場合は削除して OK。
```bash
rm public/styles.css  # あとで必要なら残しても良い
```
Bootstrapのクラスを使うことで手作りのCSSは不要になりました。


---

## 💡 ポイント解説
| 機能 | バニラ CSS (Step12) | Bootstrap (今回) |
|------|--------------------|------------------|
| ボタン | クラス `.new-link` を自作 | `btn btn-primary` で即適用 |
| テーブル | 枠線や余白を手書き | `table table-hover` で完了 |
| ステータス表示 | 背景色 + 文字色を自分で設定 | `badge bg-success / bg-danger` |
| レスポンシブ | 自前でメディアクエリ | `container` + `.table-responsive` |

> Bootstrap クラスは組み合わせるだけでかなりの UI が作れます。慣れてきたらユーティリティクラス（`mt-3` など）も活用すると便利です。

---

## ✅ 動作確認
1. `bundle exec rackup` → ブラウザを開く。
2. テーブルやボタンが Bootstrap スタイルになっていることを確認する。

---

## 🚩 Commit Point
```bash
git add views/index.erb public/styles.css  # 削除した場合は git rm も
git commit -m "STEP13: improve UI with Bootstrap"
```

---

## 📝 理解チェック
- [ ] `btn` クラスを色違いに変えてみる (`btn-success` など)。
- [ ] `.table-striped` を追加してストライプテーブルにできる。

---

## 🔗 もっと詳しく知りたいとき
- Bootstrap 公式ドキュメント: https://getbootstrap.jp/docs/5.3/getting-started/introduction/
- Bootstrap Icons: https://icons.getbootstrap.com/

---

🤔 AI に聞いてみよう 🤖
```
今回のプロジェクトで見栄えが良くなるbootstrapのクラスを5つ教えてください。定量的な推奨度と理由も併せて教えてください。
```