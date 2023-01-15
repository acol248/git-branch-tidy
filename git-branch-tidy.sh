#!/bin/bash

# Fetch a list of all branches on target git
git fetch --all --prune

# Iterate through all local branches
for branch in `git branch | cut -c3-`; do
    # Check if the branch still exists on remote
    if ! git show-ref --verify --quiet refs/remotes/origin/$branch; then
        # If the branch no longer exists on remote, delete the local copy
        git branch -D $branch
    fi
done