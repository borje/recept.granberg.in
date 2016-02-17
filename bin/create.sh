#!/usr/bin/env bash

TITLE=$1
IMG_URL=$2

PREFIX=$(echo $TITLE|tr '[:upper:]' '[:lower:]'|sed -e "s/[åä]/a/g" -e "s/ö/o/g" -e "s/ /_/g")
echo $PREFIX

wget $IMG_URL -O static/img/food/${PREFIX}.jpeg
if [ $? -ne 0 ]; then
    exit 1
fi

hugo new recept/${PREFIX}.md
RECIPE_FILE=content/recept/${PREFIX}.md

sed -i '' -e "s/^bild.*/bild = \"food\/${PREFIX}.jpeg\"/g" $RECIPE_FILE
sed -i '' "s/^title.*/title = \"${TITLE}\"/g" $RECIPE_FILE

cat <<EOF >> $RECIPE_FILE
### Ingredienser
- 

### Gör så här
1. 
EOF

echo Created $RECIPE_FILE
