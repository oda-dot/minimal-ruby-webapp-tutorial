# 🚀 todoapp Step 10 GitHub 連携（remote & push）

ローカルリポジトリを GitHub に公開して、バックアップ＆共有できるようにします。ここまで作った Todo アプリをクラウドにプッシュします。

---

## 🎯 目的と成果物

### 目的
- GitHub の空リポジトリへ初回プッシュする。
- `.gitignore` を設定して不要ファイルをコミットしないようにする。

### 成果物
- `.gitignore`

---

## 🚀 作業フロー

> 事前に GitHub で空のリポジトリ（例: `yourname/ruby-todo-app`）を作成しておく。
※yourname 部分はあなたのGitHubアカウント名に置き換えて考えてくだ
さい。

### 1. リモートを登録する
```bash
git remote add origin https://github.com/yourname/ruby-todo-app.git
```
- `origin` は慣習的に最初のリモートに付ける名前。複数リモートを持つときは `upstream` など別名を使う。

### 2. ブランチ名を main に統一
```bash
git branch -M main
```

### 3. 初回 Push
```bash
git push -u origin main
```
- `-u` で「今後 `git push` だけで OK」にする設定を行う。

### 4. `.gitignore` を作成する

まずは現状のgitの状態を見てみましょう
```bash
git status
```
> .bundle/やvenderなどのコミットしていないファイルが見れるはずです。これらはgitで管理する必要がないファイルなので、間違ってコミットすることがないように無視するように設定していきます。

git管理対象としないファイルは、`.gitignore`で設定します。

```bash
touch .gitignore
cursor .gitignore
```
貼り付けて保存。
```.gitignore
## bundler関連ファイル（環境依存のため除外）:
/.bundle/
/vendor/bundle

## データベース関連ファイル（データベースのバックアップなどを含むため除外）:
/db/*.sqlite3
*.sqlite3*
*.db*
```
再度ステータスを確認。
```bash
git status  # .gitignore と db/schema.rb だけが残るはず
```

---

## 🛠️ コマンドを分解してみよう
| コマンド | 意味 |
|----------|------|
| `git remote add origin URL` | リモート URL を `origin` というニックネームで登録 |
| `git branch -M main` | 現在のブランチ名を強制的に `main` に変更 |
| `git push -u origin main` | `main` ブランチを `origin` へ送信し、上流を設定 |

---

## ✅ 動作確認
- GitHub ページを開いてファイル一覧が見えれば成功。
- `.gitignore` に追加したファイルがコミット対象外になっていることを確認する。

---

## 🚩 Commit Point
```bash
git add .
git commit -m "STEP10: push project to GitHub & add .gitignore"
```
> `.` は “すべて追加” の意味。便利だが意図しないファイルを含めないよう注意。

---

## 📝 理解チェック
- [ ] remote と branch の関係を説明できる。
- [ ] `.gitignore` の役割を説明できる。

---

## 🔗 もっと詳しく知りたいとき
- GitHub クイックスタート: https://docs.github.com/ja/get-started/quickstart
- `remote` / `branch` の基本用語解説: https://git-scm.com/book/ja/v2
- `.gitignore` パターンガイド: https://git-scm.com/docs/gitignore

---

🤔 AI に聞いてみよう 🤖
```
`origin` という名前はなぜデフォルトで使われるのでしょうか？

db/schema.rbはなぜ管理対象外としなかったのでしょうか？

リポジトリを private から public に変えるメリット・デメリットは？
``` 