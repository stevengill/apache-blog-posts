#!/usr/bin/env bash

cd $(dirname "$0")
for f in *.md; do
  echo Processing: $f
  perl -pi -e 's/ (CB-[0-9]+)/ [$1](https:\/\/issues.apache.org\/jira\/browse\/$1)/g' "$f"
  perl -pi -e 's/ \[(CB-[0-9]+)\] / [$1](https:\/\/issues.apache.org\/jira\/browse\/$1) /g' "$f"
done
