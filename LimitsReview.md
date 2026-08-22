# LRA Limits Review

## Scope

Focused mathematical review of the real-function limit layer used upstream by continuity and differentiation. This pass checks the relative-domain semantics, uniqueness, one-sided/sequential/neighborhood equivalences, composition, and the role this API should play in repairing the differentiation chapter.

---

# Files reviewed

- `LRA/Analysis/Limits/Definition/Limits.lean`
- `LRA/Analysis/Limits/Theorems/Limits.lean`
- `LRA/Analysis/Limits/Equivalence/Theorems/Equivalence.lean`
- `LRA/Analysis/Limits/IndeterminateForms/Theorems/IndeterminateForms.lean`
- downstream comparison: differentiation derivative definitions and L'Hopital statements

---

# Relative punctured limit

The canonical predicate is

```text
TendsTo f A c L :=
  forall epsilon > 0,
    exists delta > 0,
      forall x in A,
        0 < |x-c| -> |x-c| < delta -> |f x-L| < epsilon.
```

This is a standard **relative punctured-limit** predicate.

Importantly, it does not itself require `c` to be an accumulation point of `A`. Thus at an isolated point the predicate can hold for every `L`.

That is mathematically legitimate provided uniqueness theorems add the missing accumulation hypothesis.

**Verdict: PASS — RAW RELATIVE LIMIT DESIGN IS COHERENT.**

---

# Limit uniqueness correctly requires accumulation

`TendstoUnique` explicitly assumes

```text
forall delta > 0,
  exists x in A,
    0 < |x-c| and |x-c| < delta.
```

This is exactly the hypothesis needed to prevent vacuous limits and guarantee uniqueness.

**Verdict: PASS — IMPORTANTLY CORRECT.**

This theorem supplies the architectural template that `DerivativeUnique` should follow. The differentiation chapter currently uses the analogous raw relative derivative predicate but omits the corresponding accumulation premise in its uniqueness theorem.

Recommended consistency rule:

```text
raw relative limit/derivative predicates may be vacuous at isolated points;
uniqueness and ordinary two-sided local geometry must explicitly require accumulation/interior hypotheses.
```

---

# One-sided limits

`TendsToLeft` and `TendsToRight` have the standard one-sided epsilon-delta formulations relative to `A`.

The theorem

```text
TendsTo f A c L
  iff
TendsToLeft f A c L and TendsToRight f A c L
```

is correctly shaped for the displayed real-line relative-domain definitions, including degenerate cases where one or both sides are vacuous.

**Verdict: PASS.**

---

# Sequential criterion

`ApproachesButNotEqual xs A c` correctly requires:

- every sequence term in `A`;
- no term equal to `c`;
- convergence to `c`.

`SequentialCriterionTendsto` then gives the usual real/metric-space equivalence.

**Verdict: MATHEMATICALLY CORRECT.**

## Choice-audit note

The reverse proof direction normally argues from failure of epsilon-delta convergence by choosing, for each `n`, a bad point in an appropriate shrinking neighborhood.

In a foundational ZF reading, forming such a sequence can involve countable choice unless a canonical selection mechanism is supplied. The current theorem body is `sorry`, so no concrete Lean Choice usage has yet been identified.

Classification for now:

- theorem statement: **standard and correct**;
- future proof: **audit for countable family-wise witness selection**.

Do not classify the statement itself as an AC error.

---

# Neighborhood characterization

The neighborhood theorem preserves the relative domain explicitly through

```text
deltaNbhd intersection A.
```

This is correct and useful because it shows that the limits layer does **not** silently discard the set `A`.

This matters for the differentiation audit: `FirstOrderPeanoRemainder` drops the relative domain only downstream when it replaces the relative derivative by an unrestricted punctured filter.

**Verdict: PASS.**

---

# Composition

`TendstoComp` assumes:

- `f -> c2` along `A`;
- `f(A) subset B`;
- `g -> L2` along `B` at `c2`;
- `g(c2) = L2`.

The final point-value condition is important because the punctured limit of `g` gives no information at the point `c2`, while `f x` may equal `c2` for values of `x != c1`.

Thus the composition statement correctly handles the punctured-limit subtlety rather than silently applying `g` at its excluded point.

**Verdict: PASS — GOOD DOMAIN HANDLING.**

---

# Indeterminate-form examples

The reviewed examples are standard and correctly targeted:

- `0/0` via factoring;
- infinity/infinity via dominant terms;
- `0 * infinity` via cancellation;
- infinity-minus-infinity via rationalization;
- `0^0`, `infinity^0`, and `1^infinity` via exp/log rewriting.

They are useful because they teach algebraic resolution before L'Hopital/Taylor methods.

**Verdict: PASS.**

---

# L'Hopital dependency check

The differentiation chapter's reviewed L'Hopital statements use this limit vocabulary on nondegenerate open intervals.

The zero-over-zero form has the standard hypotheses.

The infinity-over-infinity named form assumes denominator magnitude tends to infinity and derivative quotient tends to a finite `L`; it does not explicitly require the numerator to tend to infinity. This is a legitimate generalized L'Hopital form, not by itself a defect.

No additional P0 was identified in this limited L'Hopital pass.

---

# Relationship to differentiation repairs

The limits layer demonstrates that the intended project convention is already available:

1. keep relative punctured convergence as a raw predicate;
2. add accumulation hypotheses to uniqueness;
3. preserve `A` in equivalent neighborhood/sequential formulations.

Therefore the most coherent differentiation repair is probably **not** to redefine every derivative predicate globally. Instead:

- add an accumulation hypothesis to `DerivativeUnique`;
- add interior/two-sided hypotheses to extremum and derivative-sign theorems where needed;
- preserve relative-domain filters in Peano/differential equivalences;
- use one-sided derivatives deliberately at boundaries.

This minimizes disruption and aligns differentiation with the already-correct limits API.

---

# Choice audit

No actual genuine Choice use was identified in the reviewed current files because the relevant proof bodies remain `sorry`.

Potential future audit target:

- reverse sequential criterion may use countable witness choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Relative limit definition | **PASS** |
| Accumulation handling for uniqueness | **PASS — MODEL FOR DERIVATIVE FIX** |
| One-sided limits | **PASS** |
| Sequential criterion | **PASS; FUTURE COUNTABLE-CHOICE PROOF AUDIT** |
| Neighborhood characterization | **PASS** |
| Composition | **PASS — GOOD PUNCTURED-POINT HANDLING** |
| Indeterminate-form examples | **PASS** |
| Upstream cause of differentiation domain bugs | **NO — LIMITS LAYER IS MORE CAREFUL** |

---

# Recommended next dependency step

Continue into the derivative/continuity bridge and Taylor layer only after applying the limits convention consistently. For broader pre-measure-theory readiness, return afterward to topology/compactness and the repaired generated-sigma/Borel boundary.
