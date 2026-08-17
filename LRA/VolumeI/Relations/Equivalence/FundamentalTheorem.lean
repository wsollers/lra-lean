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
  intro first second firstInAmbient secondInAmbient
  constructor
  · intro sameBlock
    rcases sameBlock with ⟨representative, firstInBlock, secondInBlock⟩
    have firstRelatedRepresentative :
        relation first representative.1 :=
      ((EquivalenceClassMembershipIff
        ambient relation representative.1 first).1 firstInBlock).2
    have secondRelatedRepresentative :
        relation second representative.1 :=
      ((EquivalenceClassMembershipIff
        ambient relation representative.1 second).1 secondInBlock).2
    exact
      relationIsEquivalence.2.2
        first representative.1 second
        firstRelatedRepresentative
        (relationIsEquivalence.2.1
          second representative.1 secondRelatedRepresentative)
  · intro firstRelatedSecond
    refine ⟨⟨first, firstInAmbient⟩, ?_, ?_⟩
    · exact
        (EquivalenceClassMembershipIff ambient relation first first).2
          ⟨firstInAmbient, relationIsEquivalence.1 first⟩
    · exact
        (EquivalenceClassMembershipIff ambient relation first second).2
          ⟨secondInAmbient,
            relationIsEquivalence.2.1 first second firstRelatedSecond⟩

end LRA.Relation
