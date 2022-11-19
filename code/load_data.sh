#!/bin/bash
# get all urls of data and save all the urls in n file, where n is the number of workers
rm index.txt*
rm urls_of_files
rm job*
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi
wget https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt
foo="$(grep 'https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_' index.txt)"
count=0; njobs=$1
echo "njobs is $njobs"
for var in $foo; do
    echo "$var" >> job"$((count%njobs))"
    count=$((count+1)) 
done
echo "$count urls in total!"