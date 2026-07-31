#!/bin/bash
# run_env.sh — local dev environment (laptop/workstation).
# Pod counterpart: workbench/run_env.pod.sh
#
# MUST BE SOURCED, NOT EXECUTED:
# $ source run_env.sh
#
# Sets: HF_HOME (model cache), SNAP (local path to the NLA checkpoint),
# HF_TOKEN (from .secrets.sh, gitignored); then activates the venv.

# project root = this file's directory, so the script works from any cwd
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export HF_HOME="$PROJECT_ROOT/hf"
#command to bypass aliases in ls (ls -> ls -l) that break SNAP path
export SNAP=$(command ls -d "$HF_HOME"/hub/models--kitft--nla-qwen2.5-7b-L20-av/snapshots/*/ 2>/dev/null)
[ -z "$SNAP" ] && echo "note: SNAP empty — NLA checkpoint not in $HF_HOME"

# secrets stay out of git
[ -f "$PROJECT_ROOT/.secrets.sh" ] && source "$PROJECT_ROOT/.secrets.sh"

source "$PROJECT_ROOT/.venv/bin/activate"