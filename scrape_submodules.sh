#! /bin/bash

#A simple script to loop through bundle and generate .gitmodules
for mod in $(ls bundle); do 
	module="bundle/$mod"
	cd $module;
	git=$(git remote get-url origin)
	cd - >/dev/null;
	git submodule add $git $module
done
