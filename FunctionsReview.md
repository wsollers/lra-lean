# LRA Real-Valued Functions Review

## Scope

Maintained mathematical review of `LRA.Analysis.Functions`, focusing on the function-theoretic material consumed by continuity, differentiation, and integration: algebra of functions, boundedness, extrema, pointwise order, monotonicity, linear combinations, supremum/infimum constructions, and the concrete real-line subset toolkit.

Project-wide rule: `sorry` proof bodies are neutral. Concrete placeholder definitions are not neutral when theorem statements depend on their intended semantics.

---

# Active status

`LRA.Analysis.lean` imports `LRA.Analysis.Functions`, and the functions aggregate imports all reviewed modules including `SupInfOfFunctions.lean` and `SubsetsOfR.lean`.

Several source headers still say these drafts are “not yet imported by the active Volume III root.” That is stale relative to the current aggregate import graph and should be corrected so semantic defects are not mistaken for quarantined drafts.

---

# Algebra of functions

`AlgebraOfFunctions.lean` states mathematically correct facts:

- composition preserves injectivity;
- composition preserves surjectivity;
- composition preserves bijectivity;
- a bijection has a bijective inverse;
- preimage commutes with union, intersection, and complement.

**Verdict: MATHEMATICALLY PASS.**

## P1/P2 duplicate semantic ownership

The file locally introduces:

- `IsInjectiveOn`;
- `IsSurjectiveOn`;
- `IsBijectiveOn`;
- `IsInverseFunctionOf`.

The canonical `LRA.Function` subject already owns injective/surjective/bijective and left/right/two-sided inverse vocabulary, with a stronger graph/preimage calculus.

Recommendation: retain these names only as explicit aliases/bridges to the canonical owner, or migrate this chapter to `LRA.Function` vocabulary. Do not maintain two independent definitions for the same arrow-level concepts.

**Severity: P1/P2 OWNERSHIP/INTEROP, not mathematical error.**

The source-note corruption described in the file header—misplaced interpretation/predicate/negation blocks—is documentation damage rather than a theorem-statement defect.

---

# Linear combinations

`LinearCombo`, closure under linear combinations, bounded linear combinations, `IsRealLinearRule`, the additivity/homogeneity test, and basic consequences are all correctly stated.

This is good scaffolding for later derivative/integral linearity.

**Verdict: PASS.**

A later consolidation could phrase the class of functions as an actual subspace when the functional-analysis layer is mature, but the current elementary explicit predicate is pedagogically useful.

---

# Monotone and constant functions

The definitions of increasing/decreasing, strict variants, monotone, and constant functions are standard.

Reviewed laws are correct:

- strict monotonicity implies weak monotonicity;
- negation reverses monotonicity;
- positive scalar multiplication preserves direction;
- weak monotonicity need not be strict;
- constant iff both increasing and decreasing;
- constant functions are bounded and monotone;
- sums preserve common monotonic direction;
- products preserve monotonic direction under nonnegativity hypotheses;
- strict monotonicity implies injectivity on the displayed set;
- restriction preserves monotonicity;
- composition has the expected four direction combinations.

**Verdict: PASS.**

These concrete real-valued predicates overlap with Mathlib `MonotoneOn`/`StrictMonoOn` and with the relation/order subjects. Explicit bridge theorems would reduce translation friction in later chapters.

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

## Immediate counterexample

For a one-element finite index type with `f alpha x = 1`, `PointwiseSupremumFamily f x` is definitionally `0`, while `PointwiseSupremumEvaluation` asserts it equals `f alpha x = 1`.

**Severity: P0 ACTIVE SEMANTIC STUB CLUSTER.**

## Correct repair/domain policy

Intended real-valued forms are approximately

```text
FunctionSupremumOnSet f A = sSup (f '' A)
FunctionInfimumOnSet f A = sInf (f '' A)
```

but real `sSup`/`sInf` are totalized outside the mathematically meaningful nonempty/bounded domain. Preserve explicit domain hypotheses on all theorems, or use an extended-real codomain where infinity is natural.

---

# Concrete real-line subset topology

`SubsetsOfR.lean` contains a substantial correct concrete-`Real` toolkit:

- centered and punctured neighborhoods;
- cluster/adherent/isolated/interior/boundary points;
- interior, closure, and boundary sets;
- closed/open characterizations;
- closure as smallest closed superset;
- boundary as closure minus interior;
- sequential characterization of closed sets;
- real boundedness;
- sequential Heine–Borel;
- finite sets are closed;
- “true near” predicates.

**General verdict: MATHEMATICALLY STRONG.**

## P0 — `IntervalAllLimitPoints`

Current theorem is essentially

```text
I.OrdConnected -> forall x in I, x is a cluster point of I.
```

This is false because Mathlib `Set.OrdConnected` admits singleton sets. For `I = {a}`, the only point `a` is not a cluster point: there is no distinct member of `I` in any punctured neighborhood.

Required repair: add `I.Nontrivial`, require a second point in the relevant direction, or use a deliberately stronger nondegenerate interval predicate.

**Severity: P0 FALSE THEOREM STATEMENT.**

---

# P1 — topology ownership consolidation

The repository currently has at least three presentations of overlapping real-line topology material:

1. `LRA.Analysis.Functions.SubsetsOfR`;
2. `LRA.Analysis.StructureOfRealLine.OpenClosedSets` / `Compactness`;
3. generic `LRA.Topology.PointSetTopology` plus metric-induced topology.

The concrete presentations are largely mathematically correct, but they should become specialization/example layers over one canonical generic owner rather than independent semantic APIs.

Recommended direction:

```text
generic metric/topology owner
        ↓ specialize to Real
concrete epsilon/interval theorems
        ↓
Functions / StructureOfRealLine chapter-facing aliases/examples
```

This preserves the textbook viewpoints while preventing closure/open/closed/compactness concepts from drifting apart.

---

# Cross-project real extrema policy

There are now several real `sSup`/`sInf`-style constructions in the repository:

- function supremum/infimum;
- sequence limsup/liminf;
- metric diameter;
- point-to-set distance via `sInf`;
- Darboux upper/lower values eventually.

A common policy should be stated once:

> Real-valued extrema are mathematically meaningful only under their appropriate nonempty/bounded hypotheses; total Lean definitions must not be mistaken for total mathematical notions.

Where infinity is natural, prefer extended reals.

---

# Choice audit

No new genuine family-wise Axiom-of-Choice dependency was identified in this chunk.

Finite maximum/minimum evaluation does not require AC. The existence of an inverse to a bijection is unique-choice/witness extraction rather than arbitrary family-wise AC, as recorded in `FunctionReview.md`.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Algebra/composition facts | **PASS** |
| Duplicate injective/surjective/inverse vocabulary | **P1/P2 OWNERSHIP** |
| Linear combinations/real-linear rule | **PASS** |
| Monotone/constant function theory | **PASS** |
| Bounded-function theory | **PASS** |
| Pointwise order | **PASS** |
| Extremum point definitions | **PASS** |
| Function supremum/infimum definitions | **P0 ZERO STUBS** |
| Pointwise family sup/inf definitions | **P0 ZERO STUBS** |
| Concrete real-line topology | **MOSTLY PASS** |
| `IntervalAllLimitPoints` | **P0 SINGLETON COUNTEREXAMPLE** |
| Topology semantic ownership | **P1 CONSOLIDATION** |
| Choice usage | **NO NEW GENUINE AC IDENTIFIED** |

---

# Immediate priority fixes

1. replace the four zero extrema stubs with genuine supremum/infimum constructions;
2. fix `IntervalAllLimitPoints` with a nondegeneracy condition;
3. migrate/bridge duplicate arrow predicates to canonical `LRA.Function`;
4. consolidate concrete real topology as specialization of generic topology/metric APIs;
5. preserve explicit nonempty/bounded hypotheses on real-valued extrema;
6. update stale “not imported by active root” headers to reflect the current import graph.
