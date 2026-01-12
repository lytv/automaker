# Summary of Essential Issues in AI Agent Building

_Based on `upgrade.md`_

This document summarizes the core lessons for building reliable, production-grade AI agents.

## 1. Context Management (Critical)

**"Context is the difference between a $1M agent and a broken demo."**

- **Memory**: Agents must track full history (e.g., why an exception occurred, previous similar issues), not just the current step.
- **Information Flow**: Data must be passed cleanly and structurally between stages. Sloppy handoffs break downstream processes.
- **Domain Knowledge**: Agents need structured access to rules, policies, and risks—they cannot just "figure it out" from raw docs.

## 2. Value Proposition: Multiplication Over Replacement

**"Don't fire humans; let 3 people do the work of 15."**

- **Role Division**: Agents handle high-friction overhead (research, data gathering, routing). Humans provide judgment and approval.
- **Outcome**: Accuracy improves because agents handle grunt work, allowing humans to focus purely on complex resolution.

## 3. Architecture & State Management

**"Architecture matters more than model selection."**
Three common patterns:

1.  **Solo Agents**: Handle entire workflow. _Challenge_: Managing state over long tasks.
2.  **Parallel Agents**: Work simultaneously on parts. _Challenge_: Conflict resolution and merging results.
3.  **Collaborative Agents**: Sequential handoffs (Triage → Research → Resolve). _Challenge_: Loss of context at handoff points.

## 4. Operational Philosophy: Action Over Observation

**"Dashboards are where problems go to die."**

- **Avoid**: Creating dashboards to show problems.
- **Adopt**: Catching exceptions immediately and routing them to the specific person who can fix it, with all necessary context to resolve it instantly.
- **Goal**: Make problems impossible to ignore and easy to solve.

## 5. Economic Strategy: Custom vs. SaaS

**"SaaS accumulates tech debt; Custom Agents accumulate capability."**

- **SaaS**: Often unused, creates new silos, depreciates.
- **Bespoke Agents**: Live in existing systems, compound in value over time as they learn more workflows.

## 6. Deployment Timeline

**"If it takes a year, you've already lost."**

- **Speed**: Max 3 months to production. The field changes too fast for long roadmaps.
- **Reality Check**: Real-world usage differs from design. Ship fast to adjust to reality.
- **Talent**: Requires engineers who understand AI's actual limitations, not just "magic."
