#!/bin/sh

# Remove branches that have been merged into main

DELETE_UNMERGED=false
D_FLAG="-d"

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --unmerged) DELETE_UNMERGED=true;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
    shift
done


# Delete merged branches if enabled
if [ "$DELETE_UNMERGED" = true ]; then
  D_FLAG="-D" 
fi


git branch --merged | grep -v "\*" | xargs -n 1 git branch "$D_FLAG"
