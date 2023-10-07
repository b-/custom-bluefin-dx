#!/usr/bin/env sh

set -e

echo "Cleaning unneeded packages"

rpm-ostree override remove firefox firefox-langpacks
