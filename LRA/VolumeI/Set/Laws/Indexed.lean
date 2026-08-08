import LRA.VolumeI.Set.Laws.Boolean
import LRA.VolumeI.Set.Operations.Indexed

universe u v

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Indexed and countable set laws over the generic indexed set interface.
-/

/-- Membership in an indexed union. -/
theorem IndexedUnionMembership
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations) :
    ∀ {Index : Type u} (element : operations.Element)
      (family : Index → operations.SetObject),
      operations.member element (IndexedUnion operations family) ↔
        ∃ index, operations.member element (family index) := by
  sorry

/-- Membership in an indexed intersection. -/
theorem IndexedIntersectionMembership
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations) :
    ∀ {Index : Type u} (element : operations.Element)
      (family : Index → operations.SetObject),
      operations.member element (IndexedIntersection operations family) ↔
        ∀ index, operations.member element (family index) := by
  sorry

/-- Membership in a countable union. -/
theorem CountableUnionMembership
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations) :
    ∀ element family,
      operations.member element (CountableUnion operations family) ↔
        ∃ index : Nat, operations.member element (family index) := by
  sorry

/-- Membership in a countable intersection. -/
theorem CountableIntersectionMembership
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations) :
    ∀ element family,
      operations.member element (CountableIntersection operations family) ↔
        ∀ index : Nat, operations.member element (family index) := by
  sorry

/-- Indexed union is monotone in the family. -/
theorem IndexedUnionMonotone
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations)
    {Index : Type u} {left right : Index → operations.SetObject}
    (familySubset :
      ∀ index element,
        operations.member element (left index) →
          operations.member element (right index)) :
    ∀ element,
      operations.member element (IndexedUnion operations left) →
        operations.member element (IndexedUnion operations right) := by
  sorry

/-- Indexed intersection is monotone in the family. -/
theorem IndexedIntersectionMonotone
    (operations : IndexedSetOperations.{u, v})
    (laws : IndexedSetInterfaceLaws operations)
    {Index : Type u} {left right : Index → operations.SetObject}
    (familySubset :
      ∀ index element,
        operations.member element (left index) →
          operations.member element (right index)) :
    ∀ element,
      operations.member element (IndexedIntersection operations left) →
        operations.member element (IndexedIntersection operations right) := by
  sorry

/-- Complement of an indexed union is the indexed intersection of complements. -/
theorem ComplementIndexedUnion
    (operations : BooleanIndexedSetOperations.{u, v})
    (laws : BooleanIndexedSetInterfaceLaws operations)
    {Index : Type u} (family : Index → operations.SetObject) :
    Complement operations.toBooleanSetOperations
        (operations.indexedUnion family) =
      operations.indexedIntersection
        (fun index => Complement operations.toBooleanSetOperations (family index)) := by
  sorry

/-- Complement of an indexed intersection is the indexed union of complements. -/
theorem ComplementIndexedIntersection
    (operations : BooleanIndexedSetOperations.{u, v})
    (laws : BooleanIndexedSetInterfaceLaws operations)
    {Index : Type u} (family : Index → operations.SetObject) :
    Complement operations.toBooleanSetOperations
        (operations.indexedIntersection family) =
      operations.indexedUnion
        (fun index => Complement operations.toBooleanSetOperations (family index)) := by
  sorry

end LRA.VolumeI.Set.Generic
