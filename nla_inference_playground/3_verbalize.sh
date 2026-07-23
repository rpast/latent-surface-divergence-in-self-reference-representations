source /workspace/nla_infer_010726/run_env.sh
cd /workspace/nla_infer_010726/natural_language_autoencoders

SNAP=$(ls -d $HF_HOME/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/)

python nla_inference.py "$SNAP" \
    --sglang-url http://localhost:30000 \
    --parquet /workspace/data/output/202607043840/202607043840_activation.parquet