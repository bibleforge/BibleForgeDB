#!/bin/bash

# BibleForge
# 
# @date    02-22-10
# @version 1.0
# @link    http://BibleForge.com
# @license Affero General Public License Version 3 (AGPL-3.0)
# @author  BibleForge <info@bibleforge.com>

# This program imports the databases used by BibleForge into a MySQL database.
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

# Check to see if the database exists.
# NOTE: Backticks (`) execute the command and store the results.
# NOTE: 2>&1 gets STDERR and redirects it to STDOUT.
# NOTE: The -e argument makes mysql quite immediately.
RES=`mysql -u "$mysqlUserName" -p"$mysqlPassword" "$mysqlDataBase" -e "show tables;" 2>&1`

# See if an error message was returned.  Error 1049 means no database was found.
# NOTE: Get the trailing space to make sure that we get the entire error number.
if [ "${RES:0:11}" = "ERROR 1049 " ]; then
    echo "Attempting to create database '$mysqlDataBase'"
    mysql -u "$mysqlUserName" -p"$mysqlPassword" -e "CREATE DATABASE \`$mysqlDataBase\`;"
fi

echo "Importing databases...please wait...";

gzip -d -c BibleForge.sql.gz | mysql -u "$mysqlUserName" -p"$mysqlPassword" "$mysqlDataBase"
