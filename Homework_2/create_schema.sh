#!/bin/bash
psql -d homework2 -a -f drop.sql 
psql -d homework2 -a -f position.sql
