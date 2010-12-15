#!/bin/bash

# BibleForge
# 
# @date    12-15-10
# @version 1.0
# @link    http://BibleForge.com
# @license Reciprocal Public License 1.5 (RPL1.5)
# @author  BibleForge <info@bibleforge.com>

# This program exports the databases used by BibleForge.
# This is designed for Unix-like systems.

printf "Enter database name (bf): "
read mysqlDataBase

if [ "$mysqlDataBase" = "" ]; then
    mysqlDataBase="bf"
fi


printf "Enter username (root): "
read mysqlUserName

if [ "$mysqlUserName" = "" ]; then
    mysqlUserName="root"
fi


printf "Enter password: "
# Turn off typing echo.
stty -echo
read mysqlPassword
# Turn typing echo back on.
stty echo
# Since "echo" is turned off, the return character is not caught, so the script needs to insert a line break manually.
# NOTE: This creates two line breaks because echo automatically adds a line break.
echo -e "\n"

echo "Exporting databases...please wait...";

mysqldump --add-locks=false --lock-tables=false -u "$mysqlUserName" -h localhost -p"$mysqlPassword" "$mysqlDataBase" bible_english bible_english_html bible_english_verses morphology | gzip -9 > BibleForge.sql.gz
