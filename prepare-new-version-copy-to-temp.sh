#!/bin/bash

# Update Submodules Apuntes
echo "--------------------------------------------------------------------------------"
echo "--- Updating submodules"
echo "--------------------------------------------------------------------------------"
git submodule update --remote
# Regenerate the site html
echo "--------------------------------------------------------------------------------"
echo "--- Generating new site html"
echo "--------------------------------------------------------------------------------"
mkdocs-multirepo --build
# Delete and copy the file index.html to site
rm site/index.html
cp index.html.sec site/index.html
# Copy site to temp
cp -r site ../tmp
# Git add and commit
echo "--------------------------------------------------------------------------------"
echo "--- Committing new version"
echo "--------------------------------------------------------------------------------"
git add .
git commit -m "preparing new version"
git push