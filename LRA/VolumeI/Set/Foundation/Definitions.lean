import LRA.VolumeI.Set.Foundation.Universe

universe u

namespace LRA.VolumeI.Set.Foundation

/-!
Foundation-facing predicates for named set constructions.

These definitions describe what an object is. They do not choose operations or
package backend interfaces.
-/

/-- Unique existence for a predicate, in the witness-and-uniqueness form used by
Lean's standard `∃!` notation in Mathlib-backed modules. -/
def ExistsUnique {Carrier : Type u} (predicate : Carrier → Prop) : Prop :=
  ∃ witness, predicate witness ∧ ∀ other, predicate other → other = witness

/-- `emptySet` is empty exactly when it has no members. -/
def IsEmptySet
    (setUniverse : Universe.{u})
    (emptySet : setUniverse.SetObject) : Prop :=
  ∀ w : setUniverse.SetObject, w ∉ emptySet

/-- `pairSet` is the pair set of `x1` and `x2` exactly when its members are
precisely `x1` and `x2`. -/
def IsPairSet
    (setUniverse : Universe.{u})
    (x1 x2 pairSet : setUniverse.SetObject) : Prop :=
  ∀ w : setUniverse.SetObject,
    w ∈ pairSet ↔ w = x1 ∨ w = x2

end LRA.VolumeI.Set.Foundation
