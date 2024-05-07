#! /bin/bash
# scripts=$(dirname "$0")
# base=$scripts/..
# models=scripts/models
# configs=scripts/configs
mkdir -p models
# num_threads=10
#device=0
# measure time
SECONDS=0
# logs=scripts/logs
# model_name1=deen_transformer_regular
# model_name2=deen_transformer_pre
# model_name3=deen_transformer_post
mkdir -p logs
mkdir -p logs/deen_transformer_regular
OMP_NUM_THREADS=10 python3 -m joeynmt train configs/deen_transformer_regular.yaml > logs/deen_transformer_regular/out 2> logs/deen_transformer_regular/err
echo "time taken:"
echo "$SECONDS seconds"
# 
mkdir -p logs/deen_transformer_pre
OMP_NUM_THREADS=10 python3 -m joeynmt train configs/deen_transformer_pre.yaml > logs/deen_transformer_pre/out 2> logs/deen_transformer_pre/err
echo "time taken:"
echo "$SECONDS seconds"
# 
mkdir -p logs/deen_transformer_post
OMP_NUM_THREADS=10 python3 -m joeynmt train configs/deen_transformer_post.yaml > logs/deen_transformer_post/out 2> logs/deen_transformer_post/err
echo "time taken:"
echo "$SECONDS seconds"