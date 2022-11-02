#!/bin/bash


repoModuleFunc () {
#loop through git repos
for repo in "${repos[@]}";
    do
	#find the module name
        modName=(`echo $repo | awk -F"," '{print $1}'`)
        #update repo to only the url
	repo=(`echo $repo | awk -F"," '{print $2}'`)
        if [ "$keepVforVersion" = true ]; then
	    #list remote repo and find version number only - strip everything else off
	    repoversion=(`git ls-remote --tags ${repo} | awk '{print $2}' | grep -v '{}' | grep -v '\-rc\|\-RC\|-dev' | awk -F"/" '{print $3}' | sort -V | tail -l`)
	else
	    repoversion=(`git ls-remote --tags ${repo} | awk '{print $2}' | grep -v '{}' | grep -v '\-rc1' | awk -F"/" '{print $3}' | sed /s/v// | sort -n -t. -k1,1 -k2,2 -k3,3 | tail -1`)
        fi
	#add to the yaml
	yaml=$yaml"${modName}ModuleVerson: $repoVersion"$'\n'
    done

}
