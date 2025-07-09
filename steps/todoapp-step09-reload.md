# todoapp Step 09 自動リロード導入

## 目的と成果物

### 目的
コード変更時にサーバーを手動再起動せずに済むようにする。

### 成果物
Gemfile(更新)
Gemfile.lock(自動更新)


## 作業

### 1. rerun Gem をインストール
```bash
cursor Gemfile
```

`gem "rerun"`を追加して、以下のコマンドでインストール

```bash
bundle install --path vendor/bundle
```
---

### 2. rerun でサーバーを監視起動
```bash
bundle exec rerun -- rackup -p 4567
```
このターミナルを開いたまま別ウィンドウで編集すると、変更時に `rackup` が再起動します。
サーバーを手動で立ち上げる必要がなくなり、ブラウザでリロードするだけで変更を確認できて便利です。

---

## ポイント解説
- gemは途中から追加することもできる
- アプリに直接関係しないが、開発をラクにするツールも入れると便利

### 用語メモ
- **rerun**: 任意のコマンドを監視し、再実行する外部ツール。

## 動作確認
適当な編集をして、ファイルを保存してからブラウザをリロード → 変更が反映されていれば成功。
※コミット前に変更は元に戻しておきましょう。

## Commit Point 🚩
```bash
git add Gemfile Gemfile.lock
git commit -m "STEP09: enable auto reload via rerun"
```

## 理解チェック
- [ ] rerun の導入意図を説明できる

## もっと詳しく

- rerun: https://github.com/alexch/rerun
- コードを自動再読み込みするメリット
- 公式提供の`sinatra/reloader`でも自動リロードはできますが、今回は`rerun`という外部ツールを採用しました。理由をsinatraの公式ドキュメントから読み取れますか？: https://sinatrarb.com/contrib/

AI への質問例
```
自動リロードを使うと開発体験がどう良くなりますか？
```