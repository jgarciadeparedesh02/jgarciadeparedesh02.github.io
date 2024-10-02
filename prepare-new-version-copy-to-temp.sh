#!/bin/bash

# Update Submodules Apuntes
git submodule update --remote
# Regenerate the site html
mkdocs-multirepo --build
# Delete and copy the file index.html to site
rm site/index.html
cp index.html.sec site/index.html
# Copy site to temp
cp -r site ../tmp
# Git add and commit
git add .
git commit -m "preparing new version"
git push