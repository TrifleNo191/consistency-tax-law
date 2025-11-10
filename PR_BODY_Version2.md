# PR: feat(full-finish) — full-finish experiments, ABM, sequence, LLM emulator, CI, docs

Summary
-------
This PR adds the "full-finish" experiment scaffolding for the Consistency Tax (CT) project:
- Agent-based evolutionary simulation (experiments/abm)
- Sequence-prediction baseline + ablations (experiments/sequence)
- Synthetic calibration plotting and improvements (experiments/synthetic)
- Lightweight LLM contradiction emulator (experiments/llm)
- Orchestration script to run the full lightweight pipeline (scripts/full_finish/run_all.sh)
- Plotting utility and example outputs
- CI workflow to run tests, typecheck, and the lightweight experiments and upload artifacts
- CHANGELOG and FULL_FINISH_README with reproduction steps
- Tests: tests/test_abm.py and expanded unit tests

Why
---
The branch implements a deterministic, CI-safe, reproducible set of lightweight experiments to exercise CT hypotheses and provide a path to replace emulators with real experiments (LLM calls, biological assays) later. It preserves the project's "one-command reproduce" goal and includes pinned deps.

How to reproduce (local)
------------------------
1. Ensure working tree clean.
2. Run:
   ./scripts/apply_and_run.sh
3. After success:
   git push -u origin feat/ct-core-fullfinish

Checks & CI
----------
- CI (GitHub Actions) runs mypy typecheck, pytest, make reproduce, and the full lightweight experiment suite.
- The pipeline uploads `out/` artifacts for inspection.

Review checklist (PR author)
- [ ] Problem + hypothesis + falsification test (in docs)
- [ ] Repro steps + seed + expected metrics (FULL_FINISH_README.md)
- [ ] Baseline(s) + ablation(s) present in experiments
- [ ] Docs updated (spec/theory/README)
- [ ] CHANGELOG entry added
- [ ] Risks/limitations noted in docs

Notes / Next steps
------------------
- LLM emulator is a placeholder. Replace `emulator_loop` in experiments/llm/run_llm_contradiction.py with real model calls and measurement hooks when ready (API keys handled via environment variables).
- For heavy real experiments (fMRI, bacterial optogenetics, large LLM throughput), update CI to not run heavy jobs; run experiments on dedicated infra and upload artifacts.

If you'd like, I can:
- produce a PR title/labels/suggested reviewers to paste into GitHub,
- create a figure notebook that reads out the CSVs and renders publication-ready panels,
- or help you iterate on any failing tests from your run logs.