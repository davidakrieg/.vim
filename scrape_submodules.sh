#! /bin/bash

#A simple script to loop through bundle and generate .gitmodules
for mod in $(ls bundle); do 
	module="bundle/$mod"
	cd $module;
	git=$(git remote get-url origin)
	if [ -n "${git}" ]; then
		echo "[submodule \"$module\"]"
		echo -e "\tpath = $module"
		echo -e "\turl = $git"
	fi
	cd - >/dev/null;
done > .gitmodules
