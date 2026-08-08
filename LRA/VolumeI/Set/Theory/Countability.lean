import LRA.VolumeI.Set.Algebra.CollectionAlgebra
import LRA.VolumeI.Set.Laws.Indexed

universe u v

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Generic countability statements for set interfaces.

`IsCountableSet` means finite-or-countably-infinite: the set admits a
surjection from `Nat` onto its members. `IsCountablyInfiniteSet` records an
enumeration that is both onto the set and one-to-one, and is the intended
nontrivial reading in the theorem that every infinite set contains a countable
subset.
-/

/-- A generic set is finite when its members are covered by a finite list. -/
def IsFiniteSet
    (interface : SetInterface.{u, v})
    (setObject : interface.SetObject) : Prop :=
  ∃ members : List interface.Element,
    ∀ element,
      interface.member element setObject → element ∈ members

/-- A generic set is infinite when it is not finite. -/
def IsInfiniteSet
    (interface : SetInterface.{u, v})
    (setObject : interface.SetObject) : Prop :=
  ¬ IsFiniteSet interface setObject

/-- A generic set is countable when its members are enumerated by natural
numbers. This is the finite-or-countably-infinite notion. -/
def IsCountableSet
    (interface : SetInterface.{u, v})
    (setObject : interface.SetObject) : Prop :=
  ∃ enumerate : Nat → interface.Element,
    ∀ element,
      interface.member element setObject → ∃ index : Nat, enumerate index = element

/-- A generic set is countably infinite when it has a one-to-one enumeration by
natural numbers that hits exactly its members. -/
def IsCountablyInfiniteSet
    (interface : SetInterface.{u, v})
    (setObject : interface.SetObject) : Prop :=
  ∃ enumerate : Nat → interface.Element,
    (∀ index, interface.member (enumerate index) setObject) ∧
      (∀ element,
        interface.member element setObject →
          ∃ index : Nat, enumerate index = element) ∧
        ∀ left right, enumerate left = enumerate right → left = right

/-- A proper subset is a subset that is not equal to its ambient set. -/
def ProperSubset
    (interface : SetInterface.{u, v})
    (subset superset : interface.SetObject) : Prop :=
  SetInterface.Subset interface subset superset ∧ subset ≠ superset

/-- A function is a one-to-one correspondence between two generic sets when it
maps members of the left set into the right set, hits every member of the right
set from a member of the left set, and is injective on members of the left
set. -/
def IsOneToOneCorrespondence
    (interface : SetInterface.{u, v})
    (left right : interface.SetObject)
    (correspondence : interface.Element → interface.Element) : Prop :=
  (∀ element,
    interface.member element left →
      interface.member (correspondence element) right) ∧
    (∀ target,
      interface.member target right →
        ∃ source,
          interface.member source left ∧ correspondence source = target) ∧
      ∀ first second,
        interface.member first left →
          interface.member second left →
            correspondence first = correspondence second →
              first = second

/-- Two generic sets are equivalent, or equipotent, when there is a one-to-one
correspondence between their members. -/
def EquivalentSets
    (interface : SetInterface.{u, v})
    (left right : interface.SetObject) : Prop :=
  ∃ correspondence : interface.Element → interface.Element,
    IsOneToOneCorrespondence interface left right correspondence

/-- Every subset of a countable set is countable. -/
theorem SubsetOfCountableSetIsCountable
    (interface : SetInterface.{u, v})
    (laws : SetInterfaceLaws interface)
    {subset superset : interface.SetObject}
    (subsetRelation : SetInterface.Subset interface subset superset)
    (supersetCountable : IsCountableSet interface superset) :
    IsCountableSet interface subset := by
  sorry

/-- The finite union of countable sets is countable. The finite union is
represented by folding the generic empty set and binary union over a list. -/
theorem FiniteUnionOfCountableSetsIsCountable
    (interface : SetInterface.{u, v})
    (laws : SetInterfaceLaws interface)
    (sets : List interface.SetObject)
    (eachCountable :
      ∀ setObject, setObject ∈ sets → IsCountableSet interface setObject) :
    IsCountableSet interface
      (LRA.VolumeI.Set.Algebra.Collection.FiniteUnionFromList
        (SetInterface.Empty interface)
        (SetInterface.Union interface)
        sets) := by
  sorry

/-- The countable union of countable sets is countable. -/
theorem CountableUnionOfCountableSetsIsCountable
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations)
    (family : Nat → operations.SetObject)
    (eachCountable :
      ∀ index,
        IsCountableSet operations.toPublicSetOperations (family index)) :
    IsCountableSet operations.toPublicSetOperations
      (CountableUnion operations family) := by
  sorry

/-- Every infinite set contains a countably infinite subset. -/
theorem InfiniteSetHasCountablyInfiniteSubset
    (interface : SetInterface.{u, v})
    (laws : SetInterfaceLaws interface)
    (setObject : interface.SetObject)
    (setInfinite : IsInfiniteSet interface setObject) :
    ∃ subset : interface.SetObject,
      SetInterface.Subset interface subset setObject ∧
        IsCountablyInfiniteSet interface subset := by
  sorry

/-- Every infinite set is equivalent to one of its proper subsets. -/
theorem InfiniteSetEquivalentToProperSubset
    (interface : SetInterface.{u, v})
    (laws : SetInterfaceLaws interface)
    (setObject : interface.SetObject)
    (setInfinite : IsInfiniteSet interface setObject) :
    ∃ properSubset : interface.SetObject,
      ProperSubset interface properSubset setObject ∧
        EquivalentSets interface setObject properSubset := by
  sorry

end LRA.VolumeI.Set.Generic
