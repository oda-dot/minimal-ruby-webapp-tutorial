# Step 13: Bootstrapでモダンな見た目に改善

## 目的と成果物

### 目的
CSSフレームワークを使って、効率的にUIを改善する

### 成果物
views/index.erb（更新）

## 作業手順

### 1. views/index.erbの更新
```bash
cursor views/index.erb   # VS Code で開き、下記内容に更新
```

```erb
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Todo List</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
              <a href="/todos/<%= todo.id %>/edit">編集</a>
              <form action="/todos/<%= todo.id %>" method="post" style="display: inline">
              <input type="hidden" name="_method" value="delete">
              <button type="submit">削除</button>
              </form>
          </td>
        </tr>
      <% end %>
    </table>
  </div>
</body>
</html>
```

### 2. public/styles.cssの削除
```bash
  rm public/styles.css #Bootstrapのクラスしか使っていないので、手作りのCSSは不要になりました！
```

## ポイント解説

Bootstrapには予めcssが適用されたクラスがたくさん入っています。
このクラスを指定することで自力でCSSを書かずに手軽にレイアウトを作成できます。
細かい修正をしたいときはCSSで調整することもできます。

### なぜBootstrapを使うのか？

1. **デザインの一貫性**
   - Bootstrapのデザインシステムにより、プロっぽい見た目に
   - 色やスペーシングが自動的に最適化

2. **レスポンシブ対応**
   - スマートフォンでも見やすいレイアウト
   - table-responsiveで横スクロール対応

3. **コンポーネントの充実**
   - ボタングループ
   - バッジ
   - テーブルのホバーエフェクト

4. **開発効率**
   - CSSを手書きする必要がない
   - クラス名を指定するだけで統一されたデザインに

### Step 12との比較
手作業で実装した機能との比較：

| 機能 | Step 12（バニラCSS） | Step 13（Bootstrap） |
|-----|---------------------|-------------------|
| ボタン | 複数のCSSプロパティを手動設定 | `btn btn-primary`クラスのみ |
| テーブル | ボーダーや余白を手動設定 | `table`クラスで自動適用 |
| ステータス表示 | 背景色と文字色を個別指定 | `badge`コンポーネントを使用 |
| レスポンシブ | 未対応 | `container`と`table-responsive`で自動対応 |
| 保守性 | CSSの知識が必要 | クラス名の知識のみで OK |

## 動作確認
- [ ] 見た目がモダンになった


## Commit Point 🚩
```bash
git add views/index.erb public/styles.css
git commit -m "STEP13: improve UI with Bootstrap"
``` 

## もっと詳しく
- [はじめに · Bootstrap v5.3 | Bootstrap公式ドキュメント](https://getbootstrap.jp/docs/5.3/getting-started/introduction/)

AIへの質問例
```
今回のプロジェクトで見栄えが良くなるbootstrapのクラスを5つ教えてください。定量的な推奨度と理由も併せて教えてください。
```