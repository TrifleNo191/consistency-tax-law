#!/usr/bin/env bash
set -euo pipefail
PATCH="full_finish_patch.diff"
BRANCH="feat/ct-core-fullfinish"

# Basic checks
if [ -n "$(git status --porcelain)" ]; then
  echo "Working tree not clean. Please commit or stash changes before running this script."
  exit 1
fi

# Create branch (or reuse)
git checkout -b "${BRANCH}" || git checkout "${BRANCH}"

# Dry-run apply
echo "Checking patch..."
git apply --check "${PATCH}" || { echo "Patch check failed. Run 'git apply --check ${PATCH}' for details."; exit 1; }

# Apply patch
echo "Applying patch..."
git apply "${PATCH}"

# Add & commit
git add .
git commit -m "feat(full-finish): add ABM, sequence task, LLM emulator, plotting, tests, CI updates, docs, changelog" || true

# Create virtualenv and install deps
if [ ! -d ".venv" ]; then
  python -m venv .venv
fi
# shellcheck disable=SC1091
source .venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

# Run typecheck (may be noisy)
echo "Running typecheck (mypy)..."
make typecheck || echo "Typecheck failed (non-blocking). Inspect output."

# Run tests
echo "Running tests..."
make test

# Run short reproduce + full suite (fast emulators)
echo "Running reproduce and full lightweight experiment suite..."
make reproduce
bash scripts/full_finish/run_all.sh

# Zip the artifact
ZIPNAME="consistency-tax-fullfinish.zip"
echo "Creating archive ${ZIPNAME}..."
git archive --format=zip --output="${ZIPNAME}" HEAD

echo "All done. To push your branch and open a PR:"
echo "  git push -u origin ${BRANCH}"
echo "Then open a PR on GitHub with the recommended PR body file PR_BODY.md"