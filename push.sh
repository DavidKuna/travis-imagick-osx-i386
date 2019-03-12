#!/bin/bash


setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_staged_files() {
  ls
  git checkout -b dk-travis
  git add git-stage/*
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_USER}:${GH_TOKEN}@github.com/DavidKuna/travis-imagick-osx-i386.git > /dev/null 2>&1
  git push --quiet --set-upstream origin dk-travis 
}

setup_git
commit_staged_files
upload_files