#!/bin/bash

firstname=$1
surname=$2
username=$3
email_domain=$4

set -e

find ./src/ -type f | while IFS= read -r line; do 
	sed -i "s/Jerry/$firstname/g" $line; 
	sed -i "s/Snitselaar/$surname/g" $line;
	sed -i "s/jsnitsel/$email/g" $line;
	sed -i "s/@redhat.com/$email_domain/g" $line;
done
