#!/bin/bnash
#usage ./script_name.sh <oc project> <site a/b> <domain non prod/prod>
$FILES/*.yml
do
  echo "genereating json for : $f"
  oc process -f $f --param-file=$FILES/app.env.$2 --ignore-unknown-parameteres > $f.json
done

#Deplo json data files to OC
for f in $FILES/*.json
do 
  echo "deploying to oc: $f"
  oc apply -f $f -n $1
done

#Cleanup
rm -fr $FILES/*json
  
}

oc login <url>
run $1 $3
