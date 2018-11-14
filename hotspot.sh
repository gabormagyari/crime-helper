#!/bin/bash

scriptPath=`pwd`
repository="$1"
afterDate="$2"

mkdir working
mkdir output

cd $repository
git log --pretty=format:'[%h] %aN %ad %s' --date=short --numstat --after=$afterDate > $scriptPath/working/git-evo.log
cloc ./ --unix --by-file --csv --quiet > $scriptPath/working/git-loc.csv
cd $scriptPath
java -jar libs/code-maat-1.1-SNAPSHOT-standalone.jar -l $scriptPath/working/git-evo.log -c git -a revisions > $scriptPath/working/git-rev.csv