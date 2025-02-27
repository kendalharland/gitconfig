#!/bin/bash

# Print documentation for git aliases

echo "Git Aliases and Descriptions:"
echo "-----------------------------"

# Get all Git aliases
git config --global --get-regexp '^alias\.' | while read -r alias_line; do
    alias_name=$(echo "$alias_line" | awk '{print $1}' | sed 's/^alias\.//')
    script_command=$(echo "$alias_line" | awk '{$1=""; print substr($0,2)}') # Remove alias name

    # Extract the script path (assuming it's in the format '!sh ~/scripts/git/script_name.sh')
    script_path=$(echo "$script_command" | sed -E 's/^!sh //')

    # Expand tilde (~) to the full home directory path
    script_path=${script_path/#\~/$HOME}

    # Check if the script exists
    if [[ -f "$script_path" ]]; then
        # Extract the first doc comment after the shebang
        doc_string=$(awk 'NR>1 && /^#/ {print substr($0, 3); exit}' "$script_path")
    else
        doc_string="(Script not found)"
    fi

    printf "%-20s %s\n" "$alias_name" "$doc_string"
done

