# 🔍 todoapp Step 00 環境確認

このステップでは、開発に必要なツールがインストール済みであることを確認します。すべて OK になったら次のステップへ進んでください。

---

## 🎯 目的と成果物

### 目的
- Ruby / Bundler / SQLite3 / Git のバージョンを確認する。
- 必要であれば各ツールをインストールする。

### 成果物
- このステップでコードは生成しません。

---

## 🚀 作業フロー

### 1. Ruby のバージョンを確認する
```bash
ruby -v
```
期待例: `ruby 3.x.x` が表示されれば OK。

> 何も出ない場合は次のコマンドでインストールし、再度確認する。
> ```bash
> sudo apt update && sudo apt install ruby-full -y
> ruby -v
> ```

### 2. Bundler を確認する
```bash
bundler -v
```
期待例: `Bundler version 2.x.x`。

> `command not found` と表示されたら次を実行する。
> ```bash
> sudo gem install bundler
> bundler -v
> ```

### 3. SQLite3 を確認する
```bash
sqlite3 --version
```
期待例: `3.x.x` のバージョン番号。

> エラーが出たら下記でインストールする。
> ```bash
> sudo apt install sqlite3 libsqlite3-dev -y
> ```

### 4. Git を確認する
```bash
git --version
```
期待例: `git version 2.x.x`。

> 出ない場合は下記でインストールする。
> ```bash
> sudo apt install git -y
> ```
> その後、ユーザー情報を設定しておく。
> ```bash
> git config --global user.name  "Your Name"
> git config --global user.email "you@example.com"
> ```

※ユーザー情報は、自信のものに置き換えてください。

---

## 💡 ポイント解説

### ツールは何のために使う？
| ツール | 役割 |
|--------|------|
| Ruby | アプリ本体を実行するプログラミング言語 |
| Bundler | Gem（Ruby ライブラリ）の依存解決とバージョン固定を行うマネージャ |
| SQLite3 | ファイルベースの軽量 DB。ローカル開発で手軽に使える永続化ストア |
| Git | ソースコードの履歴を管理し、共同開発を可能にするツール |

### インストール場所の違い
| 役割 | インストール対象 | 管理レイヤ | 代表コマンド |
|------|-----------------|-----------|--------------|
| Bundler 本体 | Gemfile を解決（Gemfile を読んで Gem を入れる）するツール | RubyGems（グローバル） | `gem install bundler` |
| SQLite 本体 | データベースエンジン（C言語で書かれている） | apt（OS 全体） | `sudo apt install sqlite3 libsqlite3-dev -y` |
| sqlite3 Gem | Ruby から SQLite を操作する橋渡し役 | Bundler（プロジェクト） | Gemfile に `gem 'sqlite3'` を追加し `bundle install` |

> RubyGems は言語専用の倉庫、apt は OS 共通の倉庫と覚えておくとイメージしやすかもです。
> 言語依存のツール（Bundler など）は RubyGems、複数言語で利用するライブラリ（SQLite 本体など）
は apt で管理するのが基本方針です。  
> libsqlite3-dev は、SQLite を使うプログラムを「作る」ときにだけ必要な 部品セット（ヘッ
ダーや静的ライブラリ） です。Ruby の `sqlite3` Gem をインストールする際にも、このセットに含
まれる `sqlite3.h` がないと `sqlite3.h: No such file or directory` というエラーでコンパイル
が止まります。ビルドが終われば実行時には不要ですが、Python や Go など他言語で SQLite 拡張をソ
ースからビルドするときにも同じく使われる汎用パッケージです。

---

## ✅ 動作確認
- 4 つのコマンドがすべてエラーなくバージョン番号を返す。

---

## 🚩 Commit Point
このステップは PC 環境の確認なのでコミットは不要です。
プロジェクトを作成したら、小さなゴールごとにコミットして履歴を残していきます。
そうすることで何か問題が起きたときに、戻せたり、見返せたり役立ちます。

---

## 📝 理解チェック
- [ ] 各ツールの役割を説明できる。
- [ ] インストール場所の違いを説明できる。

---

## 🔗 もっと詳しく知りたいとき
- Ruby 公式クイックスタート: https://www.ruby-lang.org/ja/documentation/quickstart/
- Bundler ガイド: https://guides.rubygems.org/using-bundler/
- SQLite の特徴: https://www.sqlite.org/whentouse.html
- Git チュートリアル: https://backlog.com/ja/git-tutorial/
- Bundler 入門（5 分でわかる）: https://guides.rubygems.org/using-bundler/
- SQLite の特徴をざっくり解説: https://www.sqlite.org/whentouse.html
- Git 超入門（コミットとブランチの基本）: https://backlog.com/ja/git-tutorial/

🤔 AI に聞いてみよう 🤖
```
Git のブランチとは何ですか？図を使って簡単に説明してください。
```