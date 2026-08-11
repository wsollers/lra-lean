import LRA.VolumeI.Set.Enderton.Primitives
import LRA.VolumeI.Identity.Model.Theory

/-!
Predicates used by the Enderton textbook set theory layer.
-/

namespace LRA.VolumeI.Set.Enderton

/--
`ExistsAndUnique property` means that some set satisfies `property`, and every
other set satisfying `property` is equal to that witness.

This reuses `LRA.VolumeI.Identity.ExistsAndUnique`, specialized to `Set`,
rather than restating the same idea with a fresh definition: the project has
one canonical "exists and is unique" combinator, and every chapter that needs
it (here, `Functions`, `Relations`) should cite the same one.

Logical form:

```lean
(∃ x : Set, property x) ∧ (∀ left right : Set, property left → property right → left = right)
```
-/
abbrev ExistsAndUnique (property : Set -> Prop) : Prop :=
  LRA.VolumeI.Identity.ExistsAndUnique property

/-- A set is empty exactly when it has no members. -/
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

/-- A set is the pair set of `x1` and `x2` exactly when those are its only
members. -/
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

/-- A set is the singleton set of `x` exactly when `x` is its only member.

A singleton is the pair set of `x` with itself: `IsSingletonSet x S ↔
IsPairSet x x S`. This is stated as its own named predicate because "the
singleton of `x`" is a standalone textbook notion, even though nothing new is
being axiomatized for it. -/
def IsSingletonSet (x S : Set) : Prop :=
  ∀ w : Set, w ∈ S ↔ w = x

/-- `U` is the union over the set of sets `A`: `U = ⋃ A`. Its members are
exactly the members of members of `A`. -/
def IsUnionOf (A U : Set) : Prop :=
  ∀ x : Set, x ∈ U ↔ ∃ B : Set, B ∈ A ∧ x ∈ B

/-- `P` is the power set of `A`: its members are exactly the subsets of `A`. -/
def IsPowerSetOf (A P : Set) : Prop :=
  ∀ x : Set, x ∈ P ↔ ∀ y : Set, y ∈ x → y ∈ A

/-- `B` is the subset of `A` separated by `property`: its members are exactly
the members of `A` that satisfy `property`. -/
def IsSeparatedSubset (A : Set) (property : Set -> Prop) (B : Set) : Prop :=
  ∀ x : Set, x ∈ B ↔ x ∈ A ∧ property x

/-- `D` is the relative complement of `B` in `A` (`A \ B`): its members are
exactly the members of `A` that are not members of `B`.

Unlike an absolute complement, this is unproblematic for Enderton sets: it is
exactly `IsSeparatedSubset A (fun x => x ∉ B) D`, restricted to the members of
a fixed set `A`, not "everything that is not in `B`" (which would need a
universal set, and ZFC has none). See
`LRA.VolumeI.Set.LRASet.Operations.Complement`'s docstring for the contrast --
that operation exists only because a typed predicate set has an ambient
carrier type to complement against; this one exists without needing one. -/
def IsRelativeComplementOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∉ B

/-- `D` is an intersection of `A` and `B`: its members are exactly the members
of `A` that are also members of `B`.

Like `IsRelativeComplementOf`, this needs no universal set: it is exactly
`IsSeparatedSubset A (fun x => x ∈ B) D`. -/
def IsIntersectionOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ x ∈ A ∧ x ∈ B

/-- `D` is the symmetric difference of `A` and `B`: its members are exactly
the sets belonging to one of `A`, `B` but not the other.

Like binary union, this is not its own axiom, and like
`IsRelativeComplementOf` it needs no universal set: the witness
`(A \ B) ∪ (B \ A)` is built from relative complement (Separation) and
binary union (Union + Pairing). See `Theorems/SymmetricDifference.lean`. -/
def IsSymmetricDifferenceOf (A B D : Set) : Prop :=
  ∀ x : Set, x ∈ D ↔ (x ∈ A ∧ x ∉ B) ∨ (x ∈ B ∧ x ∉ A)

/-- `A` is a subset of `B`: every member of `A` is a member of `B`.

Not derived from an axiom -- this is a plain relation on `Set`, stated once
here so `Enderton.Set` can be registered against `HasSubset` the same way
`LRASet` was. -/
def Subset (A B : Set) : Prop :=
  ∀ x : Set, x ∈ A → x ∈ B

/-- `relation` assigns at most one output to each member of `A`: it is
functional on `A`. This is the side condition Replacement needs before its
conclusion is available. -/
def IsFunctionalOn (A : Set) (relation : Set -> Set -> Prop) : Prop :=
  ∀ x : Set, x ∈ A →
    ∃ y : Set,
      relation x y ∧
      ∀ other : Set, relation x other → other = y

/-- `B` is the replacement image of `A` under `relation`: its members are
exactly the outputs `relation` assigns to members of `A`. -/
def IsReplacementImageOf
    (A : Set) (relation : Set -> Set -> Prop) (B : Set) : Prop :=
  ∀ y : Set, y ∈ B ↔ ∃ x : Set, x ∈ A ∧ relation x y

/-- `successor` is the successor of `x`: its members are exactly the members
of `x` together with `x` itself. -/
def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

/-- `A` is an inductive set: it contains an empty set, and it contains a
successor of each of its members. This is exactly the property the Axiom of
Infinity asserts some set has. -/
def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

/-- `x` is a Foundation witness for `A`: `x` is a member of `A` disjoint from
`A`, i.e. no member of `x` is a member of `A`. -/
def IsFoundationWitness (A x : Set) : Prop :=
  x ∈ A ∧ ∀ y : Set, y ∈ x → y ∉ A

/-- `choiceSet` is a choice set for the pairwise-disjoint family `A`: it
contains exactly one member of each set belonging to `A`. -/
def IsChoiceSetFor (A choiceSet : Set) : Prop :=
  ∀ B : Set, B ∈ A →
    ∃ x : Set,
      (x ∈ B ∧ x ∈ choiceSet) ∧
      ∀ other : Set, (other ∈ B ∧ other ∈ choiceSet) → other = x

end LRA.VolumeI.Set.Enderton
