import LRA.VolumeI.Relations.Equivalence.Partition
import LRA.VolumeI.Identity.Model.Theory
import LRA.VolumeI.Set.Operations.Families

namespace LRA.VolumeI.Relations

universe u v w x

/-- A collection object `quotient` is the quotient set of `ambient` by
`relation` when its members are exactly the subset-elements represented by
equivalence classes of ambient representatives. -/
def IsQuotientSetOf
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (quotient : operations.collectionOperations.SetObject)
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) : Prop :=
  ∀ candidate,
    operations.collectionOperations.member candidate quotient ↔
      operations.collectionOperations.member candidate (operations.powerset ambient) ∧
        ∃ representative,
          operations.elementOperations.member representative ambient ∧
            candidate =
              operations.subsetElement
                (EquivalenceClass operations.elementOperations ambient relation representative)

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

/-- For each ambient set and relation, the quotient set exists. -/
theorem QuotientSetExists
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (laws : LRA.VolumeI.Set.Operations.CollectionSetInterfaceLaws operations)
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) :
    LRA.VolumeI.Identity.Exists
      (fun quotient : operations.collectionOperations.SetObject =>
        IsQuotientSetOf operations quotient ambient relation) := by
  sorry

/-- A quotient set is uniquely determined by its memberwise specification. -/
theorem QuotientSetUnique
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (laws : LRA.VolumeI.Set.Operations.CollectionSetInterfaceLaws operations)
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) :
    LRA.VolumeI.Identity.Unique
      (fun quotient : operations.collectionOperations.SetObject =>
        IsQuotientSetOf operations quotient ambient relation) := by
  sorry

/-- For each ambient set and relation, there is exactly one quotient set
satisfying the memberwise specification. -/
theorem QuotientSetExistsAndUnique
    (operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x})
    (laws : LRA.VolumeI.Set.Operations.CollectionSetInterfaceLaws operations)
    (ambient : operations.elementOperations.SetObject)
    (relation : Endorelation operations.elementOperations.Element) :
    LRA.VolumeI.Identity.ExistsAndUnique
      (fun quotient : operations.collectionOperations.SetObject =>
        IsQuotientSetOf operations quotient ambient relation) := by
  sorry

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

/-- The quotient projection is well-defined with respect to equivalent
representatives: related representatives determine the same projected class. -/
theorem QuotientProjectionWellDefined
    {operations : LRA.VolumeI.Set.Operations.ComprehensionSetOperations.{u, u}}
    {ambient : operations.SetObject}
    {relation : Endorelation operations.Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : operations.Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientProjection operations ambient relation firstRepresentative =
      QuotientProjection operations ambient relation secondRepresentative := by
  sorry

/-- The collection-level quotient class element is well-defined with respect to
equivalent representatives. -/
theorem QuotientClassElementWellDefined
    {operations : LRA.VolumeI.Set.Operations.CollectionSetOperations.{u, v, w, x}}
    {ambient : operations.elementOperations.SetObject}
    {relation : Endorelation operations.elementOperations.Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : operations.elementOperations.Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    QuotientClassElement operations ambient relation firstRepresentative =
      QuotientClassElement operations ambient relation secondRepresentative := by
  sorry

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
