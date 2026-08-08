import LRA.VolumeI.Set.Public.Interface

universe u v

namespace LRA.VolumeI.Set

/-!
Operations exposed directly by the generic set interface.

This file is the public, backend-independent operation vocabulary. Backend
files may have their own native operation layer, but ordinary set-theory
statements should refer to these names.
-/

/-- Empty set operation in a generic set interface. -/
abbrev Empty (interface : SetInterface.{u, v}) : interface.SetObject :=
  interface.empty

/-- Singleton operation in a generic set interface. -/
abbrev Singleton (interface : SetInterface.{u, v})
    (element : interface.Element) : interface.SetObject :=
  interface.singleton element

/-- Pair operation in a generic set interface. -/
abbrev Pair (interface : SetInterface.{u, v})
    (left right : interface.Element) : interface.SetObject :=
  interface.pair left right

/-- Binary union operation in a generic set interface. -/
abbrev Union (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : interface.SetObject :=
  interface.union left right

/-- Binary intersection operation in a generic set interface. -/
abbrev Intersection (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : interface.SetObject :=
  interface.intersection left right

/-- Subset relation in a generic set interface. -/
abbrev Subset (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : Prop :=
  interface.subset left right

/-- Empty sets have no members. -/
theorem EmptyMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element, ¬ interface.member element (Empty interface) := by
  sorry

/-- Membership in a singleton is equality with the chosen element. -/
theorem SingletonMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element chosen,
      interface.member element (Singleton interface chosen) ↔ element = chosen := by
  sorry

/-- Membership in a pair is equality with either chosen element. -/
theorem PairMembership
    (interface : SetInterface.{u, v}) (laws : SetInterfaceLaws interface) :
    ∀ element left right,
      interface.member element (Pair interface left right) ↔
        element = left ∨ element = right := by
  sorry

end LRA.VolumeI.Set
