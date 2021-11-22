#!/bin/bash

config_path=$1
train_output_path=$2
ckpt_name=$3

FLAGS_allocator_strategy=naive_best_fit \
FLAGS_fraction_of_gpu_memory_to_use=0.01 \
python3 ${BIN_DIR}/synthesize_e2e_en.py \
  --fastspeech2-config=${config_path} \
  --fastspeech2-checkpoint=${train_output_path}/checkpoints/${ckpt_name} \
  --fastspeech2-stat=dump/train/speech_stats.npy \
  --pwg-config=pwg_ljspeech_ckpt_0.5/pwg_default.yaml \
  --pwg-checkpoint=pwg_ljspeech_ckpt_0.5/pwg_snapshot_iter_400000.pdz \
  --pwg-stat=pwg_ljspeech_ckpt_0.5/pwg_stats.npy \
  --text=${BIN_DIR}/../sentences_en.txt \
  --output-dir=${train_output_path}/test_e2e \
  --phones-dict=dump/phone_id_map.txt
