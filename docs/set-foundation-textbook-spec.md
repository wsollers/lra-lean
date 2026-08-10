# Set Foundation Textbook Specification

This document specifies a proposed refactor of the early Volume I set-theory
Lean surface. The goal is to make the first foundational set statements read as
close as possible to handwritten textbook mathematics, while preserving the
existing generic set-operation interfaces for backend reuse.

No Lean source changes are made by this document. It is a concrete design target
for review before migration.

## Problem

The current Volume I Set code uses `SetInterface` as the main carrier for both
foundational statements and backend-generic operation laws. That interface is
useful, but it is not the right first language for textbook set theory.

The current interface is two-sorted:

```lean
structure PublicSetOperations where
  SetObject : Type u
  Element : Type v
  member : Element -> SetObject -> Prop
  empty : SetObject
  singleton : Element -> SetObject
  pair : Element -> Element -> SetObject
  union : SetObject -> SetObject -> SetObject
  intersection : SetObject -> SetObject -> SetObject
  subset : SetObject -> SetObject -> Prop
```

This is excellent for typed set backends such as predicate sets over a carrier
`Alpha`. It is not the ontology of ZFC-style foundations, where every element of
a set is itself a set.

The deeper issue is that `pair` is currently data:

```lean
pair : Element -> Element -> SetObject
```

Once this field exists, the existence of a pair-set output is already built into
the interface. A theorem such as

```lean
theorem PairSetExist
    (interface : SetInterface) (laws : SetInterfaceLaws interface)
    (left right : interface.Element) :
    exists pairSet : interface.SetObject,
      IsPairSet interface left right pairSet := ...
```

is then an operation-soundness lemma, not the Axiom of Pairing. It can be proved
by choosing `interface.pair left right` and applying `laws.pairMembership`.
That is a legitimate backend theorem, but it is not the textbook statement:

```text
for all x1 and x2, there exists a unique set P such that
for all w, w in P iff w = x1 or w = x2.
```

For the opening foundations, the Lean should make the same dependency visible
as a handwritten proof:

1. Pairing gives existence.
2. Extensionality gives uniqueness.
3. Only afterward may we introduce a convenient operation or notation for the
   chosen pair set.

## Design Principle

Split the Set code into two voices.

`Foundation` is the textbook voice. It should be single-sorted, predicate-first,
and axiom-shaped.

`Operations`, `Public`, and `Implementations` are the backend/API voice. They
may remain typed, operation-first, and optimized for reuse across concrete
backends.

The Foundation layer should not start with operations like `empty` or `pair`.
It should start with a universe of sets, membership, named predicates, and named
axiom propositions.

## Volume I Source Audit

A read-only scan of the active `lra-volume-i` set-book TeX source supports this
split. The scan counted theorem-like result blocks
(`axiom`, `theorem`, `proposition`, `lemma`, and `corollary`) and separately
counted definitions. A block was flagged as typed or specific-universe when it
explicitly mentioned named number systems such as `\mathbb{R}`, `\mathbb{Q}`,
`\mathbb{N}`, or prose such as "real-valued" or "subset of the reals."

The relevant early chapters are overwhelmingly generic set/carrier statements:

```text
Chapter              Result blocks  Specific-universe results  Definitions  Specific-universe definitions
set-theory                     36                         0           26                              0
relations                       8                         0           39                              0
functions                      16                         0           27                              0
orderings                      18                         0           38                              0
functions-and-order            19                         0            6                              0
lattices                        1                         0            4                              0
cardinality                     5                         3            5                              2
```

The only specific-universe result blocks found in the set book were in
cardinality:

```text
thm:Q-countable
thm:countable-union
thm:R-uncountable
```

The `thm:countable-union` hit is specific because it uses a
`\mathbb{N}`-indexed family, not because its members are typed as a subset of
the reals. The genuinely named-carrier results are `\mathbb{Q}` countability
and `\mathbb{R}` uncountability.

Conclusion: Volume I's early set, relation, function, order, and lattice
material is a good fit for an Enderton-style single-sorted default. Typed
predicate sets such as `Set Real` should enter later, when theorems are
specifically about number-system carriers, subsets of `\mathbb{R}`, topology,
boundedness, supremum/infimum in an ordered field, and similar analytic
structure.

## Proposed Module Layout

The proposed replacement for the current proof-obligation-oriented
`Set/Foundation/{Predicates,Existence,Uniqueness,Foundational}.lean` layout is:

```text
LRA/VolumeI/Set/Foundation/
  Universe.lean       -- one type of sets and membership notation
  Definitions.lean    -- ExistsUnique, IsEmptySet, IsPairSet, IsUnionOf, ...
  Axioms.lean         -- ExtensionalityAxiom, EmptySetAxiom, PairingAxiom, ...
  EmptySet.lean       -- empty-set existence, uniqueness, chosen witness
  Pairing.lean        -- pair-set existence, uniqueness, chosen witness
  Union.lean          -- later: union axiom and derived operation
  PowerSet.lean       -- later: power-set axiom and derived operation
  Separation.lean     -- later: separation schema shape
```

The existing generic layers remain downstream:

```text
LRA/VolumeI/Set/Public/
LRA/VolumeI/Set/Operations/
LRA/VolumeI/Set/Implementations/
```

Those layers should eventually receive bridge lemmas saying that chosen
foundation witnesses satisfy the operation interfaces, not the other way
around.

## Proposed Foundation Core

### Universe

```lean
namespace LRA.VolumeI.Set.Foundation

universe u

/-- A universe of textbook sets: one type of set-objects and one membership
relation. There is no separate `Element` type; in this layer every element is
itself a set. -/
structure Universe where
  SetObject : Type u
  member : SetObject -> SetObject -> Prop

namespace Universe

/-- Textbook membership notation inside a chosen universe of sets. -/
instance (universe : Universe.{u}) :
    Membership universe.SetObject universe.SetObject where
  mem setObject element := universe.member element setObject

end Universe

end LRA.VolumeI.Set.Foundation
```

This makes `w in P` in Lean notation (`w ∈ P`) mean exactly
`universe.member w P`.

### Definitions

```lean
namespace LRA.VolumeI.Set.Foundation

universe u

variable (universe : Universe.{u})

/-- `emptySet` is empty exactly when it has no members. -/
def IsEmptySet (emptySet : universe.SetObject) : Prop :=
  forall w : universe.SetObject, w ∉ emptySet

/-- `pairSet` is the pair set of `x1` and `x2` exactly when its members are
precisely `x1` and `x2`. -/
def IsPairSet
    (x1 x2 pairSet : universe.SetObject) : Prop :=
  forall w : universe.SetObject,
    w ∈ pairSet <-> w = x1 \/ w = x2

end LRA.VolumeI.Set.Foundation
```

These are predicates, not operations. They describe what it means for an object
to be an empty set or a pair set.

The Foundation layer also defines its own `ExistsUnique` predicate:

```lean
def ExistsUnique {Carrier : Type u} (predicate : Carrier -> Prop) : Prop :=
  exists witness, predicate witness /\ forall other, predicate other -> other = witness
```

This has the same witness-and-uniqueness shape as Lean's `∃!` notation in
Mathlib-backed modules, but it avoids importing Mathlib into the textbook
foundation layer.

### Axioms

```lean
namespace LRA.VolumeI.Set.Foundation

universe u

variable (universe : Universe.{u})

/-- Extensionality: sets with the same members are equal. -/
def ExtensionalityAxiom : Prop :=
  forall left right : universe.SetObject,
    (forall w : universe.SetObject, w ∈ left <-> w ∈ right) ->
      left = right

/-- Empty set axiom: there exists a set with no members. -/
def EmptySetAxiom : Prop :=
  exists emptySet : universe.SetObject,
    IsEmptySet universe emptySet

/-- Pairing axiom: for any two sets, there exists a set whose members are
exactly those two sets. -/
def PairingAxiom : Prop :=
  forall x1 x2 : universe.SetObject,
    exists pairSet : universe.SetObject,
      IsPairSet universe x1 x2 pairSet

end LRA.VolumeI.Set.Foundation
```

The important feature is that these are ordinary `Prop`s. A theorem can list
exactly the axioms it uses:

```lean
(extensionality : ExtensionalityAxiom universe)
(pairing : PairingAxiom universe)
```

This mirrors textbook prose such as "by Pairing" and "by Extensionality."

## Empty Set Specification

This section gives the concrete replacement shape for the current empty-set
predicate, existence theorem, uniqueness theorem, and exists-unique theorem.

### `IsEmptySet`

```lean
/-- `emptySet` is empty exactly when it has no members. -/
def IsEmptySet
    (universe : Universe.{u})
    (emptySet : universe.SetObject) : Prop :=
  forall w : universe.SetObject, w ∉ emptySet
```

This replaces raw repeated clauses such as:

```lean
forall element, not interface.member element empty
```

in foundation-facing statements.

### `EmptySetExist`

```lean
/-- There exists an empty set. -/
theorem EmptySetExist
    (emptySetAxiom : EmptySetAxiom universe) :
    exists emptySet : universe.SetObject,
      IsEmptySet universe emptySet := by
  exact emptySetAxiom
```

This theorem is intentionally simple. Its value is not proof complexity; its
value is naming the textbook consequence in the public theorem vocabulary.

### `EmptySetUnique`

```lean
/-- Any two empty sets are equal. -/
theorem EmptySetUnique
    (extensionality : ExtensionalityAxiom universe)
    {left right : universe.SetObject}
    (leftEmpty : IsEmptySet universe left)
    (rightEmpty : IsEmptySet universe right) :
    left = right := by
  apply extensionality
  intro w
  constructor
  · intro wInLeft
    exact False.elim (leftEmpty w wInLeft)
  · intro wInRight
    exact False.elim (rightEmpty w wInRight)
```

This is the same proof idea as the current proved theorem, but with the generic
interface removed from the statement. It reads as:

1. Use Extensionality.
2. Fix an arbitrary `w`.
3. Membership in either empty set is impossible.

### `EmptySetExistsUnique`

Foundation-facing exists-and-unique theorems should use the Foundation-local
`ExistsUnique` predicate. This matches the source notation's logical shape
without importing Mathlib merely to obtain `∃!` notation.

```lean
/-- There exists a unique empty set. -/
theorem EmptySetExistsUnique
    (extensionality : ExtensionalityAxiom universe)
    (emptySetAxiom : EmptySetAxiom universe) :
    ExistsUnique (fun emptySet : universe.SetObject =>
      IsEmptySet universe emptySet) := by
  rcases emptySetAxiom with ⟨emptySet, emptySetIsEmpty⟩
  refine ⟨emptySet, emptySetIsEmpty, ?_⟩
  intro otherEmptySet otherEmptySetIsEmpty
  exact EmptySetUnique universe extensionality
    otherEmptySetIsEmpty emptySetIsEmpty
```

The uniqueness direction in this witness-based `ExistsUnique` asks for:

```lean
forall otherEmptySet,
  IsEmptySet universe otherEmptySet -> otherEmptySet = emptySet
```

That is why the final call puts `otherEmptySetIsEmpty` before
`emptySetIsEmpty`.

### Chosen Empty Set Operation

Only after existence has been stated should we introduce a convenient chosen
witness.

```lean
/-- The empty set chosen from the empty set axiom. -/
noncomputable def emptySet
    (emptySetAxiom : EmptySetAxiom universe) :
    universe.SetObject :=
  Classical.choose emptySetAxiom

/-- The chosen empty set is empty. -/
theorem emptySet_isEmpty
    (emptySetAxiom : EmptySetAxiom universe) :
    IsEmptySet universe (emptySet universe emptySetAxiom) := by
  exact Classical.choose_spec emptySetAxiom

/-- Every empty set is equal to the chosen empty set. -/
theorem emptySet_unique
    (extensionality : ExtensionalityAxiom universe)
    (emptySetAxiom : EmptySetAxiom universe)
    {otherEmptySet : universe.SetObject}
    (otherEmptySetIsEmpty : IsEmptySet universe otherEmptySet) :
    otherEmptySet = emptySet universe emptySetAxiom := by
  exact EmptySetUnique universe extensionality
    otherEmptySetIsEmpty
    (emptySet_isEmpty universe emptySetAxiom)
```

This is the correct direction of dependency:

```text
axiom -> existence theorem -> chosen operation -> operation law
```

not:

```text
operation field -> existence theorem
```

## Pair Set Specification

This section gives the concrete replacement shape for the current pair-set
predicate, existence theorem, uniqueness theorem, and exists-unique theorem.

### `IsPairSet`

```lean
/-- `pairSet` is the pair set of `x1` and `x2` exactly when its members are
precisely `x1` and `x2`. -/
def IsPairSet
    (universe : Universe.{u})
    (x1 x2 pairSet : universe.SetObject) : Prop :=
  forall w : universe.SetObject,
    w ∈ pairSet <-> w = x1 \/ w = x2
```

This is the foundation-facing predicate corresponding to the source formula:

```text
forall w, w in P iff (w = x1 or w = x2)
```

### `PairSetExist`

```lean
/-- For any two sets, there exists a pair set containing exactly them. -/
theorem PairSetExist
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    exists pairSet : universe.SetObject,
      IsPairSet universe x1 x2 pairSet := by
  exact pairing x1 x2
```

Again, the proof is intentionally direct. The theorem is not unpacking an
operation field; it is applying the Axiom of Pairing.

### `PairSetUnique`

```lean
/-- Any two pair sets for the same two sets are equal. -/
theorem PairSetUnique
    (extensionality : ExtensionalityAxiom universe)
    {x1 x2 leftPair rightPair : universe.SetObject}
    (leftPairIsPairSet : IsPairSet universe x1 x2 leftPair)
    (rightPairIsPairSet : IsPairSet universe x1 x2 rightPair) :
    leftPair = rightPair := by
  apply extensionality
  intro w
  exact Iff.trans (leftPairIsPairSet w) (Iff.symm (rightPairIsPairSet w))
```

This proof is the textbook proof in one line after Extensionality:

```text
w is in the first pair set iff w = x1 or w = x2,
and that is iff w is in the second pair set.
```

### `PairSetExistsUnique`

For the specific LaTeX theorem `thm:pairing-output-exists-unique`, prefer a
source-aligned name if possible:

```lean
PairingOutputExistsUnique
```

An alias named `PairSetExistsUnique` may also be kept if that is the established
project naming pattern.

```lean
/-- For any two sets, there exists a unique pair set whose members are exactly
those two sets.

This is the source theorem `thm:pairing-output-exists-unique`:
`forall x1 forall x2 exists! P forall w,
  w in P iff (w = x1 or w = x2)`. -/
theorem PairingOutputExistsUnique
    (extensionality : ExtensionalityAxiom universe)
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    ExistsUnique (fun pairSet : universe.SetObject =>
      IsPairSet universe x1 x2 pairSet) := by
  rcases pairing x1 x2 with ⟨pairSet, pairSetIsPairSet⟩
  refine ⟨pairSet, pairSetIsPairSet, ?_⟩
  intro otherPairSet otherPairSetIsPairSet
  exact PairSetUnique universe extensionality
    otherPairSetIsPairSet pairSetIsPairSet
```

This proof has exactly the intended dependency structure:

1. Pairing gives a witness `pairSet`.
2. Extensionality proves any other witness is equal to it.

### Chosen Pair Set Operation

After the axiom-backed theorem exists, define a convenient operation by choice.

```lean
/-- The pair set of `x1` and `x2`, chosen from the Axiom of Pairing. -/
noncomputable def pairSet
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    universe.SetObject :=
  Classical.choose (pairing x1 x2)

/-- The chosen pair set has exactly the intended members. -/
theorem pairSet_isPairSet
    (pairing : PairingAxiom universe)
    (x1 x2 : universe.SetObject) :
    IsPairSet universe x1 x2 (pairSet universe pairing x1 x2) := by
  exact Classical.choose_spec (pairing x1 x2)

/-- Every pair set for `x1` and `x2` is equal to the chosen pair set. -/
theorem pairSet_unique
    (extensionality : ExtensionalityAxiom universe)
    (pairing : PairingAxiom universe)
    {x1 x2 otherPairSet : universe.SetObject}
    (otherPairSetIsPairSet : IsPairSet universe x1 x2 otherPairSet) :
    otherPairSet = pairSet universe pairing x1 x2 := by
  exact PairSetUnique universe extensionality
    otherPairSetIsPairSet
    (pairSet_isPairSet universe pairing x1 x2)
```

This gives learners the natural mathematical move:

```text
By Pairing, let {x1, x2} be the pair set of x1 and x2.
```

without making `{x1, x2}` primitive.

## Naming Specification

Use PascalCase for public, source-facing declarations: named predicates,
axioms, and textbook theorems.

Recommended theorem names:

```text
IsEmptySet
EmptySetAxiom
EmptySetExist
EmptySetUnique
EmptySetExistsUnique

IsPairSet
PairingAxiom
PairSetExist
PairSetUnique
PairingOutputExistsUnique
```

Use lower camel case for chosen witnesses and underscore-suffixed facts about
those chosen witnesses. These names intentionally read as operation-level
conveniences, not as source-facing theorem vocabulary.

```text
emptySet
emptySet_isEmpty
emptySet_unique

pairSet
pairSet_isPairSet
pairSet_unique
```

The naming boundary is part of the abstraction boundary:

```text
Foundation theorem names describe axioms and textbook propositions.
Operation names describe chosen witnesses derived from those axioms.
```

## Migration Plan

1. Add `Set/Foundation/Universe.lean`, `Definitions.lean`, and `Axioms.lean`.
2. Add `Set/Foundation/EmptySet.lean` with the exact theorem shapes above.
3. Add `Set/Foundation/Pairing.lean` with the exact theorem shapes above.
4. Update `LRA/VolumeI/Set/Foundation.lean` to import the new topic modules.
5. Fold the current `Set/Laws/Extensionality.lean` overlap into the new
   foundation layer. Extensionality should be a named foundation axiom and
   theorem input, not a duplicate operation-law restatement. Keep
   `Set/Laws/Membership.lean` in the operations layer for now because its
   union, intersection, and subset facts are operation-interface scaffolding;
   revisit it when `Union.lean`, `PowerSet.lean`, and later foundation files
   introduce axiom-backed versions of those topics.
6. Leave existing `Set/Public`, `Set/Operations`, and `Set/Implementations`
   unchanged initially.
7. Add bridge lemmas later from chosen foundation operations into
   `PublicSetOperations`, if a backend-generic interface needs to be built from
   axioms.
8. After downstream imports are stable, retire or quarantine the older
   `Predicates/Existence/Uniqueness/Foundational` split.

## Non-Goals

This proposal does not complete unrelated proof bodies.

This proposal does not delete the generic typed set interface.

This proposal does not replace the existing ZFC object-language theory under
`Implementations/ZFC/Theory.lean`. That file formalizes formulas and theories
about ZFC. The proposed Foundation layer is the ambient textbook theory used to
write ordinary set-theoretic proofs.
