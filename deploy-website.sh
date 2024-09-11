#!/bin/bash
#Regenerate website
mkdocs-multirepo --update
mkdocs-multirepo --build
cp -r site/ ../tmp
rm -r site/*
mv -f ../tmp/* site

# Deploy to git
git checkout deploy
git add site/*
git commit -m "new version"
git push origin deploy