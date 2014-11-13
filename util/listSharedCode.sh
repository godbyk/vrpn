#!/bin/sh -e

# List originally generated by removing some files from the list created by
# find * -name "vrpn*.C" -o -name "vrpn*.h" -o -name "vrpn*.h.cmake_in" | sed 's/[.].*//' |sort |uniq

filelist=$(cd $(dirname $0) && pwd)/sharedcode.txt

(
cd $(dirname $0) && cd ..

# This list is all the modules considered to be "common/shared" and thus
# normalized to a standard formatting
cat $filelist | while read module; do
    for ext in C h h.cmake_in; do
        if [ -f ${module}.${ext} ]; then
            echo "${module}.${ext}"
        fi
    done
done
)
