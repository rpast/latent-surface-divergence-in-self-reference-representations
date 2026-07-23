#!/bin/bash
source /workspace/nla_infer_010726/run_env.sh    # sets HF_HOME + venv

SNAP=$(ls -d $HF_HOME/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/)
echo "Using checkpoint: $SNAP"

python -m sglang.launch_server \
    --model-path "$SNAP" \
    --port 30000 \
    --disable-radix-cache \
    --mem-fraction-static 0.85 \
    &