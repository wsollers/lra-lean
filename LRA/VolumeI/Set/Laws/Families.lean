import LRA.VolumeI.Set.Laws.PowerSet
import LRA.VolumeI.Set.Operations.Families

universe u v w x y

namespace LRA.VolumeI.Set.Generic

open LRA.VolumeI.Set.Operations

/-!
Laws for set-theoretic families/classes of subsets.
-/

/-- Membership in a collection union. -/
theorem CollectionUnionMembership
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (element : operations.elementOperations.Element)
    (collection : operations.collectionOperations.SetObject) :
    operations.elementOperations.member element
        (CollectionUnion operations collection) ↔
      ∃ memberSet,
        ContainsSubset operations.toPowerSetOperations collection memberSet ∧
          operations.elementOperations.member element memberSet := by
  sorry

/-- Membership in a collection intersection. -/
theorem CollectionIntersectionMembership
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (element : operations.elementOperations.Element)
    (collection : operations.collectionOperations.SetObject) :
    operations.elementOperations.member element
        (CollectionIntersection operations collection) ↔
      ∀ memberSet,
        ContainsSubset operations.toPowerSetOperations collection memberSet →
          operations.elementOperations.member element memberSet := by
  sorry

/-- A cover can be expanded elementwise. -/
theorem CoversElementwiseIff
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (collection : operations.collectionOperations.SetObject)
    (target : operations.elementOperations.SetObject) :
    Covers operations collection target ↔
      ∀ element,
        operations.elementOperations.member element target →
          ∃ memberSet,
            ContainsSubset operations.toPowerSetOperations collection memberSet ∧
              operations.elementOperations.member element memberSet := by
  sorry

/-- Subcover expands to subcollection plus cover. -/
theorem SubcoverIff
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (subcollection collection : operations.collectionOperations.SetObject)
    (target : operations.elementOperations.SetObject) :
    Subcover operations subcollection collection target ↔
      operations.collectionOperations.subset subcollection collection ∧
        Covers operations subcollection target := by
  sorry

/-- A Lean-indexed family can be represented by a set-theoretic collection. -/
theorem IndexedFamilyHasRepresentingCollection
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    {Index : Type y}
    (ambient : operations.elementOperations.SetObject)
    (family : IndexedSetFamily operations.toPowerSetOperations Index)
    (familySubsetAmbient :
      ∀ index, operations.elementOperations.subset (family index) ambient) :
    ∃ collection : operations.collectionOperations.SetObject,
      IsFamilyOfSubsets operations.toPowerSetOperations ambient collection ∧
        ∀ index, ContainsSubset operations.toPowerSetOperations collection (family index) := by
  sorry

/-- A set-theoretic family has a relative-complement family inside the same target. -/
theorem RelativeComplementCollectionIsFamily
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (target : operations.elementOperations.SetObject)
    (collection : operations.collectionOperations.SetObject) :
    IsFamilyOfSubsets operations.toPowerSetOperations target
      (RelativeComplementCollection operations target collection) := by
  sorry

/-- Failure to cover is equivalent to nonemptiness of the intersection of the
relative-complement collection. -/
theorem CoverFailureIffRelativeComplementIntersectionNonempty
    (operations : CollectionSetOperations.{u, v, w, x})
    (laws : CollectionSetInterfaceLaws operations)
    (collection : operations.collectionOperations.SetObject)
    (target : operations.elementOperations.SetObject) :
    ¬ Covers operations collection target ↔
      ∃ element,
        operations.elementOperations.member element
          (CollectionIntersection operations
            (RelativeComplementCollection operations target collection)) := by
  sorry

end LRA.VolumeI.Set.Generic
