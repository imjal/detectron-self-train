#!/usr/bin/env bash
#SBATCH --job-name=cs6-HP-fg-WIDER-bs64-4gpu
#SBATCH -o gypsum/logs/%j_cs6-HP-fg-WIDER-bs64-4gpu.txt 
#SBATCH -e gypsum/errs/%j_cs6-HP-fg-WIDER-bs64-4gpu.txt
#SBATCH -p 1080ti-long
#SBATCH --gres=gpu:4
#SBATCH --mem=100000
##SBATCH --cpus-per-task=4
##SBATCH --mem-per-cpu=4096



# starts from WIDER pre-trained model

# Training using only foreground samples from CS6-HP images and 
# all samples from WIDER-train images

python tools/train_net_step.py \
    --dataset cs6-train-hp+WIDER \
    --cfg configs/cs6/e2e_faster_rcnn_R-50-C4_1x_4gpu_joint-fg_bs64_30k.yaml  \
    --load_ckpt Outputs/e2e_faster_rcnn_R-50-C4_1x/Jul30-15-51-27_node097_step/ckpt/model_step79999.pth \
    --iter_size 2 \
    --use_tfboard


# -- debugging --
# python tools/train_net_step.py \
#     --dataset cs6-train-easy-gt-sub+WIDER \
#     --cfg configs/cs6/e2e_faster_rcnn_R-50-C4_1x_quick.yaml  \
#     --load_ckpt Outputs/e2e_faster_rcnn_R-50-C4_1x/Jul30-15-51-27_node097_step/ckpt/model_step79999.pth \
#     --iter_size 2 \
#     --use_tfboard
