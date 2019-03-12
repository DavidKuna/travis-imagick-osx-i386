#!/bin/bash


setup_git() {
  git config --global user.email "dave.kuna@gmail.com"
  git config --global user.name "David Kuna"
}

commit_staged_files() {
  git remote -v 
  git remote remove origin	
  git remote add origin https://${GH_USER}:${GH_TOKEN}@github.com/DavidKuna/travis-imagick-osx-i386.git > /dev/null 2>&1
  git checkout -b dk-travis-${TRAVIS_BUILD_NUMBER}
  git add git-stage/*
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
  git push -u origin dk-travis-${TRAVIS_BUILD_NUMBER}
}

setup_git
commit_staged_files