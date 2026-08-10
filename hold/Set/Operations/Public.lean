universe u v

namespace LRA.VolumeI.Set.Operations

/-!
Public finite set-operation surface.

This layer records the operations whose public meaning should agree across set
backends, even when one backend implements an operation natively and another
derives it from more primitive operations.
-/

/-- A backend-independent public interface for finite set operations. It names
the set objects, elements, membership relation, empty set, singleton, pair,
union, intersection, and subset relation; equivalently, it is the operation
surface that different concrete set backends must expose with the same
mathematical meaning. -/
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

/-- Laws for the backend-independent public finite set operations. They assert
the ordinary membership readings for empty sets, singletons, pairs, unions,
intersections, and subsets; equivalently, two backends satisfying these laws
give the same elementwise meaning to the public operation names. -/
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
