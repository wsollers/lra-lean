# LRA Order Review

## Scope

Maintained mathematical review of `LRA.Order`, performed in small dependency-aware chunks. Project-wide review rules are inherited from `CarrierReview.md` and `RelationReview.md`.

This review ignores `sorry` as a defect, accepts legitimate mathematical axioms, documents genuine choice usage outside dedicated set-theory choice developments, and targets the mathematics expected before measure theory rather than research-level completeness.

---

# Review 1 — Core order structures and density

## Files reviewed

- `LRA/Order/OrderedSets/Preorder/Definition.lean`
- `LRA/Order/OrderedSets/PartialOrder/Definition.lean`
- `LRA/Order/OrderedSets/StrictOrder/Definition.lean`
- `LRA/Order/OrderedSets/LinearOrder/Definition.lean`
- `LRA/Order/OrderedSets/StrictLinearOrder/Definition.lean`
- `LRA/Order/OrderedSets/WellOrder/Definition.lean`
- `LRA/Order/Density/DenseOrder/Definition.lean`
- `LRA/Order/Density/DenseLinearOrder/Definition.lean`

## `Preorder`

Defined as reflexive + transitive.

This is exactly standard.

**Verdict: CORRECT.**

## `PartialOrder`

Defined as reflexive + antisymmetric + transitive.

This is exactly standard.

**Verdict: CORRECT.**

## `StrictOrder`

Defined as irreflexive + transitive.

This is a standard definition of a strict partial order. Asymmetry follows from these two laws and is already available in the relation-property layer.

**Verdict: CORRECT.**

### Terminology recommendation

Because some texts reserve “strict order” for what others call “strict partial order,” the notes should explicitly identify this convention once. No mathematical change is needed.

## `LinearOrder` / `TotalOrder`

Defined as partial order + `Relation.Total`, where `Total` means

```text
∀ x y, R x y ∨ R y x.
```

Since `PartialOrder` is already reflexive, this is exactly the standard non-strict linear/total order law.

`TotalOrder` is an alias of `LinearOrder`, which is standard terminology.

**Verdict: CORRECT.**

## `StrictLinearOrder`

Defined as strict order + exact trichotomy:

```text
x < y, x = y, y < x
```

with exactly one alternative holding.

This is mathematically correct. Exact trichotomy is somewhat stronger syntactically than the minimal “strict order + ordinary trichotomy” presentation, but under irreflexivity/transitivity/asymmetry the formulations coincide. The stronger explicit law is pedagogically clear and avoids needing a separate exclusivity derivation at every use site.

**Verdict: CORRECT.**

### Recommended relationship theorem

Ensure the library exposes the equivalence between the following common presentations:

- strict order + trichotomy;
- strict order + exact trichotomy;
- non-strict linear order obtained by reflexive closure.

The existing strict/non-strict correspondence tree appears intended to supply this; it will be checked separately.

## Density — historical defect is fixed

Current `DenseOrder R` is

```text
StrictOrder R ∧ Relation.Dense R
```

and current `DenseLinearOrder R` is

```text
StrictLinearOrder R ∧ Relation.Dense R.
```

This is the correct formulation. Because the underlying relation is irreflexive, `Relation.Dense` now means exactly that whenever `x < y`, there exists `z` with

\[
x < z < y.
\]

This fixes the old defect in which density had been imposed on a reflexive non-strict order and was therefore vacuous.

The native `DenseOrderLaw` wrapper over Lean `<` also states the correct strict-between property directly.

**Verdict: PASS.**

## `WellOrder` — mathematically correct but backend-relative

`WellOrder SetObject R` requires:

1. `LinearOrder R`; and
2. every nonempty represented `SetObject` has a least element.

This is correct **relative to the chosen set backend**. The source explicitly keeps linearity separate because deriving it from two-element subsets would require knowing that every pair subset is representable.

The same caution identified in `RelationReview.md` therefore applies: this is not automatically the intrinsic statement “every nonempty subset of the carrier has a least element” unless the backend is known to represent all subsets.

### Recommendation

Keep the backend-relative version if it is important for LRA set models, but also expose a canonical full-subset specialization, e.g. over predicate sets / `Set Element`, and a transfer theorem from an adequate LRA set backend.

This matters because well-ordering and well-founded induction are foundational concepts whose usual mathematical meaning quantifies over all subsets.

**Severity: MAJOR API/SEMANTIC CAUTION, already explicitly recognized by the source.**

## Requirements-to-obey-law assessment

For the central named order laws, the repository now states the correct requirements directly:

| Named structure | Required laws |
|---|---|
| Preorder | reflexive + transitive |
| Partial order | reflexive + antisymmetric + transitive |
| Strict order | irreflexive + transitive |
| Linear/total order | partial order + total comparability |
| Strict linear order | strict order + exact trichotomy |
| Dense order | strict order + between-point density |
| Dense linear order | strict linear order + between-point density |
| Well-order | linear order + least element in every nonempty represented subset |

This is exactly the kind of “what must be proved before a concrete system satisfies law/structure X” surface needed for later number-system certification.

**Verdict: STRONG.**

## Choice audit

No genuine choice principle is needed merely to state the reviewed order structures or density laws.

A theorem asserting that **every set can be well-ordered** would of course be choice-equivalent and must be tracked separately if it appears outside dedicated choice developments. No such theorem was reviewed in this chunk.

## Pre-measure-theory relevance

These order structures are appropriate and sufficient as foundations for real analysis. Before measure theory, the essential next order material is:

- bounds and boundedness;
- least/greatest versus minimal/maximal elements;
- supremum and infimum;
- least-upper-bound / greatest-lower-bound properties;
- order completeness of the reals;
- density of rationals/reals;
- interval order facts;
- monotone sequences and their relation to completeness.

Lattices, directed sets, lexicographic products, etc. are useful but not prerequisites for elementary measure theory and should not displace attention from the bounds/completeness chain.

## Final verdict for Review 1

| Dimension | Verdict |
|---|---|
| Preorder | **PASS** |
| Partial order | **PASS** |
| Strict order | **PASS** |
| Linear/total order | **PASS** |
| Strict linear order | **PASS** |
| Dense order | **PASS — old defect fixed** |
| Well-order | **CORRECT RELATIVE TO SET BACKEND; NEED CANONICAL FULL-SUBSET BRIDGE** |
| Choice use | **NONE IDENTIFIED IN THIS CHUNK** |
| Readiness for further analysis | **YES** |

---

# Next review chunk

Review the bounds/completeness chain in this order:

1. `UpperBound` / `LowerBound`;
2. `BoundedAbove` / `BoundedBelow` / `Bounded`;
3. `LeastElement` / `GreatestElement` versus minimal/maximal;
4. `Supremum` / `Infimum`;
5. least-upper-bound and greatest-lower-bound properties;
6. `Completeness` naming and its intended order-theoretic meaning.

The goal is to verify both logical correctness and that the theorem surface is sufficient for the standard real-analysis completeness arguments before measure theory.
