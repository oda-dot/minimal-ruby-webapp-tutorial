# todoapp Step 10 GitHub 連携（git remote & push）

## 目的と成果物

### 目的
ローカルリポジトリを GitHub に公開し、共有・バックアップできるようにする。

### 成果物
.gitignore (必要に応じて)


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

### 用語メモ
- **remote**: ローカルリポジトリが参照するリモート先 URL のエントリ。
- **origin**: 慣習的に最初のリモートに付ける名前。

## 動作確認
GitHub のリポジトリページでファイル一覧が見えれば成功。

## Commit Point 🚩
```bash
git add .gitignore
git commit -m "STEP10: push project to GitHub"
```

## 理解チェック
- [ ] remote と branch の関係を説明できる

## もっと詳しく

- GitHub Docs: https://docs.github.com/ja/get-started/quickstart
- `remote` と `branch` の基本用語
- GitHub に Push する流れ（図解記事）

AI への質問例
```
`origin` という名前はなぜデフォルトで使われるの？
``` 