# 📝 todoapp Step 11 README と振り返り

ここまでで一旦アプリは完成です！👏
最後に README を整えて、未来の自分や他の開発者に親切なプロジェクトに仕上げましょう。

---

## 🎯 目的と成果物

### 目的
- README の役割を理解する。
- README を作成しながらプロジェクト全体を振り返る。

### 成果物
- `README.md`

---

## 🚀 作業フロー

### 1. README を作成する
```bash
touch README.md
cursor README.md
```

### 2. ひな形をコピーして編集する
`appendix/readme_example.md` にひな形があるのでコピーして、中身を読みつつ自分用にカスタマイズする。

> ひな形はあくまで参考。プロジェクトの特徴やセットアップ手順を自分の言葉で書き直して OK！

---

## 💡 ポイント解説
- README は **未来の自分 / 他の開発者** への説明書。
- 何を作ったか、どう動かすか、依存ツール、ライセンスなどを Markdown でまとめる。
- スクリーンショットや GIF を貼るとより伝わりやすいです。

### Markdown のよく使う記法
| 記法 | 出力例 | メモ |
|------|-------|------|
| `# 見出し` | 大見出し | `##` や `###` で階層を下げる |
| `` `code` `` | `code` | インラインコード |
| ``` ```code``` ``` | 複数行コード | ```rb で言語指定するとシンタックスハイライト |
| `- list` | 箇条書き | `1.` で番号付きリスト |

---

## ✅ 動作確認
- GitHub 上で README がきれいに表示されている。

---

## 🚩 Commit Point
```bash
git add README.md
git commit -m "STEP11: create README"
git push
```

---

## 📝 理解チェック
- [ ] README の目的を説明できる。
- [ ] Markdown の基本記法を 3 つ挙げられる。

---

## 🔗 もっと詳しく知りたいとき
- Markdown Guide: https://www.markdownguide.org/basic-syntax/
- 良い README の例 (GitHub Docs): https://docs.github.com/ja/communities/setting-up-your-project-for-healthy-contributions

---

🤔 AI に聞いてみよう 🤖
```
README に何を書けばよいか悩んでいます。この Todo アプリの README 構成を提案してください。
```