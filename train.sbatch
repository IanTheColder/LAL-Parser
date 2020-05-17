#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=168:00:00
#SBATCH --mem=10GB
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=yz4135@nyu.edu
#SBATCH --output=train.out
#SBATCH --gres=gpu:v100:1

module purge
module load anaconda3/5.3.1
source activate nlu_env

python src_joint/main.py train \
 --model-path-base models/joint_xlnet_clean_large_3_layers_no_resdrop_lambda \
  --epochs 100 \
 --use-xlnet \
 --use-tags \
 --const-lada 0.5 \
 --dataset ptb \
 --embedding-path data/glove.gz \
 --model-name joint_xlnet_clean_large_3_layers_no_resdrop_lambda \
 --checks-per-epoch 4 \
 --num-layers 3 \
 --learning-rate 0.00005 \
 --batch-size 100 \
 --eval-batch-size 20 \
 --subbatch-max-tokens 1000 \
 --train-ptb-path data/02-21.10way.clean \
 --dev-ptb-path data/22.auto.clean \
 --dep-train-ptb-path data/ptb_train_3.3.0.sd.clean \
 --dep-dev-ptb-path data/ptb_dev_3.3.0.sd.clean \
 --lal-d-kv 128 \
 --lal-d-proj 128 \
 --no-lal-resdrop
