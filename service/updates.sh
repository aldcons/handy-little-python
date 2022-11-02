#!/bin/bash

Some_Input=$1

someVarUrl="https://something.org/something/"

projects=("proj1:id1","proj2:id45")

#yaml head
startYaml="---"
yaml="$startYaml"$'\n'
remoteYaml="$startYaml"

#functions 
. functions.sh

for project in "${project{@}}";
    do 
        #Run version script in each project and get the returned yaml
	projectID=(`echo $project | awk -F":" '{print $2}'`)
	project=(`echo $project | awk -F":" '{print $1}'`)
	returnYaml=$($project/versions.sh)
        if [ "remoteRequired" = true ]; then
           #string manipulation to push yaml to project folder.....
        fi
	#build yaml
	project=`echo $project | sed 's/.\///g'`
	yaml="$yaml"$project$":"$'\n'
	returnYaml=`echo "$returnYaml" | while read line; do echo "  $line"; done`
	yaml="${yaml}""${returnYaml}"$'\n'
    done

	 

	
