# todoapp Step 00 環境確認

## 目的と成果物

### 目的
開発に必要なツールが正しくインストールされ、バージョンを確認できる状態にする。

### 成果物
このステップでコード生成はありません。

## 作業
### 1. Ruby のバージョンを確認
```bash
ruby -v
```
期待例: `ruby 3.x.x` が表示されれば OK。

> 出ない場合は `sudo apt update && sudo apt install ruby-full -y` を実行し、再度 `ruby -v` で確認してください。


### 2. Bundler を確認
```bash
bundler -v
```
期待例: `Bundler version 2.x.x`。

> `command not found` の場合は `sudo gem install bundler` を実行してから再確認。


### 3. SQLite3 を確認
```bash
sqlite3 --version
```
期待例: `3.x.x` のバージョン番号。

> エラーが出たら `sudo apt install sqlite3 -y` でインストール。


### 4. Git を確認
```bash
git --version
```
期待例: `git version 2.x.x`。

> 出ない場合は `sudo apt install git -y`。インストール後、下記でユーザー名を設定しておくと後工程がスムーズです。
```bash
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
```

## ポイント解説

### ツールは何のため？
- **Ruby**: アプリ本体を実行するプログラミング言語。
- **Bundler**: Gem（Ruby ライブラリ）の依存解決とバージョン固定を行うマネージャ。
- **SQLite3**: ファイルベースの軽量 DB。ローカル開発で手軽に使える永続化ストア。
- **Git**: ソースコードの履歴・バージョンを管理し、共同開発を可能にするツール。

### ツールをインストールする場所の違い
開発環境では「どの倉庫で管理するか」によってインストール方法が変わります。

| 役割 | インストール対象 | 管理レイヤ | 代表コマンド |
|------|-----------------|-----------|--------------|
| Bundler 本体 | Gemfile を解決する（Gemfile を読んで Gem を入れる）ツール | RubyGems（グローバル） | `gem install bundler` |
| SQLite ライブラリ | データベースの本体（C言語で書かれている） | apt（OS 全体） | `sudo apt install sqlite3 libsqlite3-dev -y` |
| sqlite3 Gem | Ruby から SQLite を操作する橋渡し役の Gem | Bundler（プロジェクト） | Gemfile に `gem 'sqlite3'` を追加し `bundle install` |

> RubyGems = 言語専用の倉庫、apt = OS 共通の倉庫と覚えておくと整理しやすいです。  
> 言語依存のツール（Bundler など）は RubyGems、複数言語で利用するライブラリ（SQLite 本体など）は apt で管理するのが基本方針です。  
> **libsqlite3-dev** は、SQLite を使うプログラムを「作る」ときにだけ必要な **部品セット（ヘッダーや静的ライブラリ）** です。Ruby の `sqlite3` Gem をインストールする際にも、このセットに含まれる `sqlite3.h` がないと `sqlite3.h: No such file or directory` というエラーでコンパイルが止まります。ビルドが終われば実行時には不要ですが、Python や Go など他言語で SQLite 拡張をソースからビルドするときにも同じく使われる汎用パッケージです。

## 動作確認
各コマンドがエラーなくバージョン番号を返す。

## Commit Point 🚩

今回は、PC本体の環境構築なのでコミットはありません。
プロジェクト作成後は、小さなゴールを達成したら必ずコミットし、問題が起きたときに戻れる地点を増やしましょう。

## 理解チェック
- [ ] インストールした各ツールの役割を口頭で説明できる。
- [ ] インストールする場所の違い、使い分けを説明できる。

## もっと詳しく

- Ruby 公式クイックスタート: https://www.ruby-lang.org/ja/documentation/quickstart/
- Bundler 入門（5 分でわかる）: https://guides.rubygems.org/using-bundler/
- SQLite の特徴をざっくり解説: https://www.sqlite.org/whentouse.html
- Git 超入門（コミットとブランチの基本）: https://backlog.com/ja/git-tutorial/

AI への質問例
```
Git のブランチとは何ですか？図を使って簡単に説明してください。
```