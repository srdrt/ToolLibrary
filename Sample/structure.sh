#!/bin/bash

componentsFolder="wwwroot/components/"
scriptsFolder="wwwroot/components/"
structureFile='wwwroot/frontend-structure.json'

function trim {
    local str=${1#$"$2"}
    echo ${str%$"$2"}
}

function removeLastComma {
    echo "$(perl -pe 's/,// if$.==1||eof' $structureFile)" > $structureFile
}

rm -f $structureFile

echo '{"components":{' > $structureFile

for i in $componentsFolder*; do
    if [ -d "$i" ]; then
        componentName=$(trim "$i" "$componentsFolder")
        echo "\"$componentName\":[" >> $structureFile

        for j in $i/*; do
            if [ ! -d "$j" ]; then
                fileName=$(trim "$j" "wwwroot/")
                echo "\"$fileName\"," >> $structureFile
            fi
        done

        removeLastComma
        echo "]," >> $structureFile
    fi
done

removeLastComma
echo '},' >> $structureFile
echo '"scripts":[' >> $structureFile

find $scriptsFolder -type f -name '*.js' | while read file; do
    fileName=$(trim "$file" "wwwroot/")
    echo "\"$fileName\"," >> $structureFile
done

removeLastComma
echo "]}" >> $structureFile
