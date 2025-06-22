# Add LaTeX DevContainer

aldc: Add LaTeX DevContainer to your LaTeX document repository

## これは何か

LaTeX の文章 (.tex ファイル) を含むディレクトリ(フォルダ)に [VSCode + devcontainer LaTeX 環境](https://github.com/smkwlab/latex-environment) を付加する。LaTeX環境はコンテナで構築する。

この環境は以下のような機能を含む。
- LaTeX でのコンパイル (PDFの作成)
- textlint を用いた校正
- Pull Request 時に指定したユーザへの review リクエスト
- Pull Request 時に PDF の自動作成

## インストール方法

UNIX系OS (Linux, macOS)の基本的な使い方は知っている前提で説明する。
さらに Windows の場合、Git Bash がインストール済みであることを前提とする。

以下では，この環境を追加したい LaTeX の文章を、ファイルごとに専用のディレクトリに配置する。
そのディレクトリを LATEX_SRC と表記する。

1. *Windows* ならば **Git Bash**、*Mac* か *Linux* ならば **ターミナル** を開いて、LATEX_SRC に移動する
   - 一般的には `cd LATEX_SRC` のようなコマンドを実行する
2. 以下のコマンドを実行する

``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smkwlab/aldc/main/aldc)"
```
3. これでインストール終了である

## この環境の使い方

1. VS Code で LATEX_SRC を開く
   - 必ずフォルダを開く
2. ダイアログが開くので `コンテナで再度開く`ボタンをクリックする
3. これで準備完了である。あとは自由に tex ファイルを編集する
   - リアルタイムで textlint による校正結果が（赤波線で）示されるので活用する
5. tex ファイルを保存すると latexmk が自動実行され PDF が生成される
6. SyncTeX により、tex ファイルと PDF ファイルの相互ジャンプが可能である
     - tex ファイル上で Ctrl+Alt+j (Windowsの場合) あるいは command+option+j (macの場合) をクリックすると PDF 上の該当箇所にジャンプする
     - VS Code 内の PDF 上で、Ctrl (Windowsの場合) あるいは command (macの場合) を押しながらクリックすると、tex ファイル上の該当箇所にジャンプする
