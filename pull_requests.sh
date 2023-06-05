#!/usr/bin/bash

# script to automate the pull requests to keep all repos in repos dir up to date
# this relies on your repos being contained in $HOME/repos

# find all dirs and sub dirs
for dir in $(find $HOME/repos/* -maxdepth 1 -type d); do
    # check for valid directory and check for .git
    if [[ -d $dir ]] && [[ -d $dir/.git ]]; then
        (
            # go to dir and git pull
            echo $dir
            cd $dir
            git pull --rebase
        );
    fi
done
