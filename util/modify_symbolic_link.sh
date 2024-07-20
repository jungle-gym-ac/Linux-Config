#!/bin/bash

set -v

# Directory containing the symbolic links
dirA="/home/zhangjun/code/hr-vlm/playground/data"

# Base paths for old and new targets, must be ABSOLUTE PATH
oldBase="/opt/tmp/zhangyijun/data/"
newBase="/home/zhangjun/data/"

# Find all symbolic links in dirA
find "$dirA" -type l | while read -r symlink; do
  # Read the target of the symlink
  target=$(readlink -- "$symlink")

  # Check if the target starts with the old base path
  if [[ $target == $oldBase* ]]; then
    # Construct the new target path by replacing oldBase with newBase
    newTarget=$newBase${target#$oldBase}

    echo "newTarget: $newTarget"

    # Remove the old symlink
    rm -- "$symlink"

    # Create a new symlink with the new target
    ln -s "$newTarget" "$symlink"

    echo "Updated symlink: $symlink -> $newTarget"
  fi
done