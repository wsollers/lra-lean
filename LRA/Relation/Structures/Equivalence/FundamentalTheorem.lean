import LRA.Relation.Structures.Equivalence.QuotientSet

namespace LRA.Relation

open LRA.Set

universe u v

/-- A partition determines the relation of belonging to a common block. -/
def EquivalenceFromPartition
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (partition : Partition Element SetObject) : Endorelation Element :=
  fun first second =>
    ∃ index,
      first ∈ partition.Block index ∧ second ∈ partition.Block index

/-- The partition into equivalence classes recovers the original relation on
the represented carrier. -/
theorem FundamentalTheoremOfEquivalenceRelations
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject)
    (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ first second,
      first ∈ ambient -> second ∈ ambient ->
        (EquivalenceFromPartition
            (PartitionFromEquivalence ambient relation relationIsEquivalence)
            first second ↔
          relation first second) := by
  sorry

end LRA.Relation
