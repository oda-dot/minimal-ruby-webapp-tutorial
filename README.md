# 🔰 Webアプリケーションチュートリアル for Ruby 💎

## 🚀 このガイドの目的
このプロジェクトは、RubyでシンプルなTodoアプリを作成するための学習資料です。
作成することを通じて、使用するコマンドや仕組みを自分の言葉で説明できるようになることを目的とした
学習プロジェクトです。

想定所要時間： 2 時間半

## 🎯 ゴール
1. Sinatra で CRUD が動く Todo アプリを完成させる。
2. `ruby` / `bundler` / `rake` / `git` などのコマンドの目的と内部動作を説明できるようにする。
3. Git でコード履歴を安全に管理する。
4. Rails につながる基礎 (Rack / MVC / ActiveRecord) を触る。
5. DB 設計とマイグレーションの流れを体験する。

## 🛠️ 採用技術
| 分類 | 技術 | バージョン例 | 選定理由 |
|------|------|--------------|----------|
| 言語 | Ruby | 3.4.4 | Rails でも利用される標準言語 |
| FW   | Sinatra | 最新 | シンプルで学習コストが低い。内部が追い掛けやすい。Railsより基本を理解しやすくVanillaより手軽に実装できる |
| ORM  | ActiveRecord | 最新 | Rails と共通、将来に学習を活かせる |
| DB   | SQLite | 最新 | 依存が少なくファイルで完結 |
| ツール | rerun | 最新 | 変更を即時反映 |

## ⛳ 前提環境
- **WSL2 Ubuntu** 上で作業する (Windows Terminal / VS Code Remote-WSL を利用)。
- VS Code または Cursor が使える。
- Git がインストール済みで GitHub アカウントを持っている。
- インターネット接続がある。

## 📚 ステップ一覧
詳細は `steps/` ディレクトリ内の Markdown を参照。ここでは流れだけを示します。

- **Step00: 環境確認** — `ruby -v`, `bundler -v` などをチェックする。
- **Step01: Git 初期化** — `git init` 後に初回コミットを作成する。
- **Step02: Gemfile & Bundler** — 依存を宣言し `bundle install` を実行する。
- **Step03: Sinatra “Hello”** — `app.rb` と `config.ru` を用意し `rackup` で動かす。
- **Step04: DB 設定 & マイグレーション** — `database.yml` を書き `rake db:migrate` を走らせる。
- **Step05: モデル実装** — `Todo` クラスにバリデーションを追加する。
- **Step06: READ** — 一覧表示ビューを追加する。
- **Step07: CREATE** — フォームと `post` ルートを実装する。
- **Step08: UPDATE & DELETE** — `patch` / `delete` ルートを実装する。
- **Step09: 自動リロード** — `sinatra/reloader` または `rerun` を使う。
- **Step10: GitHub 連携** — リモートを追加して `git push` する。
- **Step11: README & 振り返り** — コマンドを自分の言葉で説明する。
- **Step12: Vanilla CSS** — シンプルなスタイルを追加する。
- **Step13: Bootstrap** — デザインを強化する。
- **Step14: レイアウト** — 共通レイアウトを導入する。
- **Step15: テスト** — Rack::Test で動作を確認する。

## 🌱 ディレクトリ構成
```text
├── steps/
│   ├── todoapp-step00-env-check.md
│   ├── todoapp-step01-git-init.md
│   ├── todoapp-step02-gemfile-bundler.md
│   ├── todoapp-step03-sinatra-hello.md
│   ├── todoapp-step04-db-migration.md
│   ├── todoapp-step05-model.md
│   ├── todoapp-step06-read-view.md
│   ├── todoapp-step07-create.md
│   ├── todoapp-step08-update-delete.md
│   ├── todoapp-step09-reload.md
│   ├── todoapp-step10-github.md
│   ├── todoapp-step11-readme-reflection.md
│   ├── todoapp-step12-vanilla-css.md
│   ├── todoapp-step13-bootstrap.md
│   ├── todoapp-step14-layout.md
│   └── todoapp-step15-test.md
└── appendix/
    ├── final-code/... （完成コード）
    └── readme_example.md (step11で使用するREADMEの例)
    └── todoapp-glossary.md (用語集)

```

## 💡 完成コード
学習ステップを一通り終えたあと自分の実装を比較、確認できるように、`final-code` ディレクトリに完成版コードを用意しています。
動かないときは差分を確認し、原因を探す材料にしてみてください。

---

最終的なプロジェクトディレクトリはこんな感じになるはずです。

```text
.
├── .bundle/
│   └── config
├── .git/
│   ├── HEAD
│   ├── config
│   ├── hooks/（各種サンプルフック）
│   ├── info/
│   ├── logs/
│   ├── objects/…（多数のハッシュがあるため省略）
│   ├── refs/
│   └── …（その他管理ファイル）
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app.rb
├── config/
│   └── database.yml
├── config.ru
├── db/
│   ├── development.sqlite3
│   ├── migrate/
│   │   └── 202XXXXXXXXXXXX_create_todos.rb
│   └── schema.rb
├── models/
│   └── todo.rb
├── vendor/
│   └── bundle/…（バンドル済み gem が多数あるため省略）
└── views/
    ├── edit.erb
    ├── index.erb
    ├── layout.erb
    └── new.erb
```
