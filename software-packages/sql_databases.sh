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
go install github.com/sqls-server/sqls@latest

#______________________________________________________________________________
# SECTION: Better CLI tools (Syntax Highligting and Autocompletion)

# NOTE: `uv` must be installed
# sudo pacman -S -needed `uv` 

# SQLite
uv tool install litecli

# MySQL
uv tool install mycli 

# PostgreSQL 
uv tool install pgcli

#______________________________________________________________________________
