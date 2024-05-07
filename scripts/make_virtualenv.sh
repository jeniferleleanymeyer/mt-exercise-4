#! /bin/bash
# virtualenv must be installed on your system, install with e.g.
# pip install virtualenv
scripts=$(dirname "$0")
base=$scripts/..
mkdir -p scripts/venvs
# python3.10 needs to be installed on your system
python3 -m virtualenv -p python3 scripts/venvs/torch3
echo "To activate your environment:"
echo "    source scripts/venvs/torch3/bin/activate"