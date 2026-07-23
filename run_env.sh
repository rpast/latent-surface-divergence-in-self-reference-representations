source /workspace/nla_infer_010726/venv/bin/activate
export HF_HOME=/workspace/nla_infer_010726/hf
export SNAP=$(ls -d $HF_HOME/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/ 2>/dev/null)
git config --global user.email "rpast@protonmail.com"
git config --global user.name "Rafal Pastuszak"
git config --global --add safe.directory /workspace/nla_infer_010726
