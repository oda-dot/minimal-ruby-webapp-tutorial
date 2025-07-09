# todoapp Step 02 Gemfile & Bundler

## 目的と成果物

### 目的
Gemfile で必要ライブラリを宣言し、Bundler で一括インストールする。

### 成果物

.bundle/*　（自動生成）
Gemfile
Gemfile.lock（自動生成）
vendor/bundler/*（自動生成）

## 作業
### 1. Gemfile を作成して VS Code で開く
```bash
touch Gemfile
cursor Gemfile
```
> 直後に下の「Gemfile 例」をコピーして保存してください。

### Gemfile 例
```ruby
source "https://rubygems.org"

gem "puma"
gem "rake"
gem "rackup"
gem "sinatra"
gem "sinatra-activerecord"
gem "sqlite3"

```

---

### 2. 依存ライブラリをインストール
```bash
bundle install --path vendor/bundle
```
`vendor/bundle/` に Gem がダウンロードされれば完了です。
---



### Gemfile を分解してみよう
| 行 | 役割 | 意味 |
|----|------|------|
| `source "https://rubygems.org"` | ここから Gem をダウンロード | Ruby 用の公式倉庫 URL |
| `gem "sinatra"` | Sinatra 本体 | 軽い Web アプリ用ライブラリ |
| `gem "sinatra-activerecord"` | DB 用の橋渡し | Sinatra と ActiveRecord をつなぐ |
| `gem "sqlite3"` | SQLite ドライバ | ファイル型 DB を Ruby から使う |

## ポイント解説
- **Gemfile** は依存宣言ファイル。
- `bundle install` は Gem の依存関係を解決し `vendor/bundle` にインストール。
- `--path` でプロジェクトローカルに閉じ込める。

### 用語メモ
- **Gem**: Ruby のライブラリパッケージ。Python の pip に相当。
- **依存関係 (dependency)**: ライブラリが他のライブラリを必要とする関係。解決を dependency resolution と呼ぶ。
- **vendor/bundle**: プロジェクトローカルに Gem を置く慣習的ディレクトリ。
- **bundle exec**: プロジェクトの Gemfile で指定したバージョンの Gem を使ってコマンドを実行する。

### 依存解決の全体像（図解）
```mermaid
graph TD
  A[Gemfile<br/>（依存宣言）] --> B[bundle install<br/>（Bundler）]
  B --> C[Gem の実体<br/>vendor/bundle 内]
```

### インストールした Gem の目的
| Gem | 役割 |
|-----|------|
| sinatra | 軽量 Web フレームワーク（HTTP ルーティング、ビュー） |
| sinatra-activerecord | Sinatra と ActiveRecord を連携させる拡張 |
| sqlite3 | SQLite DB の Ruby バインディング |


## 動作確認
`bundle exec ruby -e 'puts :Ruby実行準備完了！'` が `Ruby実行準備完了！` を表示すれば実行環境 OK。

## Commit Point 🚩
```bash
git add Gemfile Gemfile.lock
git commit -m "STEP02: add Gemfile and install dependencies"
```

## 理解チェック
- [ ] Gemfile と `gem install` の違いを説明できる

## もっと詳しく

- Bundler: https://bundler.io/
- Sinatra 入門ガイド（公式）: https://sinatrarb.com/intro.html
- Bundler クイックスタート: https://bundler.io/v2.4/#getting-started
- SQLite を使う理由（ブログ記事）: https://zenn.dev/

AI への質問例
```
Gemfile と Gemfile.lock の役割の違いを初心者向けに説明してください。

bundle install --path vendor/bundle のpathオプションは必須でしょうか？

bundle exec ruby -e 'puts :Ruby実行準備完了！'　はどういう意味ですか？
``` 