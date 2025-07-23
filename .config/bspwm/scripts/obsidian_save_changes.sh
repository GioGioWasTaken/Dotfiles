#!/bin/bash

# Set default commit message if none provided
COMMIT_MESSAGE=${COMMIT_MESSAGE:-"Automatic commit, used auto save shortcut provided by bash script. 
This is just a utillity script, since I use git as my backup solution."}

cd $PROGRAMMING_DIR /Brain/ || { notify-send "Brain directory not found! Exiting."; exit 1; }

# Check for changes
if ! git diff-index --quiet HEAD --; then
    # Add all changes to git
    git add .

    # Commit the changes
    git commit -m "$COMMIT_MESSAGE"

    # Push the changes to the remote repository
    if git push origin master; then
        notify-send "Changes pushed successfully"
    else
        notify-send "Failed to push changes"
        exit 1
    fi
else
    notify-send "No changes to commit"
fi
