# LRA Real Analysis Toolkit Review

## Scope

Maintained review of the active `LRA.Analysis.RealAnalysis` toolkit modules. This pass samples the core absolute-value, asymptotic-notation, inequality, and error-propagation material and records architectural overlap relevant to later differentiation and functional analysis.

Project-wide rules apply: `sorry` is neutral scaffolding; concrete semantic placeholder definitions are not neutral; duplicate ownership is distinguished from mathematical error.

---

# Files reviewed

- `LRA/Analysis/RealAnalysis.lean`
- `LRA/Analysis/RealAnalysis/Modulus.lean`
- `LRA/Analysis/RealAnalysis/AsymptoticNotation.lean`
- `LRA/Analysis/RealAnalysis/AsymptoticAndInequalityAdditions.lean`
- `LRA/Analysis/RealAnalysis/ErrorPropagation.lean`

---

# Active status

`LRA.Analysis.lean` imports `LRA.Analysis.RealAnalysis`, so this toolkit is part of the repository-wide analysis aggregate.

Several individual file headers still describe themselves as not imported by the active Volume III root. Those comments are stale relative to the current import graph and should be updated.

---

# Absolute value / modulus

`AbsR a := if a >= 0 then a else -a` is the standard absolute value on `Real`.

The reviewed theorem surface is correct:

- nonnegativity;
- zero iff zero;
- value is `a` or `-a`;
- symmetry;
- multiplicativity;
- quotient law for nonzero denominator;
- `-abs a <= a <= abs a`;
- interval characterizations of `abs a <= r` and `abs a < r`;
- reverse triangle inequality;
- finite-sum triangle inequality.

**Verdict: PASS.**

This duplicates Mathlib's mature `abs` API intentionally for textbook parity. A bridge theorem `AbsR a = |a|` would make later reuse much easier and avoid parallel proof development.

---

# Little-o and big-O

`IsLittleOAt`, `IsLittleOAtTop`, and increment little-o have the expected epsilon definitions. The quotient characterization includes eventual nonvanishing of the denominator, which is the right hypothesis for rewriting little-o as a quotient tending to zero.

The sum and bounded-factor rules are correctly stated.

`IsBigOAt` and `IsBigOAtTop` use a fixed positive constant, and the little-o => big-O implications are correct.

**Verdict: PASS.**

Recommended future bridge: connect these definitions to Mathlib's filter-based asymptotic relations (`IsLittleO`, `IsBigO`) so the textbook predicates and proof-facing API do not drift.

---

# Young and Jensen

The finite Young inequality is stated with nonnegative inputs and conjugate exponents `p,q > 1`, `1/p + 1/q = 1`; this is mathematically correct.

`IsConvexOnR` gives the ordinary two-point convexity inequality on all of `Real`, and the finite Jensen theorem correctly assumes nonnegative weights summing to one and a nonempty finite index set.

**Verdict: PASS.**

## P2/P1 convexity ownership

Convexity now appears in multiple places:

- `LRA.Analysis.RealAnalysis.IsConvexOnR`;
- `LRA.Analysis.Differentiation.IsConvexOn` for a displayed interval;
- Mathlib `ConvexOn` / convex-set machinery.

These are compatible viewpoints, but explicit equivalence/specialization theorems should connect them. In particular, the differentiation chapter should not have to reproach basic Jensen/convexity semantics independently.

**Severity: P2/P1 API CONSOLIDATION.**

---

# Error propagation

`AbsoluteError x xTilde = |x-xTilde|` is standard.

The chosen `RelativeError` convention divides by `|xTilde|`. This is a legitimate convention when `xTilde` is treated as the reference/nominal value; documentation should keep that convention explicit because many numerical-analysis texts divide by the true value instead.

The reviewed error bounds are mathematically coherent:

- sum absolute error;
- product absolute error including the second-order product of errors;
- quotient absolute error under nonzero denominators and denominator relative error `< 1`;
- product relative error;
- quotient relative error under the same stability condition.

The quotient condition `RelativeError y yTilde < 1` is exactly the kind of assumption needed to keep the perturbed denominator away from zero.

**Verdict: PASS.**

---

# No semantic zero-stub problem found in this sampled toolkit

Unlike the continuity, integration, and function-supremum chapters, the reviewed RealAnalysis files use genuine definitions rather than placeholder constants such as `:= 0` for their central objects.

This makes the subject comparatively proof-ready at the statement/definition level.

---

# Architecture and learning placement

This toolkit is useful early analysis infrastructure:

```text
absolute value / inequalities
        -> bounding techniques
        -> asymptotic notation
        -> approximation/error control
        -> limits, continuity, differentiation
```

It should remain a toolkit layer rather than become a second owner of structures already canonical elsewhere.

Recommended bridges:

1. `AbsR = abs`;
2. project little-o/big-O <-> Mathlib filter asymptotics;
3. `IsConvexOnR` <-> Mathlib/global convexity and differentiation's interval `IsConvexOn`;
4. named links from inequality results into normed/functional-analysis modules when those are introduced.

---

# Choice audit

No genuine Axiom-of-Choice dependency was identified in the reviewed RealAnalysis definitions/statements.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Absolute-value toolkit | **PASS** |
| Little-o/big-O | **PASS** |
| Young/Jensen | **PASS** |
| Error propagation | **PASS** |
| Semantic placeholder risk | **NONE FOUND IN SAMPLED FILES** |
| Convexity semantic ownership | **P2/P1 CONSOLIDATION** |
| Mathlib interop | **WORTH ADDING** |
| Choice usage | **NO GENUINE AC IDENTIFIED** |

---

# Immediate recommendations

1. add bridge theorems to Mathlib `abs` and asymptotic APIs;
2. consolidate the multiple convexity predicates through explicit equivalence/specialization lemmas;
3. update stale file headers describing active modules as unimported drafts;
4. keep this subject as a proof-technique/toolkit layer and avoid making it the owner of topology/function structures already canonical elsewhere.
