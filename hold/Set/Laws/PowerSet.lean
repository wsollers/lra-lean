import LRA.VolumeI.Set.Operations.PowerSet

universe u v w x

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Powerset laws over the generic higher-order set interface.
-/

/-- Membership in a powerset is exactly subset inclusion in the ambient set. -/
theorem PowerSetMembership
    (operations : PowerSetOperations.{u, v, w, x})
    (laws : PowerSetInterfaceLaws operations)
    (ambient candidate : operations.elementOperations.SetObject) :
    operations.collectionOperations.member
        (SubsetElement operations candidate)
        (PowerSet operations ambient) ↔
      operations.elementOperations.subset candidate ambient := by
  sorry

/-- Every subset of the ambient set belongs to its powerset. -/
theorem MemberOfPowerSet
    (operations : PowerSetOperations.{u, v, w, x})
    (laws : PowerSetInterfaceLaws operations)
    {ambient candidate : operations.elementOperations.SetObject}
    (candidateSubsetAmbient :
      operations.elementOperations.subset candidate ambient) :
    operations.collectionOperations.member
      (SubsetElement operations candidate)
      (PowerSet operations ambient) := by
  sorry

/-- The powerset is monotone with respect to subset inclusion. -/
theorem PowerSetMonotone
    (operations : PowerSetOperations.{u, v, w, x})
    (laws : PowerSetInterfaceLaws operations)
    {left right : operations.elementOperations.SetObject}
    (leftSubsetRight : operations.elementOperations.subset left right) :
    operations.collectionOperations.subset
      (PowerSet operations left)
      (PowerSet operations right) := by
  sorry

/-- A collection is a family of subsets of an ambient set exactly when each
represented member is contained in the ambient set. -/
theorem IsFamilyOfSubsetsIff
    (operations : PowerSetOperations.{u, v, w, x})
    (laws : PowerSetInterfaceLaws operations)
    (ambient : operations.elementOperations.SetObject)
    (collection : operations.collectionOperations.SetObject) :
    IsFamilyOfSubsets operations ambient collection ↔
      ∀ candidate,
        ContainsSubset operations collection candidate →
          operations.elementOperations.subset candidate ambient := by
  sorry

end LRA.VolumeI.Set.Generic
