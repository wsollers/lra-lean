import LRA.VolumeI.Relations.Equivalence.Partition
import LRA.VolumeI.Set.Operations.Families

namespace LRA.VolumeI.Relations

universe u v w x

/-- The quotient set of equivalence classes induced by a relation, represented
as a collection-level set whose members are subset-elements for equivalence
classes. -/
def QuotientSet
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) :
    operations.collectionOperations.SetObject :=
  operations.collectionOperations.separation
    (operations.powerset ambient)
    (fun candidate =>
      ∃ representative,
        operations.elementOperations.member representative ambient ∧
          candidate =
            operations.subsetElement
              (EquivalenceClass operations.elementOperations ambient relation representative))

/-- The canonical projection sending an element to its equivalence class. -/
def QuotientProjection
    (operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u})
    (ambient : operations.SetObject)
    (relation : Endorelation operations.Element) :
    operations.Element -> operations.SetObject :=
  fun element => EquivalenceClass operations ambient relation element

/-- The canonical projection viewed as an element of the quotient collection. -/
def QuotientClassElement
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) :
    operations.elementOperations.Element -> operations.collectionOperations.Element :=
  fun element =>
    operations.subsetElement
      (EquivalenceClass operations.elementOperations ambient relation element)

/-- Membership in the quotient set is membership as an equivalence class. -/
theorem QuotientSetMembership
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (laws : LRA.VolumeI.Set.Operations.CollectionSetInterfaceLaws operations)
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element)
    (candidate : operations.collectionOperations.Element) :
    operations.collectionOperations.member candidate
        (QuotientSet operations ambient relation) ↔
      operations.collectionOperations.member candidate (operations.powerset ambient) ∧
        ∃ representative,
          operations.elementOperations.member representative ambient ∧
            candidate =
              operations.subsetElement
                (EquivalenceClass operations.elementOperations ambient relation representative) := by
  sorry

end LRA.VolumeI.Relations
