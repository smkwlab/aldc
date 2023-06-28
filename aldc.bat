rem @echo off
rem adlc: Add LaTeX DevContainer

set BACKUP_TARGET=.gitignore .latexmkrc .textlintrc
set TMP_DIR=.tmp
set LATEX_ENV=latexenv
set LATEX_ENV_REPOSITORY=https://github.com/smkwlab/latex-environment.git

if exist .devcontainer (
  echo already added
  exit /b
)

if not exist .git (
  git init .
  git add .
  git rm --cached aldc.bat
  git commit -m "initial commit"
)

if %PROCESSOR_ARCHITECTURE% == AMD64 (
  set BRANCH=alpine
) else (
  set BRANCH=main

)

mkdir %TMP_DIR%
for %%f in ( %BACKUP_TARGET% ) do (
  if exist %%f git mv %%f %TMP_DIR%
)
git commit -m "aldc initialize: backup dot files to avoid conflict"

echo add LaTeX environment
git remote add %LATEX_ENV% %LATEX_ENV_REPOSITORY%
git fetch %LATEX_ENV%
git merge --allow-unrelated-histories -m "aldc: add latex container" %LATEX_ENV%/%BRANCH%
git remote remove %LATEX_ENV%

echo "recover dot files"
cd %TMP_DIR%
for %%f in ( %BACKUP_TARGET% ) do (
  if exist %%f (
    git rm  ../%%f
    git mv %%f ..
  )
)
cd ..
rmdir %TMP_DIR%
git commit -m "aldc finilize: recover dot files"

if exist .devcontainer (
  echo You can delete aldc.bat
)
