#!/bin/bash

cd dataset1 && \
grep -l "sample" * | \
xargs grep -l "CSC510" | \
xargs grep -o "CSC510" | \
uniq -c | \
grep -E '^[[:space:]]*[3-9][0-9]* ' | \
cut -d: -f1 | \
gawk '{ cmd = "stat -f %z \"" $2 "\""; cmd | getline size; close(cmd); print size, $1, $2}' | \
sort -k2,2nr -k1,1nr | \
gawk '{print $3}' | \
sed 's/file/filtered/g'
