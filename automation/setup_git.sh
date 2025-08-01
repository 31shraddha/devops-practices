#!/bin/bash

if [ -f /etc/os-release ]; then 
  . /etc/os-release
  os=$ID

if ! command -v git;; then
  echo "Git is not installed in your system.\n Installing.."
else 
  echo "Git is already installed in your system"
fi

read -p " Do you have a git account?(yes/no): ",has_account
if [[ "$has_account" == "no" ]];then
  echo "Please create a git account first.."
  exit 1
fi

echo "---"
read -p "Do you have github pat?(Yes/no): "has_token
if [[ "$has_token" == "no" ]]; then 
  echo "Please create a PAT from here: https://github.com/settings/tokens \n"
  exit 1
fi

echo "----" 
read -p "enter username: "user
read -p "enter repo_name: "repo_name
read -p "Do you want to create a new repo named '$repo_name' ?(yes/no): "create_repo 
# check if gh CLI (github CLI) is installed

if ! command -v gh &>/dev/null; then
  echo "Installing github cli(gh)..."
  sudo $pkg_manager install -y gh
fi

if [[ "$create_repo" == "yes" ]];then
  echo "Creating new repository '$repo_name' ..."
  gh auth login
  gh repo create "$user/$repo_name" --public --confirm
else 
  echo "Using existing repo: $repo_name"
fi

echo "---"
echo "Setting up your local project...."

read -p "Enter your locak folder name (or existing path): " folder

mkdir -p "$folder"
cd "$folder" || exit

#initialize Git

echo "--- Initialising Git"
git init
echo "# $repo_name" > README.md
git add .
git commit -m "Initial commit"

echo "# setting Remote and push"

remote_url="https://github.com/$user/$repo_name.git"
git remote add origin "$remote_url" 
git remote -v

echo "-----"
git fetch --all
git branch -r

echo "do you want to switch a branch?(yes/no): "branch
if [[ branch == "Yes" ]]; then
  read -p "Enter the branch name: "branch_name
  git checkout -b "$branch_name" origin/$branch_name
else 
  git branch -M main
  branch_name="main"
fi

echo "You'll be asked for your github username and personal access token for push. "

git push -u origin "$branch_name"

echo "----"

echo "Project '$repo_name' has been ready and pushed to github."
echo " view it at: $remote_url"

