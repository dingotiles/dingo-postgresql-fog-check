#!/bin/bash

set -e

if [[ "$(which spruce)X" == "X" ]]; then
  echo "Please install spruce, the replacement for spiff"
  echo "See https://github.com/geofffranks/spruce/releases"
  exit 1
fi

usage() {
  echo "usage: ./make_fog.files.sh tmp/creds.yml"
  exit 1
}
creds=$1
if [[ "${creds}X" == "X" || ! -f $creds ]]; then
  usage
fi

fixtures_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $fixtures_dir

fixtures=$(ls *.yml)

cd ..

set -x

mkdir -p tmp
for fixture in $fixtures; do
  echo $fixture
  spruce merge fixtures/$fixture $creds > tmp/${fixture}
done
