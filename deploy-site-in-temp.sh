#!/bin/bash
cp -r ../tmp/site .
git add .
git commit -m "new version"
git push