universe u v

namespace LRA.VolumeI.Set.Operations

/-!
Public finite set-operation surface.

This layer records the operations whose public meaning should agree across set
backends, even when one backend implements an operation natively and another
derives it from more primitive operations.
-/

/-- Backend-independent public names for finite set operations. -/
structure PublicSetOperations where
  SetObject : Type u
  Element : Type v
  member : Element → SetObject → Prop
  empty : SetObject
  singleton : Element → SetObject
  pair : Element → Element → SetObject
  union : SetObject → SetObject → SetObject
  intersection : SetObject → SetObject → SetObject
  subset : SetObject → SetObject → Prop

/-- Public membership laws that make the finite operation names mean the same thing. -/
structure PublicSetOperationLaws (operations : PublicSetOperations) : Prop where
  emptyMembership :
    ∀ element, ¬ operations.member element operations.empty
  singletonMembership :
    ∀ element chosen,
      operations.member element (operations.singleton chosen) ↔ element = chosen
  pairMembership :
    ∀ element left right,
      operations.member element (operations.pair left right) ↔
        element = left ∨ element = right
  unionMembership :
    ∀ element left right,
      operations.member element (operations.union left right) ↔
        operations.member element left ∨ operations.member element right
  intersectionMembership :
    ∀ element left right,
      operations.member element (operations.intersection left right) ↔
        operations.member element left ∧ operations.member element right
  subsetMembership :
    ∀ left right,
      operations.subset left right ↔
        ∀ element, operations.member element left → operations.member element right

end LRA.VolumeI.Set.Operations
