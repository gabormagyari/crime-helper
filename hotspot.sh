#!/bin/bash

scriptPath=`pwd`
repository="$1"
afterDate="$2"

echo $afterDate
echo $repository-evo.log

echo $(dirname $0)

mkdir working
mkdir output

cd $repository
git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat --after=$afterDate > $scriptPath/working/git-evo.log