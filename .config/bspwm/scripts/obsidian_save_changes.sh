#!/bin/bash

# Set default commit message if none provided
COMMIT_MESSAGE=${COMMIT_MESSAGE:-"Automatic commit, used auto save shortcut provided by bash script. 
This is an obsidian notes utillity, as I use git as my backup solution between machines."}

cd $PROGRAMMING_DIR/Brain/ || { echo "Directory not found"; exit 1; }

# Check for changes
if ! git diff-index --quiet HEAD --; then
    # Add all changes to git
    git add .

    # Commit the changes
    git commit -m "$COMMIT_MESSAGE"

    # Push the changes to the remote repository
    if git push origin master; then
        echo "Changes pushed successfully"
    else
        echo "Failed to push changes"
        exit 1
    fi
else
    echo "No changes to commit"
fi
