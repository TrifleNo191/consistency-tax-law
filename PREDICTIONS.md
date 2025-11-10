# Testable Predictions

## Prediction 1: LLM Deception Overhead
**Hypothesis**: Forcing LLMs to lie increases measurable costs
**Metrics**: Token count, latency, perplexity, energy
**Expected Effect Size**: 30-100% increase
**Falsification**: If deceptive == truthful across all metrics
```

**EXPERIMENTS.md**: Complete protocols
- LLM replication protocol (from Appendix A3)
- Biological validation protocol (from Appendix A2)
- Computational simulation code (you have this)

**ROADMAP.md**: Staged validation program
- Stage 1: Computational (Months 1-6)
- Stage 2: Biological (Months 7-24)  
- Stage 3: Theoretical (Months 12-36)
- Stage 4: Applications (Months 24-60)

### 3. **Evidence & Data Directory**
```
evidence/
├── llm_experiments/
│   ├── claude_results.csv
│   ├── gpt4_results.csv
│   └── analysis.ipynb
├── simulations/
│   ├── consistency_tax_sim.py
│   ├── results.csv
│   └── visualization.ipynb
└── preliminary_findings.md
