# LRA Peano / Natural Numbers Review

## Scope

Focused review of the generic Peano-system layer, concrete natural-number realizations, and the parallel generic integer-structure layer.

Project rule: `sorry` proof bodies are neutral. A theorem whose hypotheses do not imply its conclusion is not neutral.

---

# Files reviewed

- `LRA/NumberSystems/PeanoSystem/Definition.lean`
- `LRA/NumberSystems/PeanoSystem/Categoricity.lean`
- `LRA/NumberSystems/PeanoSystem/Recursion/Iterator.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/*`
- `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Carrier.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/Presburger/Carrier.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/VonNeumann/Carrier.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/VonNeumann/WellFoundedness.lean`
- `LRA/NumberSystems/IntegerStructure/Definition.lean`
- `LRA/NumberSystems/IntegerStructure/Categoricity.lean`

---

# Core Peano record

The Peano data are mathematically standard once the distinguished point is read as a generic basepoint:

```text
basepoint (currently named `one`)
successor
basepoint is not a successor
successor is injective
subset induction
```

The important subtlety is that induction quantifies only over `SetObject`:

```text
forall subset : SetObject, ...
```

Thus its logical strength depends on which subsets the selected backend represents.

- With `Set Element` / `PredicateSet Element`, this is full predicate-style induction.
- With a restricted abstract set backend, this may be much weaker.

**Verdict: definition is valid as a backend-relative Peano concept, but downstream theorems must respect the backend-relative strength.**

---

# P0 — generic Peano categoricity is false for arbitrary set backends

Current theorem `UniquenessOfPeanoSystemsUpToIsomorphism` is stated for arbitrary `Membership Element SetObject` backends, with no comprehension/adequacy hypothesis.

That is too general.

## Countermodel

Let `SetObject` represent only the universal subset, so every element belongs to every represented set.

Then the induction field is automatic for any distinguished point/successor satisfying the other Peano clauses.

On carrier `Nat`, take distinguished point `0` and compare

```text
s1(n) = n + 1
s2(n) = n + 2.
```

Both successors are injective and never map to `0`. Both satisfy induction over the trivial universal-only backend.

But the pointed successor systems are not isomorphic:

- `s1` has one successor chain generated from `0`;
- `s2` has two chains, the even and odd numbers, and the odd chain is unreachable from `0`.

Therefore the generic categoricity theorem is false under its present hypotheses.

## Repair

Either:

1. state categoricity only for a full predicate backend such as `PredicateSet Element` / `Set Element`; or
2. add an adequacy/comprehension hypothesis saying every predicate needed by induction is represented as a `SetObject`; or
3. formulate Peano induction directly over all predicates

```text
forall P : Element -> Prop, ...
```

and separately provide the set-theoretic presentation as a bridge.

**Severity: P0 FALSE GENERIC THEOREM.**

---

# P0 — generic iterator completeness has the same hidden assumption

`MinimalIteratorRelation` is a good impredicative specification of the least recursion relation:

```text
(element,value) belongs iff every iterator relation contains it.
```

But `MinimalIteratorRelationComplete` claims

```text
forall element, exists value, MinimalIteratorRelation ... element value.
```

For the same weak-backend model with successor `n -> n+2`, no iterator relation is forced to assign a value to odd elements, because those elements are unreachable from the distinguished point.

Hence the minimal iterator relation has no value at those elements.

So recursion completeness/existence requires exactly the same reachability/full-induction strength missing from the generic Peano interface.

**Severity: P0 FALSE GENERIC THEOREM.**

Determinism of the minimal relation is conceptually separate and may remain valid; existence is the failing direction.

---

# Basepoint naming: `one` is not actually one-based

The generic Peano field is named

```text
one : Element
```

and the documentation often describes the system as one-based.

But the concrete Presburger and Von Neumann realizations both map their natural-number **zero** into this field.

That is mathematically fine: Peano's successor axioms can be based at either 0 or 1 after a shift. But the current name/documentation suggests a semantic commitment the generic structure does not maintain.

Recommended choices:

- rename the field to `base` / `initial` / `distinguished`; or
- keep separate `ZeroBasedPeanoSystem` and `OneBasedPeanoSystem` façades over a common basepoint-level core;
- add explicit shift/isomorphism theorems between the two conventions.

**Severity: P1 semantic/naming ambiguity, not a mathematical inconsistency by itself.**

---

# Recommended architectural split

The cleanest architecture is:

```text
PeanoSignature
  base + successor

PeanoSuccessorLaws
  base not successor
  successor injective

FullPeanoInduction
  forall P : Element -> Prop, ...
```

and then a set-backend bridge:

```text
RepresentedSubsetInduction SetObject
```

with a theorem saying full predicate induction implies represented-subset induction for every backend.

If a backend has comprehension/representation of every predicate, prove the converse there.

This makes the exact logical strength visible instead of hiding it inside an arbitrary `Membership` parameter.

---

# Landau construction

The Landau construction deliberately postulates its carrier, distinguished one, and successor rather than deriving them from ZFC. This matches the intended foundational role.

Crucially, it uses `PredicateSet` for subsets, so the generic backend weakness does **not** undermine the intended Landau realization: predicate sets represent all Lean predicates.

**Verdict: PASS in foundational intent.**

---

# Presburger construction

The concrete Presburger carrier is a fresh inductive type:

```text
zero
succ n
```

with its own structurally recursive `<` relation.

This is a good independent realization rather than an alias of Lean's `Nat`.

It also uses `PredicateSet`, so its induction theorem has full predicate strength.

Kernel-generated no-confusion, successor injectivity, and recursion/induction make the intended Peano facts mathematically secure.

**Verdict: PASS as a concrete strong-backend realization.**

The only architectural issue is the zero-to-`PeanoSystem.one` naming mismatch described above.

---

# Von Neumann construction

The von Neumann construction has the correct foundational shape:

```text
Infinity witness
-> successor x = x union {x}
-> omega = intersection/minimal inductive subset via Separation
-> NaturalElement = members of omega.
```

It correctly uses the subtype of members of `omega`, not all ZFC sets, as the natural-number carrier.

The selected Infinity witness is obtained with `Classical.choose` from the already-assumed Infinity axiom. This is single-witness extraction, not a new Axiom-of-Choice dependency.

The Peano realization again uses zero as the generic basepoint.

## Backend adequacy note

Its induction theorem ranges over `ZFCSet` subsets. Because this project's Separation schema is higher-order over arbitrary Lean predicates, the backend should in principle be able to represent arbitrary predicates restricted to `omega`.

However, that adequacy/comprehension bridge is not part of `PeanoSystem` itself.

Recommended explicit theorem:

```text
For every P : NaturalElement -> Prop,
there exists A : ZFCSet such that
  forall n : NaturalElement, n ∈ A <-> P n.
```

Then derive full predicate induction for `VonNeumannPeanoSystem` and only afterward invoke recursion/categoricity.

**Verdict: PASS construction idea; P1 explicit adequacy bridge needed.**

---

# Generic IntegerStructure

`IntegerStructure` is a clean two-sided analogue of Peano structure:

```text
zero, one, negativeOne
successor, predecessor
P(S x) = x
S(P x) = x
S 0 = 1
P 0 = -1
successor aperiodic from zero
two-sided induction
```

This is a mathematically meaningful axiomatization of a single bi-infinite successor chain when induction has full predicate strength.

The same backend-relative issue remains because induction quantifies only over `SetObject`.

---

# P0 — generic IntegerStructure categoricity is false for arbitrary backends

Current `UniquenessOfIntegerStructuresUpToIsomorphism` is stated for arbitrary membership backends.

## Countermodel

Take carrier

```text
Int × Bool
```

with

```text
S(n,b) = (n+1,b)
P(n,b) = (n-1,b)
zero = (0,false)
one = (1,false)
negativeOne = (-1,false).
```

Successor/predecessor are mutual inverses, the named neighbors are correct, and positive successor iterates of zero never return to zero.

With a backend representing only the universal subset, two-sided induction is automatic.

But this structure has two disconnected integer chains (`Bool=false` and `Bool=true`) and is not isomorphic as a pointed successor/predecessor structure to ordinary `Int`.

Therefore generic categoricity fails for the same reason as generic Peano categoricity.

**Severity: P0 FALSE GENERIC THEOREM.**

Repair exactly as for Peano: require full predicate induction or an explicit backend adequacy/comprehension certificate.

---

# Natural-number construction tree

Current construction families located:

- Landau;
- Presburger;
- Von Neumann;
- WholeNumbers.

This is a useful separation of foundational viewpoints:

- Landau: axiomatic naturals;
- Presburger: native inductive/syntactic arithmetic realization;
- Von Neumann: ZFC set-theoretic naturals;
- WholeNumbers: zero-based arithmetic layer.

The remaining audit should verify the arithmetic/certificate registrations and explicit convention bridges among these constructions.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified here.

- choosing an Infinity witness is witness extraction from the Infinity axiom;
- the recursion/categoricity problem is logical strength / subset expressiveness, not Choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| Peano successor/base axioms | **PASS** |
| backend-relative subset formulation | **VALID BUT MUST BE DOCUMENTED** |
| generic Peano categoricity | **P0 FALSE FOR ARBITRARY BACKENDS** |
| generic iterator completeness | **P0 FALSE FOR ARBITRARY BACKENDS** |
| minimal iterator relation concept | **GOOD** |
| generic field name `one` | **P1 MISLEADING ACROSS ZERO-BASED MODELS** |
| Landau construction | **PASS / STRONG PredicateSet BACKEND** |
| Presburger construction | **PASS / STRONG PredicateSet BACKEND** |
| Von Neumann carrier | **PASS** |
| Von Neumann full-predicate adequacy bridge | **P1 SHOULD BE EXPLICIT** |
| IntegerStructure axioms | **PASS UNDER FULL INDUCTION** |
| generic IntegerStructure categoricity | **P0 FALSE FOR ARBITRARY BACKENDS** |
| Choice usage | **NONE NEW** |

---

# Immediate repair order

1. separate full predicate induction from represented-subset induction;
2. restrict/strengthen Peano categoricity;
3. restrict/strengthen iterator completeness/recursion existence;
4. restrict/strengthen IntegerStructure categoricity;
5. rename the generic Peano basepoint or formalize explicit zero-/one-based façades;
6. add an explicit ZFCSet comprehension/adequacy bridge for predicates on `NaturalElement`;
7. add reachability theorems only under full induction;
8. continue through WholeNumbers and arithmetic certificate registrations;
9. then verify explicit natural-to-integer embedding and universal-property statements.