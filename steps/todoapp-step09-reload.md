# 🔁 todoapp Step 09 自動リロード導入

コード変更時にサーバーを手動再起動せずに済むように、`rerun` を導入します。開発効率が上がる便利ツールです。

---

## 🎯 目的と成果物

### 目的
- ファイルを保存したら自動で `rackup` を再起動させる。
- 手動でサーバーを落として再起動する手間をなくす。

### 成果物
- `Gemfile` (更新)
- `Gemfile.lock` (自動更新)

---

## 🚀 作業フロー

### 1. Gemfile に `rerun` を追加する
```bash
cursor Gemfile
```
```ruby
# 開発専用ツール
gem "rerun"
```
追加したらインストールします。
```bash
bundle install --path vendor/bundle
```

### 2. rerun でサーバーを監視起動する
```bash
bundle exec rerun -- rackup -p 9292
```
- このターミナルを開いたまま別ウィンドウでファイルを編集して保存すると、`rackup` が自動で再起動します。
- ブラウザをリロードするだけで変更を確認できるので、開発速度がアップします。

---

## 🛠️ コマンドを分解してみよう
| 部分 | 意味 |
|------|------|
| `bundle exec` | プロジェクトの Gem バージョンでコマンドを実行するラッパー |
| `rerun --` | `--` 以降のコマンドを監視対象として実行 |
| `rackup -p 9292` | Sinatra アプリをポート 9292 で起動 |

> **Tips**: `--dir app,views` のように監視対象ディレクトリを絞ることもできます。

---

## ✅ 動作確認
1. `bundle exec rerun -- rackup -p 9292` を起動したまま、`views/index.erb` の見出しなどを編集して保存。
2. ブラウザをリロード → 変更が反映されていれば成功。

---

## 🚩 Commit Point
```bash
git add Gemfile Gemfile.lock
git commit -m "STEP09: enable auto reload via rerun"
```

---

## 📝 理解チェック
- [ ] `rerun` を導入するメリットを 2 つ説明できる。
- [ ] `bundle exec` が必要な理由を説明できる。

---

## 🔗 もっと詳しく知りたいとき
- rerun GitHub: https://github.com/alexch/rerun
- sinatra/reloader (公式プラグイン): https://sinatrarb.com/contrib/
- 自動リロードの比較記事: https://zenn.dev/

---

> 公式提供の`sinatra/reloader`でも自動リロードはできますが、今回
は`rerun`という外部ツールを採用しました。どんな理由からか、sinatraの公式ドキ
ュメントを読んでみて、予想してみてください: https://sinatrarb.com/contrib/

🤔 AI に聞いてみよう 🤖
```
自動リロードを使うと開発体験がどう良くなりますか？

`rerun` と `sinatra/reloader` の違いは？
```