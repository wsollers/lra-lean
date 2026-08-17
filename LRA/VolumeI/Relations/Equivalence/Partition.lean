import LRA.VolumeI.Relations.Equivalence.EquivalenceClass

namespace LRA.Relation

open LRA.Set

universe u v

/-- A partition of a represented carrier by indexed nonempty, covering,
pairwise disjoint-or-equal blocks. Generic over any set backend with
membership.

Logical form:

```lean
structure Partition (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Carrier : SetObject
  Index : Type u
  Block : Index -> SetObject
  BlocksContained : forall index element,
    element ∈ Block index -> element ∈ Carrier
  Covers : forall element : Element, element ∈ Carrier ->
    exists index, element ∈ Block index
  NonemptyBlocks : forall index,
    exists element : Element, element ∈ Block index
  DisjointOrEqual :
    forall firstIndex secondIndex,
      (exists element : Element,
        element ∈ Block firstIndex /\ element ∈ Block secondIndex) ->
        Block firstIndex = Block secondIndex
```
-/
structure Partition (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  Carrier : SetObject
  Index : Type u
  Block : Index -> SetObject
  BlocksContained : forall index element,
    element ∈ Block index -> element ∈ Carrier
  Covers : forall element : Element, element ∈ Carrier ->
    exists index, element ∈ Block index
  NonemptyBlocks : forall index,
    exists element : Element, element ∈ Block index
  DisjointOrEqual :
    forall firstIndex secondIndex,
      (exists element : Element,
        element ∈ Block firstIndex /\ element ∈ Block secondIndex) ->
        Block firstIndex = Block secondIndex

/--
**[Theorem — PartitionBlockContained]**

Every equivalence-class block is contained in the represented carrier.

Logical form:

```lean
theorem PartitionBlockContained
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation)
    (representative : { element : Element // element ∈ ambient })
    (candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative.1 ->
      candidate ∈ ambient
```
-/
theorem PartitionBlockContained
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation)
    (representative : { element : Element // element ∈ ambient })
    (candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative.1 ->
      candidate ∈ ambient := by
  intro candidateInClass
  exact
    ((EquivalenceClassMembershipIff
      ambient relation representative.1 candidate).1
      candidateInClass).1

/--
**[Theorem — EquivalenceClassesCoverAmbient]**

Every member of the represented carrier belongs to one of its equivalence
classes.

Logical form:

```lean
theorem EquivalenceClassesCoverAmbient
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ element : Element, element ∈ ambient ->
      ∃ representative : { candidate : Element // candidate ∈ ambient },
        element ∈ EquivalenceClass ambient relation representative.1
```
-/
theorem EquivalenceClassesCoverAmbient
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ element : Element, element ∈ ambient ->
      ∃ representative : { candidate : Element // candidate ∈ ambient },
        element ∈ EquivalenceClass ambient relation representative.1 := by
  intro element elementInAmbient
  refine ⟨⟨element, elementInAmbient⟩, ?_⟩
  exact
    (EquivalenceClassMembershipIff ambient relation element element).2
      ⟨elementInAmbient, relationIsEquivalence.1 element⟩

/--
**[Theorem — EquivalenceClassBlocksNonempty]**

Every equivalence-class block indexed by a carrier member is nonempty.

Logical form:

```lean
theorem EquivalenceClassBlocksNonempty
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ representative : { element : Element // element ∈ ambient },
      ∃ candidate : Element,
        candidate ∈ EquivalenceClass ambient relation representative.1
```
-/
theorem EquivalenceClassBlocksNonempty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ representative : { element : Element // element ∈ ambient },
      ∃ candidate : Element,
        candidate ∈ EquivalenceClass ambient relation representative.1 := by
  intro representative
  exact
    ⟨representative.1,
      (EquivalenceClassMembershipIff
        ambient relation representative.1 representative.1).2
        ⟨representative.2, relationIsEquivalence.1 representative.1⟩⟩

/--
**[Theorem — EquivalenceClassBlocksDisjointOrEqual]**

Two equivalence-class blocks that overlap are equal.

Logical form:

```lean
theorem EquivalenceClassBlocksDisjointOrEqual
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ first second : { element : Element // element ∈ ambient },
      (∃ candidate : Element,
        candidate ∈ EquivalenceClass ambient relation first.1 /\
          candidate ∈ EquivalenceClass ambient relation second.1) ->
        EquivalenceClass ambient relation first.1 =
          EquivalenceClass ambient relation second.1
```
-/
theorem EquivalenceClassBlocksDisjointOrEqual
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ first second : { element : Element // element ∈ ambient },
      (∃ candidate : Element,
        candidate ∈ EquivalenceClass ambient relation first.1 /\
          candidate ∈ EquivalenceClass ambient relation second.1) ->
        EquivalenceClass ambient relation first.1 =
          EquivalenceClass ambient relation second.1 := by
  intro first second blocksOverlap
  rcases blocksOverlap with ⟨candidate, candidateInFirst, candidateInSecond⟩
  have candidateRelatedFirst :
      relation candidate first.1 :=
    ((EquivalenceClassMembershipIff
      ambient relation first.1 candidate).1 candidateInFirst).2
  have candidateRelatedSecond :
      relation candidate second.1 :=
    ((EquivalenceClassMembershipIff
      ambient relation second.1 candidate).1 candidateInSecond).2
  have firstRelatedSecond : relation first.1 second.1 :=
    relationIsEquivalence.2.2
      first.1 candidate second.1
      (relationIsEquivalence.2.1 candidate first.1 candidateRelatedFirst)
      candidateRelatedSecond
  exact
    RelatedRepresentativesHaveSameEquivalenceClass
      relationIsEquivalence firstRelatedSecond ambient

/-- The partition generated by an equivalence relation.

Logical form:

```lean
def PartitionFromEquivalence
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject)
    (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    Partition Element SetObject
```
-/
def PartitionFromEquivalence
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject)
    (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    Partition Element SetObject :=
  { Carrier := ambient
    Index := { representative : Element // representative ∈ ambient }
    Block := fun representative =>
      EquivalenceClass ambient relation representative.1
    BlocksContained :=
      PartitionBlockContained ambient relation relationIsEquivalence
    Covers :=
      EquivalenceClassesCoverAmbient ambient relation relationIsEquivalence
    NonemptyBlocks :=
      EquivalenceClassBlocksNonempty ambient relation relationIsEquivalence
    DisjointOrEqual :=
      EquivalenceClassBlocksDisjointOrEqual
        ambient relation relationIsEquivalence }

end LRA.Relation
