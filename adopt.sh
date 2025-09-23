#!/bin/bash

firstname=$1
surname=$2
username=$3
email_domain=$4

set -e

find ./src/* -type f | while IFS= read -r line; do
	sed -i "s/Foo/$firstname/g" $line;
	sed -i "s/Bar/$surname/g" $line;
	sed -i "s/user/$email/g" $line;
	sed -i "s/@foobar.com/$email_domain/g" $line;
done
