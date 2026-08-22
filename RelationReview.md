# LRA Relation Review

## Scope

This is the maintained review for the low-level `LRA.Relation` subject. The same project-wide review rules used in `CarrierReview.md` apply here:

- `sorry` is neutral scaffolding;
- axioms are judged by mathematical legitimacy, not by mere presence;
- the repository is assumed to build at `origin/main @ HEAD`;
- choice usage outside dedicated ZFC/choice developments is documented separately;
- the target completeness standard is strong pre-measure-theory mathematics, not research-level exhaustiveness.

---

# Review 1 — Primitive relation properties

## Files reviewed

- `LRA/Relation/Properties/Definition.lean`
- `LRA/Relation/Properties/Consequences.lean`
- `LRA/Relation/Properties/FailureModes.lean`
- `LRA/Relation/Properties/WellFounded/Definition.lean`
- `LRA/Relation/Properties/WellFounded/Theorems.lean`

## Primitive endorelation properties

The following definitions were checked and are mathematically correct:

- `Reflexive R := ∀ x, R x x`;
- `Irreflexive R := ∀ x, ¬ R x x`;
- `Symmetric R := ∀ x y, R x y → R y x`;
- `Antisymmetric R := ∀ x y, R x y → R y x → x = y`;
- `Asymmetric R := ∀ x y, R x y → ¬ R y x`;
- `Transitive R := ∀ x y z, R x y → R y z → R x z`.

**Verdict: CORRECT.**

## Connexity, totality, and trichotomy

`Connex R` is defined as

```text
∀ x y, R x y ∨ R y x.
```

and `Total R` is an alias of `Connex R`.

This is mathematically legitimate, but terminology varies across textbooks. Under this definition, setting `x = y` forces `R x x`, so connexity automatically implies reflexivity. This is appropriate for a non-strict total order relation such as `≤`, but it is stronger than the alternative convention

```text
x ≠ y → (R x y ∨ R y x)
```

sometimes also called connexity or totality.

The repository separately defines:

```text
Trichotomous R := ∀ x y, R x y ∨ x = y ∨ R y x
```

and `ExactlyTrichotomous`, which requires exactly one of those three alternatives.

That separation is useful for strict-order relations such as `<`.

**Verdict: CORRECT, with a terminology caution.**

### Recommendation

Keep the present definitions, but ensure order-structure documentation states explicitly:

- `Total/Connex` is the reflexive-comparability notion intended for non-strict order;
- `Trichotomous`/`ExactlyTrichotomous` is the corresponding strict-order comparability vocabulary.

This avoids a common source of confusion in analysis notes.

## Euclidean properties

The definitions are orientation-correct:

- `LeftEuclidean`: two arrows into a common target imply a relation between their sources;
- `RightEuclidean`: two arrows out of a common source imply a relation between their targets.

These are standard relation-theoretic notions.

**Verdict: CORRECT.**

## Relation density

`Dense R` is defined by

```text
∀ x y, R x y → ∃ z, R x z ∧ R z y.
```

This is the standard density condition for a relation.

Important pedagogical qualification: by itself this does **not** mean that `z` is strictly between distinct endpoints. For a reflexive relation the condition can become trivial by choosing an endpoint. The familiar order-density meaning is recovered when `R` is a strict/irreflexive order such as `<`.

### Recommendation

Do not change the generic relation definition. In the order layer, provide or document the specialized theorem/reading:

> a strict order is dense iff between any related `x < y` there exists `z` with `x < z < y`.

**Verdict: CORRECT GENERIC DEFINITION; specialization should be explicit in order notes.**

## Mapping-shape properties

The heterogeneous-relation definitions are correctly oriented:

- `LeftTotal`: every source has some target;
- `RightTotal`: every target has some source;
- `RightUnique`: each source has at most one target;
- `LeftUnique`: each target has at most one source.

These support the repository's graph-based function definitions correctly.

**Verdict: PASS.**

## Minimal and maximal elements

For a represented subset and a relation `R`:

- `MinimalElement R A m` requires `m ∈ A` and no `a ∈ A` with `R a m`;
- `MaximalElement R A m` requires `m ∈ A` and no `a ∈ A` with `R m a`.

For a strict order `<`, these are exactly the standard notions of minimal and maximal element.

They are correctly distinguished from **minimum** and **maximum**, which require comparison with every element and belong naturally in the order/bounds layer.

**Verdict: CORRECT.**

## Immediate consequence theorems

The reviewed theorem statements are all correct:

- asymmetry implies irreflexivity;
- irreflexive + transitive implies asymmetry;
- asymmetry implies antisymmetry;
- symmetric + antisymmetric + `R x y` implies `x = y`;
- reflexivity and asymmetry are incompatible on any displayed element.

These are useful elementary implication results.

**Verdict: PASS.**

## Failure-mode vocabulary

`ProperlyPartial` is defined as single-valued (`RightUnique`) but not total (`¬ LeftTotal`).

`ProperlyMultivalued` is defined as total (`LeftTotal`) but not single-valued (`¬ RightUnique`).

These correctly identify the two basic ways a relation can fail to be a function relation while satisfying the other half of the function condition.

**Verdict: CORRECT.**

---

# Finding — `WellFounded` is backend-relative

`LRA.Relation.WellFounded SetObject R` is defined by requiring every nonempty **represented** `SetObject` to contain an `R`-minimal element.

This is mathematically meaningful, and the source explicitly says that the chosen set backend is part of the assertion. However, the unqualified name `WellFounded` can be stronger than what the type actually guarantees.

If `SetObject` represents all subsets of the carrier, this is the familiar subset-minimal formulation of well-foundedness. If `SetObject` represents only some subsets, the statement is only relative to that family. In an extremely weak backend it can hold even when `R` is not intrinsically well-founded in the ordinary sense.

`MinimalElementPrinciple` currently restates the definition for a chosen represented subset; it does not bridge this backend-relative notion to Lean's intrinsic accessibility-based `WellFounded` or to a full-powerset formulation.

## Recommendation

Before using this as the canonical well-foundedness notion across order/induction developments, do one of the following:

1. rename the current property to something explicit such as `WellFoundedOnRepresentedSubsets`; or
2. retain the name but require/document a set-interface law guaranteeing that every predicate/subset is representable; and prove a bridge theorem to an intrinsic relation well-foundedness notion.

At minimum, the order/well-order layer should not silently infer ordinary well-foundedness from this property without such a completeness assumption on the set backend.

**Severity: MAJOR SEMANTIC/API CAUTION, not a false definition.**

---

# Missing elementary relation-law results worth adding

The current `Consequences.lean` contains a useful start but is sparse relative to the role this vocabulary plays downstream. Before treating the relation layer as a polished learning/reference layer, consider adding the following elementary facts if they are not already present elsewhere:

1. `Reflexive → ¬ Irreflexive` for inhabited carriers, with the empty-carrier caveat made explicit.
2. `Asymmetric → Irreflexive ∧ Antisymmetric` packaged as a convenient conjunction theorem.
3. `Irreflexive ∧ Transitive ↔ Asymmetric ∧ Transitive` as the standard strict-order law equivalence.
4. `ExactlyTrichotomous → Trichotomous`.
5. `ExactlyTrichotomous → Irreflexive`.
6. `Trichotomous + Irreflexive → ExactlyTrichotomous` (using asymmetry/transitivity as needed depending on the exact desired hypotheses).
7. `Connex → Reflexive` under the repository's chosen connex definition.
8. `Connex + Antisymmetric` consequences relevant to total/linear orders.
9. Converse-preservation facts for reflexive, irreflexive, symmetric, antisymmetric/asymmetric, transitive, and Euclidean properties, if not already supplied in the converse-operation subject.

These are elementary structural facts, not research-level additions. They make later order-structure requirements much easier to read as named mathematical laws rather than repeatedly unpacked predicates.

---

# Pre-measure-theory relevance

This relation vocabulary is foundational rather than measure-theoretic, but it is important because the following later topics rely on it:

- equivalence relations and quotient constructions;
- partial/linear orders;
- upper/lower bounds, supremum and infimum;
- well-orders and induction;
- dense orders such as the rationals and reals;
- function graphs;
- order/topology interactions.

No advanced relation theory is needed before measure theory. The important goal is a clean and unambiguous bridge from these primitive laws to equivalence structures and order structures.

---

# Choice audit

No genuine family-wise choice principle was identified in the files reviewed in this relation-property chunk.

---

# Final verdict for this chunk

| Dimension | Verdict |
|---|---|
| Primitive relation definitions | **PASS** |
| Orientation of heterogeneous properties | **PASS** |
| Immediate implication theorems | **PASS** |
| Connex/trichotomy terminology | **CORRECT, DOCUMENT CONVENTION** |
| Density | **CORRECT, NEEDS STRICT-ORDER SPECIALIZATION IN NOTES** |
| Well-foundedness | **BACKEND-RELATIVE; NEEDS EXPLICIT BRIDGE OR NAMING CLARIFICATION** |
| Relation-law theorem completeness | **GOOD START, TOO SPARSE FOR FINAL LEARNING LAYER** |
| Choice use | **NONE IDENTIFIED** |

---

# Next review chunk

Review `LRA.Relation.Structures` in a small pass: equivalence-relation, preorder/partial-order/strict-order-style bundles only. The purpose is to verify that the named structures require exactly the correct primitive laws and that no order concept is accidentally pinned to the wrong notion of totality/trichotomy.
