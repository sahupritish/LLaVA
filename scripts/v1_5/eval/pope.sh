#!/bin/bash

python -m llava.eval.model_vqa_loader \
    --model-path checkpoints/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa/ \
    --model-base lmsys/vicuna-7b-v1.5 \
    --question-file ./playground/data/eval/pope/llava_pope_test.jsonl \
    --image-folder  /src/projects_2022/clipcapv2/Data/coco/images/val2014/ \
    --answers-file ./playground/data/eval/pcheckpoints/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.jsonl \
    --temperature 0 \
    --conv-mode vicuna_v1

python llava/eval/eval_pope.py \
    --annotation-dir /src/projects_2022/clipcapv2/Data/pope/output/coco \
    --question-file ./playground/data/eval/pope/llava_pope_test.jsonl \
    --result-file ./playground/data/eval/pcheckpoints/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.jsonl
