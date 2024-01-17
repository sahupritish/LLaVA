# !/bin/bash

python -m llava.eval.model_vqa_loader \
    --model-path checkpoints/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa/ \
    --model-base lmsys/vicuna-7b-v1.5 \
    --question-file ./playground/data/eval/MME/llava_mme.jsonl \
    --image-folder /src/projects_2022/clipcapv2/Data/MME_Benchmark/ \
    --answers-file ./playground/data/eval/MME/answers/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa.jsonl \
    --temperature 0 \
    --conv-mode vicuna_v1

cd ./playground/data/eval/MME

python convert_answer_to_mme.py --experiment llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa

cd eval_tool

python calculation.py --results_dir answers/llava-v1.5-7b-lora-sharegptv5_sampled_noqgen_vqa
