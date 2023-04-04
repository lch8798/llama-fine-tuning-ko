torchrun --nproc_per_node=1 --master_port=34321 train.py \
    --model_name_or_path "decapoda-research/llama-7b-hf" \
    --cache_dir "./models/decapoda-research/llama-7b-hf" \
    --data_path "./datasets/alpaca/ko.json" \
    --bf16 True \
    --output_dir "./models/alpaca-7b-ko" \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 8 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2000 \
    --save_total_limit 1 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap "LlamaDecoderLayer" \
    --tf32 True