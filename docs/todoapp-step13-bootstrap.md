# Step 13: Bootstrapでモダンな見た目に改善

## 目的
CSSフレームワークを使って、効率的にUIを改善する

## なぜBootstrapを使うのか？
Step 12で経験した手作業との比較で、フレームワークの利点を理解する：
- デザインの一貫性が自動的に保たれる
- レスポンシブ対応が簡単
- 豊富なコンポーネントがすぐに使える

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
      <thead class="table-light">
        <tr>
          <th>タイトル</th>
          <th>状態</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
        <% @todos.each do |todo| %>
          <tr>
            <td class="align-middle"><%= todo.title %></td>
            <td class="align-middle">
              <span class="badge <%= todo.done ? 'bg-success' : 'bg-danger' %>">
                <%= todo.done ? "完了" : "未完了" %>
              </span>
            </td>
            <td>
              <div class="btn-group" role="group">
                <a href="/todos/<%= todo.id %>/edit" class="btn btn-sm btn-outline-secondary">
                  編集
                </a>
                <form action="/todos/<%= todo.id %>" method="post" style="display: inline">
                  <input type="hidden" name="_method" value="delete">
                  <button type="submit" class="btn btn-sm btn-outline-danger">削除</button>
                </form>
              </div>
            </td>
          </tr>
        <% end %>
      </tbody>
    </table>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
```

### 2. public/styles.cssの削除
```bash
rm public/styles.css  # 手作りのCSSは不要になります
```

### 3. app.rbからpublic設定を削除
```bash
cursor app.rb   # VS Code で開き、public設定を削除
```

```ruby
require "sinatra"
require "sinatra/activerecord"
require_relative "models/todo"

get "/" do
  @todos = Todo.order(created_at: :desc)
  erb :index
end
```

## 改善された点
1. **デザインの一貫性**
   - Bootstrapのデザインシステムにより、プロフェッショナルな見た目に
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

## Step 12との比較
手作業で実装した機能との比較：

| 機能 | Step 12（バニラCSS） | Step 13（Bootstrap） |
|-----|---------------------|-------------------|
| ボタン | 複数のCSSプロパティを手動設定 | `btn btn-primary`クラスのみ |
| テーブル | ボーダーや余白を手動設定 | `table`クラスで自動適用 |
| ステータス表示 | 背景色と文字色を個別指定 | `badge`コンポーネントを使用 |
| レスポンシブ | 未対応 | `container`と`table-responsive`で自動対応 |
| 保守性 | CSSの知識が必要 | クラス名の知識のみで OK |

## 次のステップで分かること
レイアウトテンプレートを導入することで：
- 共通部分の重複がなくなる
- 全ページの見た目を一括で変更できる
- コードがより DRY に

## Commit Point 🚩
```bash
git rm public/styles.css
git add views/index.erb app.rb
git commit -m "STEP13: improve UI with Bootstrap"
``` 