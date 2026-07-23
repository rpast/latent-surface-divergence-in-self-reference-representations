source /workspace/nla_infer_010726/venv/bin/activate

git config --global user.email "rpast@protonmail.com"
git config --global user.name "rpast"
git config --global --add safe.directory /workspace/nla_infer_010726

export JUPYTER_PATH=/workspace/jupyter
export HF_HOME=/workspace/nla_infer_010726/hf
export SNAP=$(ls -d $HF_HOME/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/ 2>/dev/null)
