#!/bin/bash

echo "Where is root dir?"
read -r rootDir
git add "$rootDir"

echo "What is your commit message?"
read -r commitMessage
git commit -m "$commitMessage"

echo "Push?"
read -r pushDecision
if [ "$pushDecision" == "y" ]; then
  git commit
fi
