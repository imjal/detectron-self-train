#!/usr/bin/env bash
#SBATCH --job-name=bdd_source_and_dets18k_distill060.sh
#SBATCH -o gypsum/logs/%j_bdd_source_and_dets18k_distill060.sh.txt 
#SBATCH -e gypsum/errs/%j_bdd_source_and_dets18k_distill060.sh.txt
#SBATCH -p 1080ti-long
#SBATCH --gres=gpu:4
#SBATCH --mem=100000
##SBATCH --cpus-per-task=4
##SBATCH --mem-per-cpu=4096



python tools/train_net_step.py \
    --dataset bdd_peds+DETS18k \
    --cfg configs/baselines/bdd_distill060.yaml \
    --iter_size 2 \
    --use_tfboard \
    --load_ckpt /mnt/nfs/work1/elm/arunirc/Research/detectron-video/detectron_distill/Detectron-pytorch-video/Outputs/e2e_faster_rcnn_R-50-C4_1x/Jul30-15-51-27_node097_step/ckpt/model_step79999.pth \
    #--load_ckpt Outputs/cityscapes/baseline_bdd_clear_any_daytime/ckpt/model_step69999.pth \
    #--load_ckpt Outputs/e2e_faster_rcnn_R-50-C4_1x/Jul30-15-51-27_node097_step/ckpt/model_step79999.pth \
