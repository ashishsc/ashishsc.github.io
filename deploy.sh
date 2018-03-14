#!/bin/bash
git checkout -b master
elm-app build
cp -R build/* .
git add .
git commit -m "Update"