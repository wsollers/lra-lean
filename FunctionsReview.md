# LRA Real-Valued Functions Review

## Scope

Maintained mathematical review of `LRA.Analysis.Functions`, focusing on the function-theoretic material consumed by continuity, differentiation, and integration: boundedness, extrema, pointwise order, and supremum/infimum constructions.

Project-wide rule: `sorry` proof bodies are neutral. Concrete placeholder definitions are not neutral when theorem statements depend on their intended semantics.

---

# Files reviewed

- `LRA/Analysis.lean`
- `LRA/Analysis/Functions.lean`
- `LRA/Analysis/Functions/BoundedFunctions.lean`
- `LRA/Analysis/Functions/ExtremumPoints.lean`
- `LRA/Analysis/Functions/PointwiseOrder.lean`
- `LRA/Analysis/Functions/SupInfOfFunctions.lean`

---

# Active status

`LRA.Analysis.lean` imports `LRA.Analysis.Functions`, and the functions aggregate imports the reviewed modules including `SupInfOfFunctions.lean`.

Therefore semantic stubs in this subject are part of the active repository-wide analysis surface.

---

# Bounded functions

The following definitions are standard and correctly stated:

- bounded above on a set;
- bounded below on a set;
- bounded in absolute value;
- bounded near a point on a punctured relative neighborhood;
- bounded away from zero;
- bounded away from zero near a point;
- uniformly bounded family.

The reviewed consequences are also correct:

- bounded iff absolute value is bounded above;
- restriction preserves boundedness;
- extension need not preserve boundedness;
- bounded away from zero implies nonzero;
- bounded away from zero gives bounded reciprocal;
- uniformly bounded pointwise-convergent families have bounded pointwise limit;
- bounded functions are closed under the standard finite algebraic operations.

**Verdict: PASS.**

The file header itself records a duplicated theorem/corollary and duplicated failure-mode prose in the source notes. These are organizational redundancies, not mathematical defects.

---

# Pointwise order

`PointwiseEq`, `PointwiseLe`, and `PointwiseLt` have the expected semantics.

The pointwise order laws and arithmetic laws are correctly stated, including:

- reflexivity/transitivity and antisymmetry up to pointwise equality on the displayed set;
- strict implies weak order;
- translation invariance;
- negation reverses order;
- signed scalar multiplication behaves with the expected sign dependence;
- addition preserves order;
- product order under nonnegativity hypotheses;
- reciprocal order reversal under positivity;
- quotient order under appropriate sign controls.

The explicit failure theorem that no unconditional quotient-order law exists is mathematically valuable.

**Verdict: PASS.**

---

# Extremum points

`FunctionMaximumPoint` and `FunctionMinimumPoint` correctly require membership in the displayed domain plus the corresponding global comparison on that domain.

The characterizations by `IsLUB (f '' A) (f x0)` and `IsGLB (f '' A) (f x0)` are correct under the supplied nonempty/bounded hypotheses.

The theorem that two maximum points have the same attained maximum value is correct; the points themselves need not be equal.

The common-maximizer/common-minimizer theorems and the failure of their converses are also correct.

**Verdict: PASS.**

---

# P0 — supremum/infimum semantic zero stubs

`SupInfOfFunctions.lean` currently defines all four central objects as literal zero:

```text
FunctionSupremumOnSet f A := 0
FunctionInfimumOnSet f A := 0
PointwiseSupremumFamily f x := 0
PointwiseInfimumFamily f x := 0
```

The file header says these are intended to be `sSup`/`sInf` constructions, but the actual current definitions do not implement those semantics.

This is not a harmless proof placeholder. Substantive theorem statements depend on these definitions.

## Immediate counterexample: pointwise supremum evaluation

For a one-element finite index type and a family with

```text
f alpha x = 1,
```

`PointwiseSupremumFamily f x` is definitionally `0`.

But `PointwiseSupremumEvaluation` asserts that there exists an index `alpha` with

```text
PointwiseSupremumFamily f x = f alpha x.
```

This becomes `0 = 1`, false.

The analogous pointwise-infimum theorem fails for the same reason.

## Function supremum/infimum laws are likewise semantically corrupted

Any theorem identifying or algebraically transforming the supremum/infimum values is unreliable while both functions are fixed to zero.

For example, the intended identity

```text
sup(-f) = -inf(f)
```

is not being proved about mathematical suprema at all under the current definitions.

**Severity: P0 ACTIVE SEMANTIC STUB CLUSTER.**

---

# Correct repair and domain semantics

The intended definitions should be approximately

```text
FunctionSupremumOnSet f A = sSup (f '' A)
FunctionInfimumOnSet f A = sInf (f '' A)
```

with the important caveat already identified elsewhere in the audit:
real-valued `sSup`/`sInf` are totalized outside the mathematically proper bounded/nonempty domain.

Therefore choose one of two public designs:

1. retain raw total definitions but make every mathematically meaningful theorem carry explicit nonempty/bounded hypotheses; or
2. package finite real supremum/infimum with hypotheses, and use an extended-real codomain for genuinely total constructions.

For this real-valued function chapter, option 1 is reasonable because most existing theorem statements already carry the relevant hypotheses.

For pointwise supremum/infimum of arbitrary families, the same domain question matters even more. Finite inhabited families are safe in `Real`; arbitrary families require boundedness hypotheses or an extended codomain.

---

# Architecture recommendation

There are now several parallel real `sSup`/`sInf`-style constructions in the repository:

- function supremum/infimum;
- sequence limsup/liminf;
- metric diameter;
- point-to-set distance via `sInf`;
- Darboux upper/lower values eventually.

The repeated defects suggest a common policy should be written once:

> **Real-valued extrema are only mathematically meaningful under their nonempty/bounded domain hypotheses; total Lean definitions must not be mistaken for total mathematical notions.**

Where infinity is a natural value (diameter, limsup/liminf, measure-theory asymptotics), prefer extended reals.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified in this chunk.

Finite maximum/minimum evaluation over a finite inhabited index type does not require AC.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Bounded-function definitions | **PASS** |
| Bounded-function algebra | **PASS** |
| Pointwise order | **PASS** |
| Quotient/order failure mode | **PASS — USEFUL** |
| Extremum point definitions | **PASS** |
| Extremum/LUB-GLB characterization | **PASS** |
| Function supremum/infimum definitions | **P0 ZERO STUBS** |
| Pointwise family sup/inf definitions | **P0 ZERO STUBS** |
| Totalized `sSup`/`sInf` domain policy | **NEEDS CONSISTENT PROJECT-WIDE RULE** |
| Choice usage | **NO NEW GENUINE AC IDENTIFIED** |

---

# Immediate priority fixes

1. replace the four zero extrema stubs with genuine supremum/infimum constructions;
2. preserve explicit nonempty/bounded hypotheses on real-valued extrema theorems;
3. audit every theorem in `SupInfOfFunctions.lean` after the definitions are repaired;
4. establish a project-wide policy for totalized real `sSup`/`sInf` constructions;
5. only after that use these extrema objects in continuity, integration, or functional-analysis developments.
