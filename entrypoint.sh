#!/bin/sh -l

GITHUB_USERNAME="$1"
GITHUB_REPO="$1"
USER_EMAIL="$2"
README_FILE="$3"

CLONE_DIR=$(mktemp -d)
FOLDER=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone "https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git" "$CLONE_DIR"

ls -la "$CLONE_DIR"

# Copy files into the git and deletes all git
find "$CLONE_DIR" | grep -v "^$CLONE_DIR/\.git" | grep -v "^$CLONE_DIR$" | xargs rm -rf # delete all files (to handle deletions)

ls -la "$CLONE_DIR"

cp -r "$FOLDER"/* "$CLONE_DIR"

cd "$CLONE_DIR"

sed "/^<!-- START gadpp -->.*/a $CLONE_DIR" $README_FILE

git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"
git push origin master
