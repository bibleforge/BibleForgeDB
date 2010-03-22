#!/bin/bash

# BibleForge
# 
# @date 02-22-10
# @version 1.0
# @link http://BibleForge.com
# @license Reciprocal Public License 1.5 (RPL1.5)
# @author BibleForge <http://mailhide.recaptcha.net/d?k=01jGsLrhXoE5xEPHj_81qdGA==&c=EzCH6aLjU3N9jI2dLDl54-N4kPCiE8JmTWHPxwN8esM=>

# This program imports the databases used by BibleForge into a MySQL database.
# This is designed for Unix-like systems.

echo "Enter database:";
read mysqlDataBase

echo "Enter username:";
read mysqlUserName

gunzip -c BibleForge.sql.gz | mysql -u $mysqlUserName -p $mysqlDataBase
