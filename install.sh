#!/bin/sh

# Patch gitconfig 
cat gitconfig >> ~/.gitconfig

# Install aliasas
mkdir -p ~/.config/gitconfig
cp -r aliases ~/.config/gitconfig

# Test
git alias

