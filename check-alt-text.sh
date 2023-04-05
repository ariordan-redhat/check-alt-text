#!/bin/sh
file=$1
now=$(date +"%Y%m%d%H%M%S")
echo $now
outputfile=$1-$now-all-alt-text.csv
emptyfile=$1-$now-empty-alt-text.csv
searchterm="link:\|image:\|xref:"

# List all files containing images, xrefs, or links
grep -nr --include \*.adoc "$searchterm" ./ > $outputfile

# Replace double :: with single :
sed -i.bak 's/::/:/g'  $outputfile

# Remove text before and after "image[<text>]"
sed -r -i.bak 's/(^.*:[0-9]*:).*(image:.*\]).*$/\1 \2/g' $outputfile
sed -r -i.bak 's/(^.*:[0-9]*:).*(xref:.*\]).*$/\1 \2/g' $outputfile
sed -r -i.bak 's/(^.*:[0-9]*:).*(link:.*\]).*$/\1 \2/g' $outputfile
# sed -r -i.bak "s/(^.*:[0-9]*:).*($searchterm:.*\]).*$/\1 \2/g" $outputfile

# Remove commas
sed -r -i.bak 's/,/ /g' $outputfile

# Replace first 3 colons with commas
sed -r -i.bak 's/:/,/;s/:/,/;s/:/,/' $outputfile

# List the instances where the alt text is empty in a separate file.
grep -nr --include \*.adoc "\[\]" ./ $outputfile > $emptyfile

# Display final search results
# cat $outputfile
tail -5 $outputfile

# Display where the output files are stored.
echo "The following file stores all alt text: " $outputfile
echo "The following file stores empty alt text: " $emptyfile
