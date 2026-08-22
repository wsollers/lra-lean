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

**Verdict: PASS.**

## Monotonicity definitions

The project defines increasing/decreasing sequences by adjacent inequalities `x_n ≤ x_{n+1}` and the corresponding variants.

Over `Nat` with transitivity of the real order this is equivalent to the global formulation `m ≤ n → x_m ≤ x_n`.

**Verdict: CORRECT.**

### Recommended characterization theorem

Expose explicitly the equivalence between the adjacent-step predicate and Mathlib's global `Monotone`/`Antitone` formulation.

**Severity: P2 API/LEARNING IMPROVEMENT.**

## Monotone convergence theorem

The real-sequence statements are correct:

- increasing + bounded above ⇒ convergence to the supremum of the range;
- decreasing + bounded below ⇒ convergence to the infimum of the range;
- for a monotone real sequence, convergence iff boundedness in the relevant sense;
- eventual monotonicity plus the relevant bound still implies convergence;
- increasing unbounded sequences tend to `+∞` and decreasing unbounded sequences to `-∞`.

**Verdict: PASS.**

## Subsequences

The definitions and the reviewed theorem surface are standard and correct: increasing index maps, preservation of limits, uniqueness of subsequential limits for convergent sequences, two distinct subsequential limits forcing divergence, preservation of bounds/monotonicity, subsequence-of-subsequence, eventual/frequent properties, Monotone Subsequence Theorem, and Bolzano-Weierstrass.

**Verdict: PASS.**

### Choice audit

`FrequentPropertiesYieldSubsequences` does not require classification as genuine AC. Witnesses are natural-number indices and can be chosen recursively as least qualifying indices using the well-order of `Nat`.

**Choice classification: NO GENUINE AC REQUIRED.**

## Cauchy sequences

`IsCauchy` is the standard epsilon-tail definition. The theorem family is strong and correct:

- convergent ⇒ Cauchy;
- Cauchy ⇒ bounded;
- Cauchy + convergent subsequence ⇒ convergent;
- real convergence iff Cauchy;
- equivalent tail formulations;
- Cauchy ⇒ successive differences vanish;
- scalar/sum/difference/linear-combination/product/reciprocal/quotient/absolute-value closure.

The file correctly emphasizes that vanishing successive differences are not sufficient for Cauchy-ness.

**Verdict: PASS.**

## Completeness placement

`CauchyCriterionRealSequences` is correctly specialized to real sequences and therefore avoids the arbitrary-uniformity defect recorded in `AnalysisCompletenessReview.md`.

**Verdict: PASS.**

---

# Important draft/API issue

These sequence modules are drafts and are not imported by the active Volume III root. The mathematics is substantially present, but a promotion/consolidation pass is still required before this is the canonical proof/note-taking API.

Before promotion:

1. make the epsilon-N vocabulary canonical for real sequences;
2. add explicit bridges to `Filter.Tendsto`, Mathlib `Monotone`, `CauchySeq`, etc.;
3. import the final modules from the intended Analysis/Volume III aggregate;
4. remove stale comments referring to an eventual different "real project" location.

**Severity: P1 INTEGRATION/PROMOTION.**

---

# Review 2 — Divergence, cluster values, limsup/liminf, examples

## Files reviewed

- `LRA/Analysis/Sequences/Divergence.lean`
- `LRA/Analysis/Sequences/ClusterValues.lean`
- `LRA/Analysis/Sequences/LiminfLimsup.lean`
- `LRA/Analysis/Sequences/ExamplesCounterexamples.lean`

## Divergence vocabulary

The distinctions are well represented:

- `IsDivergent x := ¬ ∃ L, ConvergesTo x L`;
- divergence to `+∞`;
- divergence to `-∞`;
- oscillatory divergence = divergent but neither one-directional escape.

This is a useful three-way distinction for analysis students. The theorem surface is also correct:

- divergence to either infinity implies ordinary real divergence;
- two distinct subsequential limits imply divergence;
- unbounded above/below sequences admit subsequences tending to `+∞`/`-∞`;
- a bounded divergent real sequence has two distinct subsequential limits.

**Verdict: PASS.**

## Cluster values

The epsilon/frequent-neighborhood definition

```text
∀ ε > 0, ∀ N, ∃ n ≥ N, |x_n-L| < ε
```

is a standard sequence cluster-point definition.

The theorem equating it with existence of a subsequence converging to `L` is correct for real sequences.

Bounded sequences having a cluster value and limsup/liminf being extremal cluster values are also standard consequences of Bolzano-Weierstrass.

**Verdict: PASS.**

### Naming issue in source notes

The Lean draft deliberately uses distinct names `IsClusterValueOf` and `IsSubsequentialLimit`, but the source-note predicate readings apparently use the same name for both notions, turning the equivalence statement into a tautological-looking predicate reading. The Lean naming is better and should become the canonical terminology.

**Severity: P2 NOTE-AUTHORING CLEANUP.**

---

# P0/P1 — limsup/liminf definitions are unsafe outside bounded sequences

Current definitions are total:

```lean
TailSupSeq x n := sSup (x '' {k | n ≤ k})
TailInfSeq x n := sInf (x '' {k | n ≤ k})
LimsupSeq x L := ConvergesTo (TailSupSeq x) L
LiminfSeq x L := ConvergesTo (TailInfSeq x) L
```

No boundedness hypothesis is part of these definitions.

Mathematically, a real-valued tail supremum exists only when the tail is bounded above, and a real-valued tail infimum only when bounded below. Lean's `sSup`/`sInf` operations are syntactically total, but their meaningful supremum/infimum laws require the relevant boundedness/nonemptiness hypotheses. An arbitrary value returned outside those hypotheses is not a mathematical real supremum.

Thus for an unbounded real sequence, `TailSupSeq` can carry implementation/default behavior rather than the intended mathematical `sup` of the tail. `LimsupSeq` could therefore become an accidental proposition about those totalized values instead of the standard limsup.

## Recommended correction

Choose one of two mathematically clean designs:

### Option A — bounded real sequences

Make boundedness part of the relation:

```text
LimsupSeq x L := BoundedSeq x ∧ ...
LiminfSeq x L := BoundedSeq x ∧ ...
```

or parameterize tail-sup/tail-inf constructions by explicit proof that the relevant bounds exist.

This is sufficient for the current theorem family, whose important results already assume `BoundedSeq`.

### Option B — extended real limsup/liminf

Use `EReal`/extended reals for limsup and liminf. This gives the most general standard theory and handles `+∞` and `-∞` correctly for unbounded sequences.

For preparation for measure theory, Option B has a significant advantage: extended-real liminf/limsup is the natural language of Fatou's lemma and measurable nonnegative functions.

**Severity: P0 if these definitions are promoted as the general real-sequence limsup/liminf API; P1 while still quarantined as draft material.**

## Bounded-sequence limsup/liminf theorem surface

Under the explicit `BoundedSeq` hypotheses used by the main theorems, the mathematical statements are correct:

- tail suprema decrease;
- tail infima increase;
- `liminf ≤ limsup`;
- convergence to `L` iff both liminf and limsup equal `L`;
- limsup is the largest subsequential limit and liminf the smallest;
- a strict liminf/limsup gap is equivalent to at least two distinct subsequential limits;
- eventual order compares limsup and liminf;
- corresponding squeeze results.

**Verdict: PASS ON THE BOUNDED DOMAIN.**

### Useful missing identities

Before measure theory, it would be useful to add at least:

- `limsup(-x_n) = -liminf(x_n)` and the dual identity;
- positive-scalar homogeneity;
- for bounded sequences, standard subadditivity/superadditivity inequalities where appropriate.

The sign-flip identity is particularly valuable because it systematically dualizes limsup and liminf arguments.

**Severity: P2 ADDITION.**

---

# Examples and counterexamples

The example file is generally very good and includes the right basic witnesses:

- constant sequence;
- reciprocal null sequence;
- convergent non-monotone alternating sequence;
- bounded divergent `(-1)^n` with two subsequential limits;
- geometric sequences in the main regimes;
- bounded does not imply convergent;
- harmonic partial sums: successive differences tend to zero while the sequence is unbounded/non-Cauchy.

These examples directly support the failure modes students should know.

**Verdict: STRONG.**

### Minor statement-quality issue: geometric case `r = 1`

The `r=1` clause in `ExampleGeometricSequence` is written as

```lean
ConvergesTo (fun _ : ℕ => (1 : ℝ) ^ (0 : ℕ)) 1
```

which is the constant sequence `1`, so the theorem is true. But it does not literally display the geometric sequence `n ↦ 1^n` that the surrounding theorem is meant to classify.

Prefer:

```text
ConvergesTo (fun n : Nat => (1 : Real)^n) 1.
```

The two sequences are extensionally equal, so this is not a mathematical error, only a statement/expository mismatch.

**Severity: P3 MINOR CLEANUP.**

---

# Updated pre-measure-theory assessment

The sequence curriculum is already very strong. It contains essentially all of the standard real-sequence material one would want before measure theory:

- epsilon-N convergence;
- uniqueness/boundedness/order/squeeze;
- monotone convergence;
- subsequences and Bolzano-Weierstrass;
- Cauchy criterion for `R`;
- divergence modes;
- cluster values;
- limsup/liminf;
- high-quality counterexamples.

The most important mathematical improvement is to make limsup/liminf safe for unbounded sequences—preferably with extended reals if the destination is measure theory.

---

# Missing/valuable additions before measure theory

1. **Subsequence principle:** `x_n → L` iff every subsequence has a further subsequence converging to `L`.
2. **Adjacent/global monotonicity equivalences** with Mathlib `Monotone`/`Antitone`.
3. **A rational Cauchy incompleteness example** approximating `√2`.
4. **Extended-real limsup/liminf**, or explicit bounded-domain restrictions.
5. **Limsup/liminf sign-flip duality**, with basic algebraic inequalities if desired.

---

# Choice audit

No genuine Axiom-of-Choice dependency was identified in the reviewed sequence statements.

---

# Final verdict through Review 2

| Dimension | Verdict |
|---|---|
| Core convergence | **PASS** |
| Monotone convergence | **PASS** |
| Subsequences/Bolzano-Weierstrass | **PASS** |
| Cauchy real sequences | **PASS** |
| Divergence taxonomy | **PASS** |
| Cluster values | **PASS** |
| Limsup/liminf bounded theory | **PASS** |
| General limsup/liminf definitions | **NEEDS DOMAIN/EXTENDED-REAL FIX** |
| Examples/counterexamples | **STRONG** |
| Mathematical preparation for measure theory | **VERY STRONG** |
| Canonical API readiness | **NOT YET — DRAFT/PROMOTION WORK REMAINS** |

---

# Next review chunk

Move to the topology/metric-space boundary that sequence theory will depend on before measure theory. First review only:

- metric/distance definitions;
- open balls and neighborhoods;
- topology/open/closed definitions;
- bridges from metric to topology;
- completeness terminology.

The primary goal will be to ensure the project clearly distinguishes order completeness, metric completeness, compactness, and sequential compactness.