# LRA Sequence Review

## Scope

Maintained mathematical review of `LRA.Analysis.Sequences`, focused on the standard real-sequence material expected before measure theory.

Important status note: the reviewed files explicitly identify themselves as **draft modules not yet imported by the active Volume III root**. They are therefore reviewed as mathematical/curricular material under development rather than as the current public API.

As elsewhere, `sorry` is ignored as a defect; theorem statements are reviewed mathematically.

---

# Review 1 — Core convergence, subsequences, monotonicity, and Cauchy theory

## Files reviewed

- `LRA/Analysis/Sequences/SequenceDefinitions.lean`
- `LRA/Analysis/Sequences/Convergence.lean`
- `LRA/Analysis/Sequences/Limits.lean`
- `LRA/Analysis/Sequences/Monotonicity.lean`
- `LRA/Analysis/Sequences/Subsequences.lean`
- `LRA/Analysis/Sequences/Cauchy.lean`

## Sequence definitions

`Sequence X := Nat → X` and `RealSequence := Nat → Real` are the standard Lean encodings. No extra structure is mathematically required.

The examples "constant sequence converges", `1/n → 0`, and `n → +∞` are standard and correct.

**Verdict: PASS.**

## Epsilon-N convergence

`ConvergesTo x L` is defined by

```text
∀ ε > 0, ∃ N, ∀ n ≥ N, |x n - L| < ε.
```

This is exactly the classical epsilon-N definition for real sequences.

The neighborhood/interval version using `(L-ε,L+ε)` is equivalent and provides a good bridge to topology.

**Verdict: PASS.**

## Basic limit theorem surface

The reviewed limit theorems are all standard and correct:

- uniqueness of limits;
- eventual weak order passes to the limit;
- strict separation of distinct limits gives eventual strict order;
- eventual strict order only yields weak order of limits;
- constant comparison results;
- squeeze theorem;
- absolute-value squeeze theorem;
- every convergent real sequence is bounded.

This is an appropriate core package before topology/measure theory.

**Verdict: PASS.**

## Monotonicity definitions

The project defines increasing/decreasing sequences by adjacent inequalities:

```text
x_n ≤ x_{n+1}
```

and similarly for decreasing/strict variants.

Over `Nat` with the transitive real order this is equivalent to the usual global form `m ≤ n → x_m ≤ x_n`. The adjacent-step formulation is pedagogically natural and proof-friendly.

`IsMonotoneSeq` means increasing or decreasing; eventual variants are similarly standard.

**Verdict: CORRECT.**

### Recommended characterization theorem

For note-taking and interoperability, it would be useful to state explicitly the equivalence between the adjacent-step predicate and Mathlib's global `Monotone`/`Antitone` formulation. This avoids later ambiguity about what "monotone" means.

**Severity: P2 API/LEARNING IMPROVEMENT.**

## Monotone convergence theorem

The real-sequence statements are correct:

- increasing + bounded above ⇒ convergence to the supremum of the range;
- decreasing + bounded below ⇒ convergence to the infimum of the range;
- for a monotone real sequence, convergence iff boundedness in the relevant sense;
- eventual monotonicity plus the relevant bound still implies convergence;
- increasing unbounded sequences tend to `+∞` and decreasing unbounded sequences to `-∞`.

These are key pre-measure-theory results and are appropriately represented.

**Verdict: PASS.**

## Subsequences

The definitions are standard:

- a subsequence is selected by a strictly increasing index map `σ : Nat → Nat`;
- a subsequential limit is the limit of such a selected subsequence;
- "has a convergent subsequence" means existence of a subsequential limit.

The reviewed theorem surface is strong and correct:

- `k ≤ σ(k)` for strictly increasing index maps;
- subsequences preserve limits;
- a convergent sequence has no different subsequential limit;
- two distinct subsequential limits imply divergence;
- boundedness and monotonicity pass to subsequences;
- subsequence-of-subsequence;
- eventual properties pass to subsequences;
- a property occurring arbitrarily far out yields a subsequence satisfying it everywhere;
- subsequential limits respect global bounds;
- Monotone Subsequence Theorem and Bolzano-Weierstrass are present later in the same file.

**Verdict: PASS.**

### Choice audit

`FrequentPropertiesYieldSubsequences` has hypotheses of the form

```text
∀ N, ∃ n ≥ N, P n.
```

Although it constructs an infinite sequence of witnesses, this does not need to be classified as a genuine use of the Axiom of Choice: the witnesses are natural numbers, so one can recursively choose the least qualifying index at each stage using the well-ordering of `Nat` (with classical logic if `P` is not decidable).

**Choice classification: NO GENUINE AC REQUIRED.**

## Cauchy sequences

`IsCauchy` is the standard epsilon-tail definition:

```text
∀ ε > 0, ∃ N, ∀ m,n ≥ N, |x_m-x_n| < ε.
```

The reviewed theorem family is mathematically correct and particularly complete:

- convergent ⇒ Cauchy;
- Cauchy ⇒ bounded;
- Cauchy + convergent subsequence ⇒ full convergence;
- for real sequences, convergence iff Cauchy;
- equivalent tail-diameter formulations;
- Cauchy ⇒ successive differences tend to zero;
- scalar multiples, sums, differences, linear combinations, products, reciprocal (bounded away from zero), quotient, and absolute value preserve Cauchy-ness.

The file correctly treats vanishing successive differences as necessary but **not sufficient** for being Cauchy.

**Verdict: PASS.**

## Completeness placement

`CauchyCriterionRealSequences` is correctly specialized to `RealSequence`. This avoids the over-general uniform-space defect found in `AnalysisCompletenessReview.md`: here the equivalence is about the usual real absolute-value metric encoded directly by epsilon inequalities.

This is the right pedagogical statement:

> real sequence converges iff it is Cauchy.

It should remain clearly distinct from generic metric-space completeness.

**Verdict: PASS.**

---

# Important draft/API issue

The reviewed sequence modules state at their heads that they are drafts not imported by the active Volume III root. Thus the mathematics is substantially present, but the repository cannot yet be called "ready for note-taking from the canonical API" on the basis of these files alone.

Before promotion, there should be a deliberate consolidation pass so that:

1. the epsilon-N vocabulary is the canonical project-facing real-sequence vocabulary;
2. bridges to `Filter.Tendsto`, Mathlib `Monotone`, `CauchySeq`, etc. are explicit rather than duplicated parallel definitions;
3. the sequence modules are imported by the intended Analysis/Volume III aggregate;
4. stale source comments referring to an eventually different "real project" location are removed.

**Severity: P1 INTEGRATION/PROMOTION, not mathematical correctness.**

---

# Missing/valuable additions before measure theory

The existing coverage is already strong. A few standard additions would improve the learning surface:

1. **Subsequence principle:**
   `x_n → L` iff every subsequence has a further subsequence converging to `L`.
   This is a very useful compactness-style convergence test.

2. **Explicit adjacent/global monotonicity equivalences** with Mathlib `Monotone`/`Antitone`.

3. **Cauchy counterexample outside `R`:** a rational Cauchy sequence converging to `√2` in `R` but not in `Q`, to connect sequence completeness directly with the rational LUB gap already present in the completeness subject.

4. **Clear separation among:**
   - ordinary divergence (`not convergent`),
   - divergence to `+∞`/`-∞`,
   - oscillatory divergence.
   The divergence file will be reviewed next to determine how much of this is already present.

5. **Limsup/liminf and cluster-value relationships**, if the existing dedicated file is mathematically sound; this is useful before measure theory, especially for Fatou-style intuition later, though not strictly required for a first measure course.

---

# Choice audit

No genuine Axiom-of-Choice dependency was identified in this chunk.

---

# Final verdict for Review 1

| Dimension | Verdict |
|---|---|
| Sequence/convergence definitions | **PASS** |
| Limit theorem surface | **PASS** |
| Monotonicity and MCT | **PASS** |
| Subsequences | **PASS** |
| Real Cauchy criterion | **PASS** |
| Cauchy algebra | **PASS** |
| Choice use | **NONE IDENTIFIED** |
| Mathematical preparation for measure theory | **STRONG** |
| Canonical API readiness | **NOT YET — DRAFT/PROMOTION WORK REMAINS** |

---

# Next review chunk

Review:

- `Divergence.lean`;
- `ClusterValues.lean`;
- `LiminfLimsup.lean`;
- `ExamplesCounterexamples.lean`.

The focus will be on distinctions among divergence modes, correctness of liminf/limsup definitions and inequalities, and whether the standard cluster-value/limsup/liminf relationships needed before measure theory are present.