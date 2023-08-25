# Add LaTeX DevContainer

aldc: Add LaTeX DevContainer to your LaTeX document repository

## これは何？

LaTeX の文章 (.tex ファイル) に [VSCode + devcontainer LaTeX 環境](https://github.com/smkwlab/latex-environment) を付加します。VS Code で、tex ファイルが含まれるディレクトリを開くと LaTeX のコンパイルと textlint による校正ができます。

## 使い方

UNIX系OS (Linux, macOS)の基本的な使い方は知っている前提で説明します。Windows の場合、Git Bash がインストール済みであることを前提とします。

以下では，この環境を追加したい LaTeX の文章があるフォルダを ${LATEX_SRC} と表記します。

- `Windows` ならば `Git Bash`、Mac か Linux ならば `ターミナル` を開いて、${LATEX_SRC} に移動します。
- 以下のコマンドを実行します。

``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
```
- VS Code で ${LATEX_SRC} を開くと、開発コンテナを開くようダイアログが表示されるので、それに従ってください
- VS Code の LaTeX Workshop の機能を使って、LaTeX 文章を編集してください
- textlint もインストール済みなので活用してください
