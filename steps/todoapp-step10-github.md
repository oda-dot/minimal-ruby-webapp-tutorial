# todoapp Step 10 GitHub 連携（git remote & push）

## 目的と成果物

### 目的
ローカルリポジトリを GitHub に公開し、共有・バックアップできるようにする。

### 成果物
.gitignore


## 作業
> 事前に GitHub 上で空のリポジトリ（例: `yourname/ruby-todo-app`）を作成しておきます。

※yourname 部分はあなたのGitHubアカウント名に置き換えて考えてください。

### 1. リモートを登録
```bash
git remote add origin https://github.com/yourname/ruby-todo-app.git
```

---

### 2. ブランチ名を main に統一（必要な場合）
```bash
git branch -M main
```

---

### 3. 初回 Push
```bash
git push -u origin main
```
認証が通り、GitHub にファイルが反映されれば成功です。
---

---

### 4. .gitignore 作成

まずは現状のgitの状態を見てみましょう
```bash
git status
```
.bundle/やvenderなどのコミットしていないファイルが見れるはずです。
これらはgitで管理する必要がないファイルなので、間違ってコミットすることがないように無視するように設定していきます。

git管理対象としないファイルは、`.gitignore`で設定します。

```bash
touch .gitignore
cursor .gitignore
```

以下をペーストして保存

```.gitignore
## bundler関連ファイル（環境依存のため除外）:
/.bundle/
/vendor/bundle

## データベース関連ファイル（データベースのバックアップなどを含むため除外）:
/db/*.sqlite3
*.sqlite3*
*.db
*.db-shm
*.db-wal

```

もう一度現状のgitの状態を見てみましょう。
.gitignoreに追加したファイルが表示されなくなっているはずです。

```bash
git status
# 期待：.gitignore と db/schema.rb のみが表示される
```

---


## ポイント解説
- `remote` はリモート URL のニックネーム。
- `-u` で上流ブランチを関連付け、以降 `git push` だけで OKになる。
- .gitignoreでgitの管理対象外とするファイルを設定できる

### 用語メモ
- **remote**: ローカルリポジトリが参照するリモート先 URL のエントリ。
- **origin**: 慣習的に最初のリモートに付ける名前。

## 動作確認
- [ ] GitHub のリポジトリページでファイル一覧が見えれば成功。
- [ ] .gitignoreに記載したファイルが管理対象外になっている


## Commit Point 🚩
```bash
git add .
git commit -m "STEP10: push project to GitHub, add .gitignore"
```

`.`は現在のディレクトリ配下全てを意味しています。
今回は、.gitignore と db/schema.rb がステージング、コミットされるはずです。
複数の変更をまとめて操作したいときに便利ですが、不用意に使用すると意図しないファイルも含めてしまうので、気をつけましょう。

## 理解チェック
- [ ] remote と branch の関係を説明できる
- [ ] .gitignoreの作成目的を説明できる

## もっと詳しく

- GitHub Docs: https://docs.github.com/ja/get-started/quickstart
- `remote` と `branch` の基本用語
- GitHub に Push する流れ（図解記事）
- db/schema.rbはなぜ管理対象外としなかったのか

AI への質問例
```
`origin` という名前はなぜデフォルトで使われるの？
``` 