#!/bin/bash


setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_staged_files() {
  git checkout -b dk-travis
  git add git-stage/*
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote -v 
  git remote remove origin	
  git remote add origin https://${GH_USER}:${GH_TOKEN}@github.com/DavidKuna/travis-imagick-osx-i386.git
  git push --quiet --set-upstream origin dk-travis 
}

setup_git
commit_staged_files
upload_files