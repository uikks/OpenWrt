#!/bin/bash

{
	./clean_all.sh &&
	./new_version.sh &&
	ver_num=$(cat version) &&
	git add . &&
	git commit -m "$ver_num" &&
	git clean -xfd  >/dev/null 2>&1 &&
	git tag -d $(git tag -l) &&
	git push --all origin --force &&
	./make_tar.sh
} || exit 1

