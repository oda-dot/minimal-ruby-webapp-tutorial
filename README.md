# Webアプリケーションチュートリアル for Ruby

## 概要

このプロジェクトは、RubyでシンプルなTodoアプリを作成するための学習資料です。
作成することを通じて、使用するコマンドや仕組みを自分の言葉で説明できるようになることを目的とした学習プロジェクトです。

想定所要時間： 2 時間半

## 目標（Goal）
1. Sinatra で CRUD が動作する ToDo アプリを作成する。
2. 主要コマンド（ruby, bundler, rake, git など）の 目的と内部動作 を説明できる。
3. git を使って、コードを管理できる。
4. Rails に繋がる基礎（Rack/MVC/ActiveRecord）に触れる。
5. データベースの設計やマイグレーションの仕組みに触れる。


## 採用技術と選定理由
| 分類 | 技術 | バージョン例 | 選定理由 |
|------|------|--------------|----------|
| 言語 | Ruby | 3.4.4（最新） | Rails でも利用される標準言語 |
| FW   | Sinatra | 最新 | 学習コストが低く、内部が追い掛けやすい。Railsより基本を理解しやすくVanillaより手軽に実装できる |
| ORM  | ActiveRecord | 最新 | Rails と同一、将来の学習を活かせる |
| DB   | SQLite | 最新 | 依存レス・ファイルのみで完結 |
| 開発ツール | rerun | 最新 | コード変更を即時反映し効率化 |


## 前提条件
- **WSL2 Ubuntu** 上で作業（Windows Terminal / VSCode Remote-WSL 使用）
- VS Code や Cursor が利用可能（ターミナルは VSCode 内で表示）
- Git がインストール済み & GitHub アカウント作成済み
- ネット接続

## 学習ステップ

各ステップの目的・コマンド・解説・理解チェック・トラブルシューティングは、
別途 `steps/` フォルダの Markdown に記載しています。ここでは概要のみ示します。

- **Step00 環境確認**：ruby/bundler/sqlite3/git のバージョン確認。  
- **Step01 Git 初期化**：`git init` と初回コミット。  
- **Step02 Gemfile & Bundler**：依存宣言と `bundle install`。  
- **Step03 Sinatra "Hello"**：`app.rb` → `config.ru` → `rackup` の流れを確認。  
- **Step04 DB 設定 & マイグレーション**：`database.yml` 作成→`rake db:migrate`。  
- **Step05 モデル実装**：`Todo` クラスでバリデーション追加。  
- **Step06 READ ルート + ビュー**：一覧表示。  
- **Step07 CREATE**：フォームと `post` ルート。  
- **Step08 UPDATE & DELETE**：`patch`/`delete` ルートと `Rack::MethodOverride`。  
- **Step09 自動リロード**：`sinatra/reloader` または `rerun`。  
- **Step10 GitHub 連携**：`git remote add`→`git push`。  
- **Step11 README & 振り返り**：コマンドを自分の言葉で説明。  
- **Step12 Vanilla CSS**：簡単なスタイルを適用。  
- **Step13 Bootstrap**：デザインを強化。  
- **Step14 レイアウト**：共通レイアウトを導入。  
- **Step15 簡易テスト**：Rack::Test でルートの動作確認。

## 学習ステップの設計上の特徴

徐々に形になっていくことが体感できることを大事にしたので、
納得しながら進む感覚を持ってもらえるんじゃないかと思います...！

- **小さな単位でのステップ分割**  
  1 つのステップで学ぶ概念を 1 つに絞り、「読む → 触る → 動かす」を数分で完結できるようにしています。
- **なぜ？どうやって？の説明**  
  各コマンドやファイルの役割を「なぜ」「どう動く」の 2 軸で解説し、自分の言葉で説明できることをゴールに設定しています。
- **コミットタイミングの指定**  
  ステップごとに Git のコミットタイミングを指定しているので、「どこでコミットしよう」と迷わないはず！
- **Rails への布石**  
  Sinatra → Rack → ActiveRecord の順で抽象度を上げ、後で Rails に置き換えてもなるべく迷わないといいなという意図があります
- **段階的な UI レイアウト強化**  
  Vanilla CSS → Bootstrap → 共通レイアウトという 3 段階で UI を強化するので、便利さを体感できると思います。

---

## ディレクトリ構成

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
    └── readme_example.md (step12で使用するREADMEの例)
    └── todoapp-glossary.md (用語集)

```

# todoapp 完成コードリファレンス

学習ステップを終えた後に、自己実装と見比べるための完全版コードが、`final-code`ディレクトリに格納されています。
また、自身の実装が動かない場合には、差分を比較して原因を探してみてください。
自動生成されるファイルやgit管理外のファイルは含まれていません。

最終的なプロジェクトディレクトリ構成例
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