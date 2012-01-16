## 1 Run git clone

* Clonar un Proyecto

git clone git@git01.phpfog.com:biojazzard.phpfogapp.com

## 2 Add the file to git change list

* Hacer que se siga (Track a file)

* This command will let git know you want to add the file to the repository. At this point this file is still local to your system.
* The "." lets git know that you want to add all the files in this directory recursively.

git add .

## 3 GIT commit

* 

git commit . -m "Mi tercer update"

* El modificador -a hace que no tengas que hacer "git add" cada vez antes de hacer "comit"

git commit . -a -m "Mi tercer update"

## 4 PUSH - Subir

* 

git push


## GIT Install - Config

ssh-keygen -t rsa -C "biojazzard@yahoo.com"

git config --global user.name "Alfredo Llanos"
git config --global user.email "biojazzard@yahoo.com"

git config --global github.user biojazzard
git config --global github.token a5d9ef8e708574bc8ff4bcedfd67afe4

## A project

* 
git clone git@github.com:biojazzard/html5-boilerplate.git

## BBedit como editor principal

git config --global core.editor "bbedit -w"
