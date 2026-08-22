# LRA Set Review

## Scope

Maintained review of the canonical backend-agnostic `LRA.Set` interface and its elementary set-algebra laws. This review also checks representative concrete typed/Mathlib/ZF-style backends against the advertised capability boundaries.

Project-wide review rules apply: `sorry` is neutral scaffolding; foundational axioms are judged by mathematical legitimacy, not by mere presence; genuine choice use outside dedicated set-theory choice developments is tracked separately.

---

# Review 1 — capabilities, membership semantics, families, and elementary set algebra

## Files reviewed

- `LRA/Set/Interface.lean`
- `LRA/Set/Interface/Operations.lean`
- `LRA/Set/Interface/Membership.lean`
- `LRA/Set/Interface/Indexed.lean`
- `LRA/Set/Interface/Families.lean`
- `LRA/Set/Interface/Union.lean`
- `LRA/Set/Interface/Intersection.lean`
- `LRA/Set/Interface/Distributivity.lean`
- `LRA/Set/Interface/Difference.lean`
- `LRA/Set/Interface/Complement.lean`
- `LRA/Set/Interface/Subset.lean`

## Overall architecture

The set interface follows a strong machine/certificate split:

- operation classes provide data/capabilities;
- law classes certify the mathematical behavior of those operations;
- generic theorems consume only the capabilities and laws actually required.

Concrete set backends then register the relevant operations and certificates.

This is exactly the right architecture for supporting multiple foundational presentations without duplicating ordinary set algebra.

**Verdict: PASS — STRONG FOUNDATIONAL ARCHITECTURE.**

---

# Capability boundaries are mathematically well designed

The interface correctly distinguishes operations that exist in different kinds of set backends.

## Absolute complement and universal set

`HasComplement` and `HasUniversal` are optional capabilities. This is important: a typed/predicate-set backend can have an ambient universal set, while the universe of all ZF sets cannot itself be a set.

Therefore absolute complement is not falsely promised to Enderton/ZF-style backends.

**Verdict: CORRECT.**

## Relative difference

Relative difference is kept independent of a universal-set capability, so it remains available in ZF-style set theories.

This is exactly right.

## Separation

`HasSeparation` carves a predicate-defined subset from an existing ambient set rather than exposing unrestricted comprehension.

This correctly matches the mathematical distinction between separation and unrestricted set formation.

**Verdict: CORRECT AND FOUNDATIONALLY IMPORTANT.**

## Powerset

The powerset operation is correctly two-level: the powerset of a set object is a collection whose elements are set objects.

This avoids pretending that all backends share a single universe level or representation.

## Arbitrary indexed union versus set-sized/countable union

The interface explicitly distinguishes:

- arbitrary Lean-type-indexed unions/intersections;
- countable unions/intersections;
- union/intersection over an actual collection of sets.

This is an excellent and mathematically meaningful capability distinction. An arbitrary Lean `Type` may represent a class-sized indexing family from the viewpoint of a first-order set model, so ZF-style backends should not automatically expose that operation.

**Verdict: PASS.**

---

# Membership semantics

`ExtensionalityLaw` is correctly separated from the larger operation law bundle:

```text
(∀ x, x ∈ A ↔ x ∈ B) → A = B.
```

This lets generic proofs use extensionality without demanding irrelevant union/intersection capabilities.

`MembershipLaws` then supplies the standard meanings:

- empty membership is impossible;
- union membership is disjunction;
- intersection membership is conjunction;
- difference membership is membership-and-not-membership;
- subset means every member of the left belongs to the right.

All orientations are correct.

**Verdict: PASS.**

`SeparationLaws`, `PowersetMembershipLaws`, `UniversalMembershipLaws`, and symmetric-difference membership are likewise correctly stated.

---

# Indexed and countable membership laws

The laws

```text
x ∈ ⋃ᵢ Aᵢ ↔ ∃ i, x ∈ Aᵢ
x ∈ ⋂ᵢ Aᵢ ↔ ∀ i, x ∈ Aᵢ
```

and their countable versions are correct.

The capability split between arbitrary-index and countable-index operations is appropriate.

**Verdict: PASS.**

---

# Collection intersections correctly handle the empty-family problem

For a collection of sets, the interface states the intersection membership characterization only when the collection is nonempty.

This is an important foundational detail. An unconditional formula for `⋂₀ ∅` would force the existence of an absolute universal set, which is not available as a set in ordinary ZF.

The current definition therefore works correctly across both predicate-set and ZF-style backends.

**Verdict: PASS — PARTICULARLY GOOD FOUNDATIONAL DESIGN.**

---

# Covers and subcovers

`Covers collection target` means the target is contained in the union of the collection.

`Subcover subcollection collection target` means the subcollection is contained in the original collection and still covers the target.

These are mathematically correct generic definitions and are a good low-level owner for later compactness theory.

**Verdict: PASS.**

---

# Union laws

The union law certificate contains the expected elementary laws: commutativity, associativity, empty identities, idempotence, monotonicity, and the characterization `A ⊆ B ↔ A ∪ B = B`.

**Verdict: PASS.**

# Intersection laws

The intersection law certificate contains commutativity, associativity, empty annihilation, idempotence, monotonicity, and the characterization `A ⊆ B ↔ A ∩ B = A`.

**Verdict: PASS.**

# Distributivity and absorption

Both distributive laws and both absorption laws are correctly stated and depend only on the operations they actually mention.

**Verdict: PASS.**

---

# Difference laws

The relative-difference law family correctly records monotonicity in the left argument, antitonicity in the right argument, empty/self identities, difference across union/intersection, left distribution through union/intersection, subset-of-left, and disjointness from the removed set.

The laws mentioning the absolute universal set are correctly *not* placed here; they belong to the stronger complement capability.

**Verdict: PASS.**

---

# Complement laws

For backends with an absolute complement/universal set, the interface correctly gives double complement, complements of empty/universal, union/intersection with complement, both De Morgan laws, difference as intersection with complement, and universal-difference identities.

The named `Dual` presentation is also mathematically illuminating: complement reverses subset and swaps union/intersection, making the order-duality relationship explicit.

**Verdict: PASS.**

---

# Subset laws and relation-theoretic bridge

`SubsetLaws` contains reflexivity, transitivity, and equality iff mutual inclusion. This is enough to derive antisymmetry, hence subset is a partial order on set objects satisfying these laws.

## Recommended additions

For a learning/reference surface, add explicit named theorems if not already elsewhere:

- `SubsetAntisymmetric`;
- `SubsetIsPartialOrder` / a bridge to the canonical `LRA.Order.PartialOrder` predicate;
- proper/strict subset definition `A ⊂ B := A ⊆ B ∧ A ≠ B` (or the project's preferred name);
- proper subset is irreflexive and transitive;
- `A ⊂ B ↔ A ⊆ B ∧ ∃ x, x ∈ B ∧ x ∉ A`, under the usual extensional membership assumptions.

**Severity: P2/P1 LEARNING/API BRIDGE.**

---

# Possible redundancy versus theorem minimality

Several law classes include facts derivable from membership semantics plus extensionality. For example, union commutativity/idempotence can be proved from `UnionMembership` and extensionality.

This is not mathematically wrong. It reflects a certification strategy: a backend registers the algebraic laws once and downstream proofs use them directly.

If the project wants a maximally Landau-like dependency hierarchy, it may be worth distinguishing primitive semantic laws from derived algebraic theorems, thereby reducing independent backend obligations.

**Severity: OPTIONAL DESIGN REFINEMENT.**

---

# Review 2 — concrete predicate and Mathlib/ZF backend registrations

## Files reviewed

- `LRA/Set/PredicateSet/Definition.lean`
- `LRA/Set/PredicateSet/Instances.lean`
- `LRA/Set/PredicateSet/Laws.lean`
- `LRA/Set/PredicateSet/Laws/Membership.lean`
- `LRA/Set/Interop/Mathlib/PredicateSet.lean`
- `LRA/Set/Interop/Mathlib/PredicateSet/Instances.lean`
- `LRA/Set/Interop/Mathlib/PredicateSet/Laws.lean`
- `LRA/Set/Interop/Mathlib/ZFSet.lean`
- `LRA/Set/Interop/Mathlib/ZFSet/Instances.lean`
- `LRA/Set/Interop/Mathlib/ZFSet/Laws.lean`

## In-house predicate-set backend

`PredicateSet Alpha := Alpha → Prop`, with membership given by predicate evaluation. This is the standard typed-set representation.

The backend correctly registers the full typed capability profile:

- union/intersection/difference/subset/empty/singletons;
- absolute complement and universal set;
- symmetric difference;
- separation;
- powerset one type level up;
- arbitrary indexed unions/intersections;
- countable unions/intersections;
- collection union/intersection.

All of these are genuinely available pointwise for predicate sets.

Its membership certificates correctly register extensionality and the expected pointwise semantics for every supported operation.

**Verdict: PASS.**

## Mathlib `Set Alpha` adapter

The Mathlib predicate-set adapter has the same mathematically correct capability profile as the in-house predicate backend. Its only special work is bridging Mathlib's order-based subset representation to the project's `HasSubset` class and registering the project's capability names.

The law file certifies the entire interface against Mathlib's established lemmas: union, intersection, distributivity, subset, difference, symmetric difference, complement, membership, separation, powerset, arbitrary/countable indexed operations, and collection operations.

This is an excellent realization test for the generic interface: a mature external set implementation satisfies the same contracts directly.

**Verdict: PASS.**

## Mathlib `ZFSet` adapter — capability honesty confirmed

The ZFSet backend deliberately registers only the capabilities available in an ordinary ZF/ZFC set universe:

- separation;
- powerset;
- symmetric difference derived from relative complements;
- union/intersection/difference and subset supplied by Mathlib;
- collection union/intersection;
- countable union/intersection.

It deliberately does **not** register:

- absolute universal set;
- absolute complement;
- arbitrary Lean-type-indexed union/intersection.

This is exactly the intended capability firewall.

### Countable unions do not require Choice here

The adapter constructs a countable union as the union of the range of the `Nat`-indexed family. Conceptually this is Replacement/range formation followed by ordinary Union. It is not a use of the Axiom of Choice because the family is already given as an actual function `Nat → ZFSet`; no witnesses must be selected.

The countable intersection similarly uses the range of the already-given family; the range is nonempty because `Nat` is inhabited, avoiding the empty-family universal-set issue.

**Choice classification: NO AC.**

The ZFSet law registrations correctly omit complement/universal-membership certificates while providing the laws for every supported operation.

**Verdict: PASS — BACKEND CAPABILITY BOUNDARY WORKS IN PRACTICE.**

---

# Review 3 — in-house ZFCSet, NBGSet, and TGSet registrations

## Files reviewed

- `LRA/Set/ZFCSet/Instances.lean`
- `LRA/Set/ZFCSet/Laws.lean`
- `LRA/Set/NBGSet/Instances.lean`
- `LRA/Set/NBGSet/Laws.lean`
- `LRA/Set/TGSet/Instances.lean`
- `LRA/Set/TGSet/Laws.lean`

## Shared set-sized capability profile

All three in-house single-sorted set carriers expose the same appropriate set-sized operations:

- binary union and intersection;
- subset;
- empty set;
- relative difference;
- symmetric difference;
- separation;
- powerset;
- union over a set/collection of sets;
- intersection over a set/collection of sets.

They do **not** expose:

- a universal set of all sets;
- absolute complement relative to such a universal set;
- arbitrary Lean-`Type`-indexed unions/intersections.

This is the correct capability profile for the set carriers themselves.

**Verdict: PASS.**

## NBG subtlety handled correctly

NBG has a universal **class**, but `NBGSet` is the carrier of sets, not classes. Therefore it would be mathematically wrong to register `HasUniversal NBGSet` merely because the theory has a universal class.

The current adapter correctly avoids that mistake.

**Verdict: PASS.**

## TG subtlety handled correctly

The Tarski–Grothendieck universe axiom says individual sets lie in sufficiently large Grothendieck universes; it does not make the total collection of all TG sets into one TG set.

Therefore the absence of `HasUniversal TGSet` and arbitrary meta-type indexed set union is still correct.

This backend registration remains sound even though the separate TG foundation review identified a defect in the *definition of Grothendieck universe itself* (missing indexed-union closure). That defect belongs to the foundation axiom/predicate layer, not to this interface registration.

**Verdict: PASS.**

## Law families

The in-house ZFC/NBG/TG law aggregates register the expected algebraic and membership families for the capabilities actually exposed:

- union;
- intersection;
- distributivity;
- subset;
- difference;
- symmetric difference;
- membership.

Notably, there is no complement law family in these aggregates, consistent with the absence of an absolute universal-set capability.

**Verdict: PASS.**

## Choice audit

The operation instances are `noncomputable` because many concrete sets are named by choosing witnesses from existence/uniqueness theorems. This is ordinary witness extraction from the foundational axioms and derived existence theorems; it should not be classified as a new family-wise use of the Axiom of Choice.

No additional Choice leak was identified in these registrations.

---

# Pre-measure-theory relevance

The set layer is already strong enough to support sigma algebras and ordinary measure-theory set manipulation across typed, Mathlib, ZFC, NBG, and TG-style backends.

The important remaining work is now theorem/API integration rather than basic set correctness:

- countable De Morgan theorems;
- sigma-algebra closure under countable intersections;
- generated sigma algebra/Borel bridges;
- subset-as-order named bridges;
- measurable preimage theory reusing the canonical relation/function preimage layer.

---

# Choice audit

No genuine Axiom-of-Choice use was identified in the shared set-interface laws or in the concrete backend registrations reviewed here.

In particular, noncomputably naming a unique/existing union, intersection, empty set, separated set, etc. is witness extraction, not a new family-wise selection principle.

---

# Final verdict through Review 3

| Dimension | Verdict |
|---|---|
| Capability architecture | **PASS** |
| Foundational backend distinctions | **PASS** |
| Extensionality/membership semantics | **PASS** |
| Indexed/countable families | **PASS** |
| Empty collection intersection handling | **PASS** |
| Union/intersection/distributivity laws | **PASS** |
| Difference/complement capability split | **PASS** |
| Covers/subcovers | **PASS** |
| PredicateSet backend | **PASS** |
| Mathlib `Set` backend | **PASS** |
| Mathlib `ZFSet` capability restrictions | **PASS** |
| In-house ZFC/NBG/TG capability restrictions | **PASS** |
| Choice leakage in reviewed adapters | **NONE** |
| Pre-measure-theory set foundation | **STRONG** |

---

# Next review chunk

The backend layer is now sufficiently checked. Continue outward through canonical function maps (products/projections/inclusions/quotients), then use the established function preimage calculus to specify the thin measurable-map layer and product-measurable-space dependencies without duplicating set semantics.
