#!/bin/sh

# Reset the current branch to remote origin/main HEAD

git fetch origin main
git reset hard origin/main
