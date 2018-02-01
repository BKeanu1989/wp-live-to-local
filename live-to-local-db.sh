#!/bin/bash
# echo Hello, this is a script to create and import a database
echo First, I need some data to execute other scripts, so you just need to enter the information once
read -p 'Database: ' database
echo $database
echo Where is your import file located? - Example: /Users/Test/import.sql
read -p 'Import file location: ' importFile
echo Because we are using this script primarly for wordpress, I need your db prefix
read -p 'Database prefix from import file: ' prefix
echo Now, I need your LIVE URL. Example: https://www.example.com
read -p 'Live URL: ' URL
echo Under what address should it be available on your local machine?
read -p 'local URL: ' localURL
read -p 'MySQL User: ' uservar
read -sp 'MySQL Password: ' passvar

/Applications/MAMP/Library/bin/mysql -u $uservar -p$passvar << EOF

CREATE DATABASE IF NOT EXISTS \`$database\`;
use \`$database\`;
source $importFile;
UPDATE \`${prefix}options\` SET option_value = replace(option_value, "${URL}", "${localURL}") WHERE option_name = 'home' OR option_name = 'siteurl';
UPDATE \`${prefix}posts\` SET post_content = replace(post_content, "${URL}", "${localURL}");
UPDATE \`${prefix}postmeta\` SET meta_value = replace(meta_value, "${URL}", "${localURL}");
EOF

