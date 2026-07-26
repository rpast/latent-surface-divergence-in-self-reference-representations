#!/bin/bash
# run_env.sh — restores the dev environment on a fresh RunPod pod.
# Everything outside /workspace resets on redeploy.
#
# MUST BE SOURCED, NOT EXECUTED:
# $ source /workspace/nla_infer_010726/run_env.sh
#
# Sets: git identity; safe.directory; jupyter kernel;
# HF_HOME (persistent model cache); SNAP (local path to the NLA checkpoint);
# then activates the venv.
#
# You may want to adjust this file to your specific usecase

git config --global user.email "rpast@protonmail.com"
git config --global user.name "rpast"
git config --global --add safe.directory /workspace/nla_infer_010726

python -m ipykernel install --user --name nla --display-name "NLA (venv)"

export JUPYTER_PATH=/workspace/jupyter
export HF_HOME=/workspace/nla_infer_010726/hf
export SNAP=$(ls -d $HF_HOME/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/ 2>/dev/null)

source /workspace/nla_infer_010726/venv/bin/activate