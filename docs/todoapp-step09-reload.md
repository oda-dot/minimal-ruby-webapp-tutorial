# todoapp Step 09 自動リロード導入

## 目的と成果物

### 目的
コード変更時にサーバーを手動再起動せずに済むようにする。

### 成果物
app.rb (更新)


## 作業
### 1. sinatra/reloader を有効化（推奨）
```bash
# Gemfile ですでに sinatra-contrib を入れている想定
cursor app.rb   # 先頭付近に下行を追加して保存
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


### 用語メモ
- **reloader**: ファイル変更検知でアプリを自動再ロードする Sinatra の拡張。
- **rerun**: 任意コマンドを監視再実行する外部ツール。


## 動作確認
ファイルを保存してからブラウザをリロード → 変更が反映されていれば成功。


## Commit Point 🚩
```bash
git add app.rb
git commit -m "STEP09: enable auto reload via sinatra/reloader"
```


## 理解チェック
- [ ] reloader と rerun の違いを説明できる

## もっと詳しく

- sinatra/reloader: https://github.com/sinatra/sinatra#reloading
- rerun: https://github.com/alexch/rerun
- コードを自動再読み込みするメリット
- `sinatra/reloader` と `rerun` の簡単な違い

AI への質問例
```
自動リロードを使うと開発体験がどう良くなりますか？
```