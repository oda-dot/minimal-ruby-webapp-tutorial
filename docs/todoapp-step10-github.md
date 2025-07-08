# todoapp Step 10 GitHub 連携（git remote & push）

## 目的
ローカルリポジトリを GitHub に公開し、共有・バックアップできるようにする。

## 作業
> 事前に GitHub 上で空のリポジトリ（例: `yourname/todo_app`）を作成しておきます。

### 1. リモートを登録
```bash
git remote add origin https://github.com/yourname/todo_app.git
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

## ポイント解説
- `remote` はリモート URL のニックネーム。
- `-u` で上流ブランチを関連付け、以降 `git push` だけで OK。

## 動作確認
GitHub のリポジトリページでファイル一覧が見えれば成功。

## 理解チェック
- [ ] remote と branch の関係を説明できる

## もっと詳しく
### 公式ドキュメント
- GitHub Docs: https://docs.github.com/ja/get-started/quickstart

### 検索キーワード例
```
git remote add origin existing project
fatal remote origin already exists
```

### AI への質問テンプレ
```
`git push` で "repository not found" エラーになります。
リモート URL と権限設定を確認する方法を教えてください。
```

### 用語メモ
- **remote**: ローカルリポジトリが参照するリモート先 URL のエントリ。
- **origin**: 慣習的に最初のリモートに付ける名前。

## Commit Point 🚩
```bash
git add .gitignore
git commit -m "STEP10: push project to GitHub"
```

### 自分でやってみよう
- GitHub 上で README を直接編集し、その変更を `git pull` で取り込んでみましょう。
- `git remote -v` で設定内容を確認し、HTTPS → SSH へ変更してみましょう。

### 完成コード例
Git 操作のためコード変化はありません。 

### 深く理解するために
- `remote` と `branch` の基本用語
- GitHub に Push する流れ（図解記事）

AI への質問例
```
`origin` という名前はなぜデフォルトで使われるの？
``` 