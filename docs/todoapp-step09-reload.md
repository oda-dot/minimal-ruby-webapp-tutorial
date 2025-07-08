# todoapp Step 09 自動リロード導入

## 目的
コード変更時にサーバーを手動再起動せずに済むようにする。

## 作業
### 1. sinatra/reloader を有効化（推奨）
```bash
# Gemfile ですでに sinatra-contrib を入れている想定
code app.rb   # 先頭付近に下行を追加して保存
```
```ruby
require "sinatra/reloader" if development?
```
アプリを再起動すれば、以降のファイル保存で自動リロードされます。

---

### 2. rerun でサーバーを監視起動（代替）
```bash
bundle exec rerun -- rackup -p 4567
```
このターミナルを開いたまま別ウィンドウで編集すると、変更時に `rackup` が再起動します。
---

## ポイント解説
- **reloader** は development 環境限定で `before_reload` フックなども使える。
- **rerun** は any コマンドを再実行。

## 動作確認
ファイルを保存してからブラウザをリロード → 変更が反映されていれば成功。

## 理解チェック
- [ ] reloader と rerun の違いを説明できる

## もっと詳しく
### 公式ドキュメント
- sinatra/reloader: https://github.com/sinatra/sinatra#reloading
- rerun: https://github.com/alexch/rerun

### 検索キーワード例
```
sinatra reload not working
rerun sinatra ubuntu
```

### AI への質問テンプレ
```
`require "sinatra/reloader"` を入れても自動リロードされません。
環境変数や起動方法の確認ポイントを教えてください。
```

### 用語メモ
- **reloader**: ファイル変更検知でアプリを自動再ロードする Sinatra の拡張。
- **rerun**: 任意コマンドを監視再実行する外部ツール。

## Commit Point 🚩
```bash
git add Gemfile app.rb
git commit -m "STEP09: enable auto reload via sinatra/reloader"
```

### 自分でやってみよう
- `rerun` と `reloader` の速度差やメモリ消費を比較してみましょう。
- 特定ファイルのみ監視対象から除外する rerun オプションを調べてみましょう。

### 完成コード例
app.rb の require 行は docs/todoapp-final-code.md を参照してください。

### 深く理解するために
- コードを自動再読み込みするメリット
- `sinatra/reloader` と `rerun` の簡単な違い

AI への質問例
```
自動リロードを使うと開発体験がどう良くなりますか？
```

### ここで書いたコードを分解してみよう
- `require "sinatra/reloader" if development?` : **開発モード** のときだけ自動リロード機能を読み込む。 