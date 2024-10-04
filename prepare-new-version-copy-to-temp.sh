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
# Generating sites for every submodule cause multidocs dont support ganalitys
cd src/dwec-apuntes
mkdocs build
cd ../../src/di-apuntes
mkdocs build
cd ../../src/bda-apuntes
mkdocs build
cd ../../
rm -rf site/dwec-apuntes
rm -rf site/di-apuntes
rm -rf site/bda-apuntes
cp -r src/dwec-apuntes/site site/dwec-apuntes
cp -r src/di-apuntes/site site/di-apuntes
cp -r src/bda-apuntes/site site/bda-apuntes

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