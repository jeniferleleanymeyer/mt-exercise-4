#! /bin/bash
# scripts=$(dirname "$0")
# base=$scripts/..
# data=$base/data
# shared_models=$base/shared_models
# download preprocessed data
wget https://files.ifi.uzh.ch/cl/archiv/2021/mt21/data.tar.gz scripts
tar -xzvf scripts/data.tar.gz
rm scripts/data.tar.gz
# download shared models (which, in this case, is only the vocabulary)
wget https://files.ifi.uzh.ch/cl/archiv/2021/mt21/shared_models.tar.gz scripts
tar -xzvf scripts/shared_models.tar.gz
rm scripts/shared_models.tar.gz
# sizes
echo "Sizes of data files:"
wc -l scripts/data/*
echo "Sizes of shared_model files:"
wc -l scripts/shared_models/*
# sanity checks
echo "At this point, please make sure that 1) number of lines are as expected, 2) language suffixes are correct and 3) files are parallel"