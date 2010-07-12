#!/bin/bash

# BibleForge
# 
# @date    02-22-10
# @version 1.0
# @link    http://BibleForge.com
# @license Reciprocal Public License 1.5 (RPL1.5)
# @author  BibleForge <info@bibleforge.com>

# This program imports the databases used by BibleForge into a MySQL database.
# This is designed for Unix-like systems.

echo "Enter database:";
read mysqlDataBase

echo "Enter username:";
read mysqlUserName

gzip -d -c BibleForge.sql.gz | mysql -u $mysqlUserName -p $mysqlDataBase
