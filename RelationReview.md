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

# Final verdict for Review 1

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

# Review 2 — Equivalence-style relation structures

## Files reviewed

- `LRA/Relation/Structures/Definition.lean`
- `LRA/Relation/Structures/Equivalence/Consequences.lean`
- `LRA/Relation/Structures/Equivalence/Partition.lean`
- `LRA/Relation/Structures/Equivalence/FundamentalTheorem.lean`

The `LRA.Relation.Structures` folder does **not** own order structures; those live in `LRA.Order` and will be reviewed separately.

## `EquivalenceRelation`

Defined as reflexive + symmetric + transitive.

This is exactly the standard definition.

**Verdict: CORRECT.**

The accessor theorems extracting reflexivity, symmetry, and transitivity are correct and useful.

## `PartialEquivalenceRelation`

Defined as symmetric + transitive.

This is the standard definition of a partial equivalence relation (PER). Such a relation need not be reflexive on the entire carrier, although symmetry and transitivity force reflexivity on every element that is related to something.

### Recommended illuminating theorem

Add the standard local-reflexivity consequence if not already elsewhere:

```text
R x y and PER R  →  R x x ∧ R y y.
```

This is pedagogically valuable because it explains exactly in what sense a PER is "partial" rather than simply an equivalence relation missing an arbitrary axiom.

**Verdict: CORRECT; one useful consequence theorem recommended.**

## `ToleranceRelation` / `CompatibilityRelation`

`ToleranceRelation` is reflexive + symmetric, and `CompatibilityRelation` is an alias.

This is standard terminology in universal algebra/fuzzy relation contexts. It is not essential pre-measure-theory material, but it is mathematically harmless and properly factored.

**Verdict: CORRECT.**

## Partition structure

A partition is represented by:

- a carrier set;
- an index type;
- indexed blocks;
- blocks contained in the carrier;
- coverage of the carrier;
- nonempty blocks;
- overlap implies equality.

The last condition is equivalent to pairwise disjointness-or-equality of blocks. Together these are a correct indexed formulation of a partition.

**Verdict: CORRECT.**

## Partition induced by an equivalence relation

`PartitionFromEquivalence` indexes equivalence classes by representatives lying in the ambient represented set. This creates duplicate indices for representatives from the same class, but the partition structure allows this because overlapping blocks are proved equal. Mathematically this is fine: the index type need not itself be the quotient.

The class blocks are intersected with / formed relative to the ambient represented carrier, which is also appropriate for a partition of that ambient set.

**Verdict: CORRECT.**

## Fundamental theorem of equivalence relations

`FundamentalTheoremOfEquivalenceRelations` states, for points in the ambient carrier, that the relation reconstructed from the equivalence-class partition agrees with the original equivalence relation.

This is the expected fundamental theorem connecting equivalence relations and partitions.

The restriction of the equivalence to points in the ambient set is important and correctly appears in the hypotheses.

**Verdict: CORRECT.**

## Missing pre-measure-theory / foundational equivalence facts worth ensuring

Before considering the equivalence layer complete for learning and quotient constructions, the following elementary facts should be present somewhere in this subject:

1. two equivalence classes are either equal or disjoint;
2. `x` belongs to its own equivalence class;
3. `x ~ y` iff their equivalence classes are equal;
4. every equivalence class is nonempty;
5. quotient classes cover the carrier;
6. a partition induces an equivalence relation;
7. the two constructions (partition → relation → partition and relation → partition → relation) recover the expected object, modulo duplicate indexing where appropriate.

Several of these are already implicit in the partition construction; later passes should check that they are exposed as named theorems rather than only buried inside structure-field proofs.

## Choice audit

No genuine choice principle is required for the reviewed equivalence-relation/partition statements. Indexing classes by actual representatives from the ambient subtype avoids needing to choose one distinguished representative per class.

This is a good foundational design choice.

## Final verdict for Review 2

| Dimension | Verdict |
|---|---|
| Equivalence relation definition | **PASS** |
| Partial equivalence relation | **PASS** |
| Tolerance/compatibility relation | **PASS** |
| Partition definition | **PASS** |
| Equivalence relation → partition construction | **PASS** |
| Fundamental relation/partition theorem | **PASS** |
| Choice dependence | **NONE IDENTIFIED** |
| Learning completeness | **GOOD, VERIFY/EXPOSE STANDARD CLASS THEOREMS** |

---

# Next review chunk

Move to `LRA.Order` as a separate subject. Start only with definitions of preorder, partial order, strict partial order, linear/total order, and any dense/well-order structures. Verify that each named structure requires exactly the standard primitive relation laws before inspecting bounds, supremum/infimum, or interval/topology consequences.
