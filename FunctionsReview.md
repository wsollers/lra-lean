# LRA Real-Valued Functions Review

## Scope

Maintained mathematical review of `LRA.Analysis.Functions`, focusing on the function-theoretic material consumed by continuity, differentiation, integration, and the concrete real-line topology bridge: boundedness, extrema, pointwise order, supremum/infimum constructions, and `SubsetsOfR`.

Project-wide rule: `sorry` proof bodies are neutral. Concrete placeholder definitions are not neutral when theorem statements depend on their intended semantics.

---

# Files reviewed

- `LRA/Analysis.lean`
- `LRA/Analysis/Functions.lean`
- `LRA/Analysis/Functions/BoundedFunctions.lean`
- `LRA/Analysis/Functions/ExtremumPoints.lean`
- `LRA/Analysis/Functions/PointwiseOrder.lean`
- `LRA/Analysis/Functions/SubsetsOfR.lean`
- `LRA/Analysis/Functions/SupInfOfFunctions.lean`

---

# Active status

`LRA.Analysis.lean` imports `LRA.Analysis.Functions`, and the functions aggregate imports the reviewed modules including `SupInfOfFunctions.lean` and `SubsetsOfR.lean`.

Therefore semantic stubs and false statements in this subject are part of the active repository-wide analysis surface.

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

# Concrete real-line point-set topology in `SubsetsOfR`

The file contains a substantial and mostly correct concrete topology toolkit for `Real`:

- centered and punctured neighborhoods;
- cluster/adherent/isolated/interior/boundary points;
- interior, closure, and boundary sets;
- closed and open sets;
- closure identities;
- sequential characterization of closed sets;
- bounded subsets of `Real`;
- sequential Heine-Borel;
- finite sets are closed;
- eventual/near-point predicates.

The closure, boundary, sequential closedness, boundedness, and Heine-Borel statements reviewed here are mathematically well shaped.

**Verdict: MOSTLY PASS.**

## P0 — `IntervalAllLimitPoints` fails for degenerate intervals

Current theorem:

```text
(I.OrdConnected) -> forall x in I, IsClusterPointR x I.
```

Mathlib `Set.OrdConnected` admits singletons. Take

```text
I = {a}.
```

Then `I` is `OrdConnected`, but `a` is not a cluster point of `I` because there is no distinct point of `I` in any punctured neighborhood of `a`.

### Required correction

Use at least one of:

- `I.Nontrivial` plus `I.OrdConnected`;
- an explicit no-isolated-point/nondegenerate interval hypothesis;
- a project-specific interval predicate whose definition excludes singletons, if that is truly the intended convention.

For the present Mathlib `OrdConnected` formalization, a nontriviality hypothesis is the clean fix.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# Topology ownership duplication

`SubsetsOfR.lean` is a concrete real-line owner for concepts also appearing in:

1. `LRA.Analysis.StructureOfRealLine.OpenClosedSets`;
2. generic `LRA.Topology.PointSetTopology`;
3. portions of generic metric-space set geometry.

This is not automatically wrong—the real-line file can legitimately be an example/specialization chapter—but it should not remain an independent semantic owner for closure, interior, boundary, openness, and closedness.

Recommended direction:

```text
generic topology definitions/theorems
       -> metric-induced specialization
       -> Real specialization / examples
```

Then the real-line chapter should prove equivalence/identification with the generic notions instead of maintaining parallel definitions indefinitely.

**Severity: P1 OWNERSHIP/PROMOTION ISSUE.**

---

# Correct repair and domain semantics for extrema

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

The theorem `ClusterPointSequential` may, in a proof from the neighborhood definition to an explicit sequence, select one witness from each shrinking neighborhood. As with the analogous limits theorem, this is a potential **countable-choice proof dependency**, not something inferred merely from the theorem statement while its proof is still `sorry`.

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
| Concrete Real closure/interior/boundary toolkit | **MOSTLY PASS** |
| `IntervalAllLimitPoints` | **P0 FALSE FOR SINGLETON INTERVALS** |
| Real topology ownership | **P1 CONSOLIDATION NEEDED** |
| Totalized `sSup`/`sInf` domain policy | **NEEDS CONSISTENT PROJECT-WIDE RULE** |
| Choice usage | **NO CONFIRMED NEW GENUINE AC; COUNTABLE-CHOICE PROOF WATCHPOINT** |

---

# Immediate priority fixes

1. replace the four zero extrema stubs with genuine supremum/infimum constructions;
2. add nontriviality to `IntervalAllLimitPoints` or use a genuinely nondegenerate interval predicate;
3. preserve explicit nonempty/bounded hypotheses on real-valued extrema theorems;
4. audit every theorem in `SupInfOfFunctions.lean` after the definitions are repaired;
5. consolidate concrete Real topology with the generic topology owner;
6. establish a project-wide policy for totalized real `sSup`/`sInf` constructions;
7. only after that use these extrema objects in continuity, integration, or functional-analysis developments.
