#!/bin/sh
#______________________________________________________________________________
# SECTION: SQLite

sudo pacman -S --needed sqlite

#______________________________________________________________________________
# SECTION: PostgreSQL

sudo pacman -S --needed postgresql

#______________________________________________________________________________
# SECTION: MariaDB (MySQL)

# Mariadb is a community-developed fork of MySQL
sudo pacman -S --needed mariadb

#______________________________________________________________________________
# SECTION: Language support for SQL

# NOTE: `go_setup.sh` and `terminal_setup.sh` must be installed

# NOTE: Uncomment this when you want to upgrade
go install github.com/sqls-server/sqls@latest

#______________________________________________________________________________
