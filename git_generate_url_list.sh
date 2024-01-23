#!/bin/bash

# git_generate_url_list.sh

# Generate a list of git remotes that are in the current folder
# (also logs their sizes)
# S. Kramm - 2020-01-04

# see here:
# https://skramm.blogspot.com/2021/01/recovering-set-of-git-repos-with-new.html
# https://github.com/skramm/utility_scripts

a=$(ls -1d */)

echo "# repos list" > url_list.txt
echo "# repos size" > repos_size.txt
for i in $a
do
	echo "Processing $i"
	du $i -hs >> repos_size.txt
	cd $i; git remote get-url --all origin >> ../url_list.txt
	cd ..
done
