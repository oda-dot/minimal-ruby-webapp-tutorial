# todoapp Step 01 Git 初期化

## 目的と成果物

### 目的
プロジェクトを Git でバージョン管理し、変更履歴を残せるようにする。

### 成果物
todo_app
.git


## 作業
### 1. プロジェクトディレクトリを作成し移動
```bash
mkdir ~/todo_app
cd ~/todo_app
```

---

### 2. Git リポジトリを初期化
```bash
git init
```

`.git/` フォルダが生成されれば成功。

---

### 3. 空のまま最初のコミットを作成
```bash
git add .
git commit -m "Initial commit: folder structure"
```

コミット ID が 1 行表示されれば完了。
---

## ポイント解説
- `git init` で `.git/` ディレクトリが作成される。
- コミットは "スナップショット"。履歴を遡れるようになる。

### 用語メモ
- **リポジトリ (repository)**: ソースコードとその履歴を保存する領域。
- **コミット (commit)**: スナップショットを保存する操作。\*1 行コメントは "何をしたか" を現在形で。

## 動作確認
```bash
git log --oneline
```
1 行だけコミットが表示されれば OK。

## 理解チェック
- [ ] `git init` が内部で何を作るか説明できる

## Commit Point 🚩
```bash
git add .
git commit -m "STEP01: initialize empty git repo"
```
> 以降も **ステップごとに 1 回はコミット** する習慣をつけましょう。

## もっと詳しく

- Git Book: https://git-scm.com/book/ja/v2

### 自分でやってみよう
- `git status` を使ってワークツリーの状態を確認し、色の意味を調べてみてください。
- `.git` フォルダの中身を `ls -R .git | less` で覗き、どのようなファイルがあるか把握してみましょう。

### 完成コード例
コード変更はありません。 