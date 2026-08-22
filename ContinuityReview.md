# LRA Continuity Review

## Scope

Maintained mathematical review of `LRA.Analysis.Continuity`, especially the real-line continuity theory that should bridge metric/topological foundations to compactness, approximation, and later measurability.

Project-wide rules apply: `sorry` is neutral scaffolding. However, a concrete placeholder **definition** such as `def X := 0` is not treated like a proof hole when later theorem statements depend on its intended mathematics.

---

# Files reviewed

- `LRA/Analysis/Continuity.lean`
- `LRA/Analysis/Continuity/PointContinuity.lean`
- `LRA/Analysis/Continuity/GlobalTheorems.lean`
- `LRA/Analysis/Continuity/UniformContinuity.lean`
- `LRA/Analysis/Continuity/MonotoneFunctions.lean`
- `LRA/Analysis/Continuity/Gauge.lean`
- `LRA/Analysis/Continuity/Approximation.lean`
- `LRA/Analysis.lean`

---

# Aggregate status — these modules are currently active

Several source headers still say:

> Draft module; not yet imported by the active Volume III root.

But current `LRA.Analysis.lean` imports `LRA.Analysis.Continuity`, and that aggregate imports all six reviewed continuity modules.

Therefore these files are part of the active repository-wide analysis import surface even if a narrower historical Volume III root once omitted them.

**Severity: P2 STALE STATUS DOCUMENTATION.**

More importantly, false semantic stubs inside these modules should not be discounted as quarantined drafts.

---

# Point continuity — core definitions

`ContinuousAtPoint f A c` is the standard relative epsilon-delta definition:

```text
for every epsilon > 0 there exists delta > 0 such that
x in A and |x-c| < delta imply |f(x)-f(c)| < epsilon.
```

The neighborhood reformulation is correct.

The sequential characterization is also correct for subsets of `Real`; the theorem appropriately assumes `c ∈ A` in the continuity equivalence.

`PointOfDiscontinuity`, `SequentialDiscontinuity`, and the explicit negated-neighborhood formulation are mathematically appropriate.

**Verdict for the basic continuity layer: PASS.**

### Choice note on sequential discontinuity

The implication from failure of epsilon-delta continuity to existence of a witness sequence generally chooses one violating point for each `1/(n+1)` neighborhood. In ordinary classical analysis this is routine; foundationally it is a countable selection argument unless a canonical choice is supplied.

If the Lean proof later uses a family-wise `Classical.choose`, classify that proof dependency explicitly. This is not a defect in the theorem statement.

---

# P0 — oscillation definitions are semantic zero stubs

Current definitions:

```text
OscillationOnSet ... := 0
OscillationAtPoint ... := 0
```

are followed by substantive theorems including

```text
ContinuousAtPoint f A c ↔ OscillationAtPoint f A c = 0
```

and a decomposition of the discontinuity set by positive oscillation bounds.

Because `OscillationAtPoint` is definitionally zero for every function and point, the right side of the continuity equivalence is always true. Any ordinary discontinuous function gives a counterexample.

Likewise the discontinuity-set decomposition collapses to an empty/right-side behavior inconsistent with genuine discontinuities.

This is not analogous to a `sorry` proof body: the **mathematical object itself is currently defined incorrectly**.

## Required correction

Define oscillation genuinely, preferably using one of:

1. diameter/supremum of pairwise function-value differences on relative neighborhoods, with domain conditions handled honestly;
2. infimum over positive radii of neighborhood oscillations;
3. Mathlib's existing oscillation-related topology machinery if it matches the intended curriculum.

Given earlier review findings about real-valued `sSup`/`sInf` totalization, use boundedness hypotheses or an extended-value codomain where appropriate rather than silently totalizing unbounded oscillation.

**Severity: P0 FALSE SEMANTIC STUB.**

---

# P0 — discontinuity taxonomy is internally inconsistent

`IsRemovableDiscontinuity` says the left and right limits both exist and equal a common `L`, while `f c ≠ L`.

But `IsJumpDiscontinuity` allows

```text
L1 ≠ L2 OR f c ≠ L1.
```

Therefore the case

```text
L1 = L2 = L
f c ≠ L
```

is simultaneously classified as removable **and** jump.

The subsequent definition

```text
IsEssentialDiscontinuity := PointOfDiscontinuity ∧ ¬ IsRemovableDiscontinuity
```

is followed by

```text
JumpSubsetEssential : IsJumpDiscontinuity -> IsEssentialDiscontinuity.
```

That theorem is false. A standard removable discontinuity on `Real` satisfies the current jump definition but fails `IsEssentialDiscontinuity`.

## Recommended taxonomy

Use mutually intelligible standard cases, e.g.:

- removable: both finite one-sided limits exist and agree, but the function value is absent/different;
- jump: both finite one-sided limits exist and **differ**;
- essential/second-kind: at least one required one-sided finite limit fails to exist (depending on the chosen textbook taxonomy).

If the source text uses a nonstandard taxonomy, record it as such, but do not simultaneously assert set-inclusion theorems contradicted by the literal definitions.

**Severity: P0 FALSE THEOREM / DEFINITION MISMATCH.**

### Endpoint and arbitrary-subset caveat

The one-sided-limit predicates can become vacuous at endpoints or isolated points of an arbitrary set `A`. If the intended classification is for interior points of intervals, say so explicitly or add the corresponding accumulation-side hypotheses.

Otherwise an isolated point may satisfy one-sided limit clauses vacuously in ways that do not match the intended discontinuity taxonomy.

**Severity: P1/P2 DOMAIN-OF-DEFINITION CLARIFICATION.**

---

# Global continuity theorems

The following reviewed statements are standard and correctly shaped for continuous real functions on closed intervals/intervals:

- boundedness theorem;
- extreme value theorem;
- root-location theorem;
- Bolzano intermediate value theorem;
- continuous images of intervals are intervals/order-connected;
- continuous implies Darboux/intermediate-value property;
- Heine-Cantor on `[a,b]`;
- image of a closed bounded interval is a closed bounded interval `[m,M]`.

The assumptions `a ≤ b` or `a < b` are appropriate where used.

**Verdict: PASS.**

The concrete real-line layer therefore already contains much of the mathematical continuity curriculum needed before measure theory; the main architectural gap is connection to generic topology/metric continuity.

---

# Uniform continuity

`IsUniformlyContinuous`, `IsLipschitzOn`, and `IsBiLipschitzOn` are standard real-line relative-set definitions.

The reviewed theorem statements are correct:

- sums of uniformly continuous functions are uniformly continuous;
- products are uniformly continuous when both functions are bounded on the set;
- composition preserves uniform continuity with the range-in-domain hypothesis;
- sequential characterization by pairs of asymptotically close sequences;
- uniformly continuous maps send Cauchy sequences to Cauchy sequences;
- Lipschitz implies uniformly continuous;
- a bi-Lipschitz inverse is Lipschitz on the image;
- `sqrt` on `[0,1]` is uniformly continuous but not Lipschitz.

**Verdict: PASS.**

This material should eventually bridge to generic metric/uniform-space definitions rather than remain a separate semantic owner.

---

# P0 — monotone-function `JumpOf` is a zero stub

Current:

```text
JumpOf f I c := 0
```

followed by

```text
MonotoneDiscontinuitiesAreJumps ... : JumpOf f I c > 0.
```

Whenever the hypotheses admit a monotone discontinuity, the conclusion becomes `0 > 0`, false.

The subsequent jump-interval and countability development is therefore not mathematically meaningful until `JumpOf` is genuinely defined.

**Severity: P0 FALSE SEMANTIC STUB.**

A proper definition should use the right-hand minus left-hand limiting values for monotone functions, with endpoint/interior hypotheses made explicit.

---

# P0 — function `LimsupAt` / `LiminfAt` are zero stubs

Current:

```text
LimsupAt ... := 0
LiminfAt ... := 0
```

followed by

```text
Tendsto f at c to L
  ↔ LimsupAt f A c = L ∧ LiminfAt f A c = L.
```

For any function tending to a nonzero limit `L`, the right-hand side becomes `0 = L ∧ 0 = L`, false.

This is another direct semantic contradiction.

## Recommended correction

As with sequence limsup/liminf, decide the intended domain carefully:

- if local function values are bounded near `c`, real-valued sup/inf constructions can be used with explicit hypotheses;
- for a general real function, extended-real local limsup/liminf is the more robust analysis/measure-theory-facing formulation.

**Severity: P0 FALSE SEMANTIC STUB.**

---

# Gauge/tagged-partition material

The core structures are mathematically sensible:

- finite interval partition by strictly increasing breakpoints;
- a tag in each cell;
- positive gauge;
- delta-fine tagged partition;
- refinement/common refinement;
- Cousin's theorem statement.

`MeshOf` is currently defined as `0`, so it is another incomplete semantic definition, although no reviewed theorem in this file currently derives a false nontrivial mesh property from it.

**Severity: P1 SEMANTIC STUB; escalates to P0 if downstream theorems use it as genuine mesh.**

A correct mesh is the maximum cell width, with the degenerate `a=b` / `n=0` convention stated explicitly.

---

# Approximation theory

The reviewed statements are mathematically standard:

- continuous functions on `[a,b]` admit uniform step-function approximation;
- piecewise-linear uniform approximation;
- Weierstrass polynomial approximation;
- Bernstein polynomial construction and approximation on `[0,1]`.

The step-function definition deliberately leaves partition-point values unconstrained. That is a common convention and does not invalidate the existence theorem, since approximating values at those finitely many points can be chosen appropriately.

For `BernsteinPolynomial f 0`, Lean's totalized real division makes the displayed formula syntactically defined. The eventual approximation theorem can choose a positive large `N`, so no mathematical problem follows merely from the `n=0` term.

**Verdict: PASS for the statement surface.**

---

# Architectural recommendation — consolidate continuity ownership

The repository currently has:

1. concrete real epsilon-delta continuity here;
2. a generic metric-space continuity placeholder;
3. a generic topology layer without a continuity subject;
4. Mathlib's standard `Continuous`, `ContinuousAt`, `ContinuousOn`, `UniformContinuous`, etc.

A clean dependency chain should be:

```text
topological continuity
      ↑ agrees with
metric epsilon-delta continuity
      ↑ specializes to
real epsilon-delta continuity
```

and independently

```text
uniform-space / metric uniform continuity
      -> real epsilon-delta uniform continuity.
```

The existing real-line theorems can remain pedagogical specializations, but the canonical semantic owner should eventually be generic topology/metric continuity with explicit equivalence theorems.

This is particularly important for the theorem

```text
continuous -> Borel measurable,
```

which should consume the topology-owned notion.

**Severity: P1 API/OWNERSHIP CONSOLIDATION.**

---

# Choice audit

No explicit genuine family-wise AC use was identified from the reviewed theorem statements.

Potential proof-level choice point to audit when proofs are filled:

- constructing a violating sequence from pointwise failure of epsilon-delta continuity selects one witness for each scale. In classical set theory this is a countable choice-style step unless the witnesses are canonically selected.

Do not infer AC merely from the theorem statement; inspect the eventual proof.

---

# Final verdict

| Dimension | Verdict |
|---|---|
| Basic real point continuity | **PASS** |
| Sequential/neighborhood formulations | **PASS** |
| EVT/IVT/Heine-Cantor | **PASS** |
| Uniform continuity/Lipschitz layer | **PASS** |
| Approximation theorem statements | **PASS** |
| Oscillation definitions | **P0 ZERO STUBS** |
| Discontinuity taxonomy | **P0 INCONSISTENT / FALSE `JumpSubsetEssential`** |
| Monotone `JumpOf` | **P0 ZERO STUB** |
| Function limsup/liminf | **P0 ZERO STUBS** |
| Gauge `MeshOf` | **P1 ZERO STUB** |
| Generic topology/metric continuity bridge | **P1 MISSING** |
| Active/draft status comments | **STALE** |

---

# Priority fixes

1. replace `OscillationOnSet` / `OscillationAtPoint` zero stubs;
2. correct the removable/jump/essential taxonomy and remove the false inclusion theorem as currently stated;
3. replace `JumpOf` zero stub;
4. replace `LimsupAt` / `LiminfAt` zero stubs, preferably with honest extended-value/domain semantics;
5. replace `MeshOf` zero stub before integration uses it;
6. bridge real continuity to generic metric/topological continuity;
7. update stale draft/import-status comments.
