#!/bin/bash

python -m llava.eval.model_vqa \
    --model-path checkpoints/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa/ \
    --model-base lmsys/vicuna-7b-v1.5 \
    --question-file ./playground/data/eval/mm-vet/llava-mm-vet.jsonl \
    --image-folder /src/projects_2022/clipcapv2/Data/mm-vet/images/ \
    --answers-file ./playground/data/eval/mm-vet/answers/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.jsonl \
    --temperature 0 \
    --conv-mode vicuna_v1

mkdir -p ./playground/data/eval/mm-vet/results

python scripts/convert_mmvet_for_eval.py \
    --src ./playground/data/eval/mm-vet/answers/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.jsonl \
    --dst ./playground/data/eval/mm-vet/results/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.json

