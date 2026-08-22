# LRA Peano / Natural Numbers Review

## Scope

Focused review of the generic Peano-system layer and the beginning of the natural-number construction tree.

Project rule: `sorry` proof bodies are neutral. A theorem whose hypotheses do not imply its conclusion is not neutral.

---

# Files reviewed

- `LRA/NumberSystems/PeanoSystem/Definition.lean`
- `LRA/NumberSystems/PeanoSystem/Categoricity.lean`
- `LRA/NumberSystems/PeanoSystem/Recursion/Iterator.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/*` directory structure
- `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Carrier.lean`

---

# Core Peano record

The one-based Peano data are mathematically standard:

```text
one : Element
successor : Element -> Element
one is not a successor
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

# P0 — generic categoricity is false for arbitrary set backends

Current theorem `UniquenessOfPeanoSystemsUpToIsomorphism` is stated for arbitrary `Membership Element SetObject` backends, with no comprehension/adequacy hypothesis.

That is too general.

## Countermodel

Let `SetObject` represent only the universal subset, so every element belongs to every represented set.

Then the induction field is automatic for any distinguished point/successor satisfying the other two Peano clauses.

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

# Recommended architectural split

The cleanest architecture is:

```text
PeanoSignature
  one + successor

PeanoSuccessorLaws
  one not successor
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

The Landau construction deliberately postulates its carrier, one, and successor rather than deriving them from ZFC. This matches the intended foundational role.

Crucially, it uses `PredicateSet` for subsets, so the generic backend weakness does **not** undermine the intended Landau realization: predicate sets represent all Lean predicates.

**Verdict: PASS in foundational intent.**

The remaining Landau law/realization files should be checked to ensure the Peano instance is actually built over that full predicate backend.

---

# Natural-number construction tree

Current construction families located:

- Landau;
- Presburger;
- Von Neumann;
- WholeNumbers.

This is a useful separation of foundational viewpoints:

- Landau: axiomatic one-based naturals;
- Presburger: syntactic/arithmetic realization;
- Von Neumann: set-theoretic ordinals;
- WholeNumbers: zero-based arithmetic layer.

The next audit step is to verify that each realization proves the appropriate Peano/whole-number certificates with the correct base convention and that zero-based/one-based translations are explicit.

---

# Choice audit

No genuine family-wise Axiom-of-Choice dependency was identified here.

The recursion issue is logical strength / subset expressiveness, not Choice.

---

# Verdict

| Dimension | Verdict |
|---|---|
| one-based Peano axioms | **PASS** |
| backend-relative subset formulation | **VALID BUT MUST BE DOCUMENTED** |
| generic categoricity over arbitrary backend | **P0 FALSE** |
| generic iterator completeness over arbitrary backend | **P0 FALSE** |
| minimal iterator relation concept | **GOOD** |
| Landau axiomatic carrier | **PASS** |
| Landau use of PredicateSet | **CORRECT STRONG BACKEND** |
| Choice usage | **NONE** |

---

# Immediate repair order

1. separate full predicate induction from represented-subset induction;
2. restrict/strengthen categoricity accordingly;
3. restrict/strengthen iterator completeness/recursion existence accordingly;
4. add an explicit reachability theorem (`every element is one or an iterate of successor`) only under full induction;
5. audit Landau, Presburger, Von Neumann, and WholeNumbers realizations against the corrected interface;
6. preserve explicit one-based versus zero-based translation theorems.