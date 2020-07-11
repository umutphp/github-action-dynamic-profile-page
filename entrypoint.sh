#!/bin/sh -l

GITHUB_USERNAME="$1"
GITHUB_REPO="$1"
USER_EMAIL="$2"
README_FILE="$3"

echo "Start the job"

CLONE_DIR=$(mktemp -p . -d)
FOLDER=$(mktemp -p . -d)

echo "Start clonning"

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git config --global user.password "$API_TOKEN_GITHUB"

git clone "https://$API_TOKEN_GITHUB@github.com/$GITHUB_USERNAME/$GITHUB_REPO.git" "$CLONE_DIR"

ls -la "$CLONE_DIR"

cd "$CLONE_DIR"

INSERTED_LINE="- $GITHUB_REPOSITORY, [$GITHUB_REF@$GITHUB_SHA](https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA)"
DELETE_PREFIX="$GITHUB_REPOSITORY"

# sed "/$DELETE_PREFIX/d" $README_FILE > readme_changed.md

# mv readme_changed.md $README_FILE

grep -v "$DELETE_PREFIX" $README_FILE > readme_changed.md
mv readme_changed.md $README_FILE

sed "/^<!-- START gadpp -->.*/a $INSERTED_LINE" $README_FILE > readme_changed.md
mv readme_changed.md $README_FILE

git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA"
git push origin master
