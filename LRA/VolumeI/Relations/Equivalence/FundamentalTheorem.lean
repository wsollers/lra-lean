import LRA.VolumeI.Relations.Equivalence.QuotientSet

namespace LRA.Relation

open LRA.Set

universe u v

/-- A partition determines the relation of belonging to a common block.

Logical form:

```lean
def EquivalenceFromPartition
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (partition : Partition Element SetObject) : Endorelation Element :=
  fun first second =>
    exists index,
      first ∈ partition.Block index /\ second ∈ partition.Block index
```
-/
def EquivalenceFromPartition
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (partition : Partition Element SetObject) : Endorelation Element :=
  fun first second =>
    exists index,
      first ∈ partition.Block index /\ second ∈ partition.Block index

/--
**[Theorem — FundamentalTheoremOfEquivalenceRelations]**

The partition into equivalence classes recovers the original relation on the
represented carrier.

This is the textbook fundamental theorem of equivalence relations, stated
as the interface contract for the detailed proof pass.


Logical form:

```lean
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
          relation first second)
```
-/
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
