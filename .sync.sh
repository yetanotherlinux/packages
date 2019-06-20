#!/bin/bash
set -e

git checkout master
git pull
git push

branches=( x86_64 aarch64 )
for i in "${branches[@]}"
do
	git checkout $i
	git pull
	git rebase master
	git push --force
done

git checkout master
git push
