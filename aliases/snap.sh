#!/bin/sh

# Create a new branch

BRANCH_NAME="$1"

# Delete merged branches if enabled
if [ -z "$BRANCH_NAME" ]; then
    echo "You must specify a branch name"
    exit 1
fi

git checkout -b "$BRANCH_NAME"
