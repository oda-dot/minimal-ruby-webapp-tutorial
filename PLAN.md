# ToDo アプリ開発計画書

## 1. 概要
初心者が **2 時間半（150 分）以内** に Sinatra + ActiveRecord + SQLite を用いた ToDo アプリを完成させ、すべてのコマンドと仕組みを自分の言葉で説明できるようになることを目的とした学習プロジェクトです。本計画書は作業順序、所要時間、使用コマンド、学習ポイントを明示し、迷わず進行できるようにします。

---

## 2. 目標（Goal）
1. Sinatra で CRUD が動作する ToDo アプリを作成・起動する。
2. 主要コマンド（ruby, bundler, rake, git など）の **目的と内部動作** を説明できる。
3. GitHub へコードをプッシュし、README に手順・解説を記載する。
4. Rails 案件に繋がる基礎（Rack/MVC/ActiveRecord）を理解する。

---

## 3. 採用技術と選定理由
| 分類 | 技術 | バージョン例 | 選定理由 |
|------|------|--------------|----------|
| 言語 | Ruby | 3.4.4（最新） | Rails でも利用される標準言語 |
| FW   | Sinatra | 最新 | 学習コストが低く、内部が追い掛けやすい。Railsより基本を理解しやすくVanillaより手軽に実装できる |
| ORM  | ActiveRecord | 最新 | Rails と同一、将来の学習を活かせる |
| DB   | SQLite | 最新 | 依存レス・ファイルのみで完結 |
| 再起動 | sinatra/reloader または rerun | 最新 | コード変更を即時反映し効率化 |

---

## 4. 前提条件（準備済み）
- **WSL2 Ubuntu** 上で作業（Windows Terminal / VSCode Remote-WSL 使用）
- VS Code が利用可能（ターミナルは VSCode 内で表示）
- Git がインストール済み & GitHub アカウント作成済み
- ネット接続

---

## 5. タイムライン（150 分）
| Step | 内容 | 目安時間 |
|------|------|-----------|
| 0 | 環境確認 | 10 分 |
| 1 | Git 初期化 | 10 分 |
| 2 | Gemfile & Bundler | 10 分 |
| 3 | Sinatra "Hello" | 10 分 |
| 4 | DB 設定 & マイグレーション | 20 分 |
| 5 | モデル実装 | 10 分 |
| 6 | READ ルート + ビュー | 15 分 |
| 7 | CREATE 機能 | 15 分 |
| 8 | UPDATE & DELETE 機能 | 15 分 |
| 9 | 自動リロード導入 | 5 分 |
| 10 | GitHub 連携（git remote/push） | 10 分 |
| 11 | README と振り返り | 10 分 |
| 12 | 予備・Q&A | 10 分 |

---

## 6. ディレクトリ構成
```text
ruby-todo-app/
 ├─ app.rb
 ├─ models/
 │    └─ todo.rb
 ├─ config/
 │    └─ database.yml
 ├─ db/
 │    ├─ migrate/
 │    └─ development.sqlite3 (自動生成)
 ├─ views/
 │    ├─ index.erb
 │    ├─ new.erb
 │    └─ edit.erb
 ├─ Gemfile
 └─ README.md
```

---

## 7. 作業手順概要（詳細は docs/ を参照）
各ステップの目的・コマンド・解説・理解チェック・トラブルシューティングは別途 `docs/` フォルダの Markdown に記載しています。ここでは概要のみ示します。

1. **環境確認**：ruby/bundler/sqlite3/git のバージョン確認。
2. **Git 初期化**：`git init` と初回コミット。
3. **Gemfile & Bundler**：依存宣言と `bundle install`。
4. **Sinatra "Hello"**：`config.ru` と簡易ルート。
5. **DB 設定 & マイグレーション**：`database.yml` 作成→`rake db:migrate`。
6. **モデル実装**：`Todo` クラスでバリデーション追加。
7. **READ ルート + ビュー**：一覧表示。
8. **CREATE**：フォームと `post` ルート。
9. **UPDATE & DELETE**：`patch`/`delete` ルートと `Rack::MethodOverride`。
10. **自動リロード**：`sinatra/reloader` または `rerun`。
11. **GitHub 連携**：`git remote add`→`git push`。
12. **README & 振り返り**：コマンドを自分の言葉で説明。

---

## 8. 学習チェックリスト
- [ ] Bundler が依存解決する仕組みを説明できる
- [ ] ActiveRecord マイグレーション → テーブル作成の流れを説明できる
- [ ] HTTP メソッドと CRUD の対応を言える
- [ ] Git `add/commit/push` の内部概念を説明できる

---

## 9. 今後の発展（Rails への橋渡し）
1. `rails new blog_app` で生成されるファイル構成を本プロジェクトと比較する。
2. Rails の `scaffold` が裏でどのタスクを実行しているか調査する。
3. RSpec + Rack::Test を導入し、モデル & リクエストテストを追加する。
4. Render / Fly.io など PaaS へデプロイし、環境差異を学ぶ。

---

### お疲れさまでした！
本計画書に沿って作業を進めれば、2 時間半で動作する ToDo アプリと、その仕組みを説明できる知識が得られます。疑問が生じた場合は docs/ の「もっと詳しく」 セクションを参照し、知識の蓄積を図りましょう。 