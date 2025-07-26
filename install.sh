#! /bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install everything.
for f in ./install/*.sh; do
  echo -e "\nRunning installer: $f"
  source "$f"
done
