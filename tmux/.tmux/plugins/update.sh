#!/bin/bash

for i in `find /Users/yorkbai/.tmux/plugins  -type d -maxdepth 1`
do
    pwd
    cd $i
    git pull
done
