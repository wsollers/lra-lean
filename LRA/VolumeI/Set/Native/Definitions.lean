import LRA.VolumeI.Set.Primitives

/-!
Predicates used by the native textbook set theory layer.
-/

namespace LRA.VolumeI.Set

/-- A property has exactly one set satisfying it. -/
def ExistsAndUnique (property : Set -> Prop) : Prop :=
  ∃ witness : Set,
    property witness ∧
    ∀ other : Set, property other -> other = witness

/-- A set is empty exactly when it has no members. -/
def IsEmptySet (A : Set) : Prop :=
  ∀ x : Set, x ∉ A

/-- A set is the pair set of `x1` and `x2` exactly when those are its only
members. -/
def IsPairSet (x1 x2 P : Set) : Prop :=
  ∀ w : Set, w ∈ P ↔ w = x1 ∨ w = x2

end LRA.VolumeI.Set
