# LRA Bounds and Order-Completeness Review

## Scope

Maintained mathematical review of the bounds/completeness portion of `LRA.Order`. The project-wide rules from `CarrierReview.md`, `RelationReview.md`, and `OrderReview.md` apply.

Target standard: rigorous real-analysis prerequisites before measure theory, not research-level order theory.

---

# Review 1 — Bounds, extrema, suprema/infima, and order completeness

## Files reviewed

- `LRA/Order/Bounds/UpperBound/Definition.lean`
- `LRA/Order/Bounds/LowerBound/Definition.lean`
- `LRA/Order/Bounds/BoundedAbove/Definition.lean`
- `LRA/Order/Bounds/BoundedBelow/Definition.lean`
- `LRA/Order/Bounds/Bounded/Definition.lean`
- `LRA/Order/Bounds/LeastElement/Definition.lean`
- `LRA/Order/Bounds/Supremum/Definition.lean`
- `LRA/Order/Bounds/Infimum/Definition.lean`
- `LRA/Order/Bounds/Supremum/Theorems.lean`
- `LRA/Order/Bounds/LeastUpperBoundProperty/Definition.lean`
- `LRA/Order/Bounds/GreatestLowerBoundProperty/Definition.lean`
- `LRA/Order/Bounds/LeastUpperBoundProperty/Theorems.lean`
- `LRA/Order/Bounds/LeastUpperBoundProperty/CompletenessLaws.lean`

## Upper and lower bounds

`UpperBound R A u` means

\[
\forall x\in A,\ x\,R\,u.
\]

`LowerBound R A l` means

\[
\forall x\in A,\ l\,R\,x.
\]

For a non-strict order `≤`, these are exactly the standard definitions.

**Verdict: CORRECT.**

## Bounded above / below / bounded

The repository defines:

\[
\operatorname{BoundedAbove}(A) \iff \exists u\,\operatorname{UpperBound}(u,A),
\]

\[
\operatorname{BoundedBelow}(A) \iff \exists l\,\operatorname{LowerBound}(l,A),
\]

and

\[
\operatorname{Bounded}(A) \iff \operatorname{BoundedAbove}(A)\land\operatorname{BoundedBelow}(A).
\]

These are standard and correctly independent of whether the bound lies in the subset.

**Verdict: CORRECT.**

## Least/greatest versus minimal/maximal

`LeastElement R A a` requires membership and lower-bound status:

\[
a\in A\quad\text{and}\quad\forall x\in A,\ aRx.
\]

This is correctly stronger than the generic relation-layer notion of `MinimalElement`, which merely says no member is strictly below the candidate under the displayed relation.

The same distinction applies dually to greatest/maximal.

The repository's theorem surface already includes relationships such as:

- least element implies minimal element;
- greatest element implies maximal element;
- in a linear order, minimal implies least and maximal implies greatest;
- least/greatest elements are related to infimum/supremum plus membership.

That is exactly the pedagogical distinction a real-analysis foundation should expose.

**Verdict: STRONG.**

## Supremum

`Supremum R A s` is defined by:

1. `s` is an upper bound of `A`; and
2. every upper bound `u` of `A` satisfies `s R u`.

For `≤`, this is exactly “least upper bound.”

No membership of `s` in `A` is required, correctly distinguishing supremum from maximum/greatest element.

**Verdict: CORRECT.**

## Infimum

`Infimum R A i` is defined dually:

1. `i` is a lower bound;
2. every lower bound `l` satisfies `l R i`.

This is exactly the standard greatest-lower-bound definition.

**Verdict: CORRECT.**

## Uniqueness correctly requires antisymmetry

`SupremumUnique` assumes antisymmetry of the displayed relation. This is mathematically important: in a preorder, two distinct but equivalent elements can both satisfy the least-upper-bound property.

The repository therefore correctly distinguishes existence of a supremum from uniqueness as an element.

The same principle should hold dually for infima.

**Verdict: PASS.**

## Useful supremum theorem surface

The reviewed file contains a strong elementary set of consequences:

- a supremum is an upper bound;
- it is related to every upper bound;
- once a supremum exists, upper bounds are exactly elements above it, assuming transitivity for the reverse direction;
- supremum is monotone under subset inclusion;
- pointwise domination compares suprema;
- a supremum belonging to the set is its greatest element;
- union/intersection/difference/indexed-union comparison theorems.

These are appropriate real-analysis tools and are stated at useful levels of generality.

**Verdict: STRONG.**

## Least-upper-bound and greatest-lower-bound properties

`LeastUpperBoundProperty SetObject R` states:

> every nonempty represented subset that is bounded above has a supremum.

`GreatestLowerBoundProperty` is the exact dual.

These are mathematically correct.

As with `WellOrder` and relation well-foundedness, however, they are **backend-relative**: the property only ranges over the selected `SetObject` representation.

This is explicitly acknowledged in the source.

### Consequence

A weak set backend can satisfy the property without the carrier being order-complete in the usual full-subset sense.

### Recommendation

Maintain both layers explicitly:

1. backend-relative LUB/GLB properties for abstract LRA set models;
2. canonical full-subset versions using predicate/ordinary sets;
3. transfer theorems from a set backend that is known to represent all relevant subsets.

**Severity: MAJOR API/SEMANTIC CAUTION, not a false mathematical statement.**

## Unique supremum from LUB property

`LeastUpperBoundPropertyGivesUniqueSupremum` adds antisymmetry and correctly concludes existence of a unique supremum for every nonempty bounded-above represented subset.

This theorem has exactly the right hypothesis structure.

**Verdict: CORRECT.**

## `OrderCompletenessLaws`

The class

```text
OrderCompletenessLaws R SetObject
```

packages the least-upper-bound property for the native `≤` relation.

This is a good explicit name: it correctly identifies the notion as **order completeness** and keeps the set backend visible.

The wrapper theorem, however, is named simply:

```text
Completeness
```

inside `LRA.Order`.

This is potentially confusing once metric spaces/Cauchy completeness are in scope. The repository also has a substantial `LRA.Analysis.Completeness` subject, so unqualified pedagogical use of “completeness” is already overloaded.

### Recommendation

Prefer an explicit public theorem name such as:

- `OrderCompleteness`,
- `LeastUpperBoundCompleteness`, or
- `HasLeastUpperBoundProperty`.

The class name itself is good and need not change.

**Severity: MODERATE NAMING/API ISSUE.**

## Duplicate analysis-facing LUB vocabulary

A location check found that `LRA.Analysis.Completeness.Completeness.Definition.AxiomOfCompleteness` independently defines:

```text
HasLeastUpperBoundProperty (S : Type*) [Preorder S]
```

using Mathlib `Set`, `IsUpperBound`, and `IsSupremum`, and then postulates:

```text
AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ
```

This is mathematically correct and the axiom is legitimate in the intended analysis-facing presentation. However, it creates a second least-upper-bound-property vocabulary parallel to the canonical `LRA.Order.LeastUpperBoundProperty` machinery.

This is an integration concern analogous to the duplicate countability vocabulary found earlier.

### Recommendation

Establish one canonical mathematical concept and bridge the analysis-facing Mathlib representation to it. Good options:

- keep `LRA.Order.LeastUpperBoundProperty` canonical and prove a specialization/interop theorem for `Set ℝ` and Mathlib's `IsLUB`; or
- make the Mathlib-facing form explicitly an interop theorem rather than a second independently named foundational definition.

Do not maintain two unconnected definitions of “least upper bound property” indefinitely.

**Severity: MAJOR ARCHITECTURAL CONSOLIDATION; current mathematics itself is correct.**

## Axiom policy

`AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ` is an appropriate classical analysis axiom when the real numbers are being taken as given rather than constructed in that volume.

The source explicitly notes that other number-system volumes may prove analogous completeness properties for constructed real models.

Under the review policy, this is **not** an objectionable axiom.

**Verdict: LEGITIMATE AXIOMATIC PLACEMENT.**

## Choice audit

No genuine family-wise choice was identified in the bounds definitions or the reviewed supremum/LUB theorems.

Existence of a supremum is assumed through the LUB property rather than obtained by selecting suprema for an arbitrary family.

## Important pre-measure-theory completeness results to ensure

The repository already has a broad `Analysis/Completeness` subject, so these are targets to verify rather than automatically classify as missing:

1. LUB property ⇔ GLB property in a linear order under suitable nontriviality/order hypotheses;
2. monotone convergence theorem for bounded monotone real sequences;
3. nested interval property;
4. Cauchy completeness of `ℝ` and its relation to order completeness;
5. Bolzano–Weierstrass;
6. Archimedean property;
7. density of `ℚ` in `ℝ` and density of irrationals;
8. existence of square roots / completeness applications;
9. equivalence or implication diagram among standard real completeness principles, at the appropriate undergraduate level.

These should be reviewed in the Analysis layer rather than duplicated here.

## Final verdict for Review 1

| Dimension | Verdict |
|---|---|
| Upper/lower bounds | **PASS** |
| Boundedness | **PASS** |
| Least/greatest vs minimal/maximal | **PASS / STRONG** |
| Supremum/infimum definitions | **PASS** |
| Supremum uniqueness hypotheses | **PASS** |
| LUB/GLB properties | **CORRECT, BACKEND-RELATIVE** |
| Order completeness class | **PASS** |
| Public `Completeness` theorem naming | **SHOULD BE MORE EXPLICIT** |
| Analysis-facing duplicate LUB vocabulary | **NEEDS CONSOLIDATION/BRIDGE** |
| Axiom of real completeness | **LEGITIMATE** |
| Choice use | **NONE IDENTIFIED** |

---

# Next review chunk

Move into `LRA.Analysis.Completeness` in small pieces, starting with the canonical completeness principles and equivalence claims. The first question is whether the Analysis layer is mathematically consistent with the now-canonical `LRA.Order` definitions, and the second is whether all standard pre-measure-theory completeness facts are present without unnecessary duplicate vocabulary.
