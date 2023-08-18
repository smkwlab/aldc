# Add Linux DevContainer

aldc: Add LaTeX DevContainer to your LaTeX document repository

## これは何？

LaTeX の文章 (.tex ファイル) に [VSCode + devcontainer LaTeX 環境](https://github.com/smkwlab/latex-environment) を付加します。VS Code で、tex ファイルが含まれるディレクトリを開くと LaTeX のコンパイルと textlint による校正ができます。

## 使い方

UNIX系OS (Linux, macOS)の基本的な使い方は知っている前提で説明します。

まずOS毎に異なる事前準備が必要です。以下では，この環境を追加したい LaTeX の文章があるフォルダを ${LATEX_SRC} と表記します。

### Windows編

- PowerShell を開いて、${LATEX_SRC} に移動します。
- そのディレクトリで PowerShell 上で `wsl` を実行して bash を起動します。
- 共通処理に移動

### Mac/Linux編

- ターミナルを開いて、${LATEX_SRC} に移動します。
- 共通処理に移動

### 共通処理

- 以下のコマンドを実行します。

``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
```
