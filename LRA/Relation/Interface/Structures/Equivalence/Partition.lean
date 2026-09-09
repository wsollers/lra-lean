import LRA.Relation.Interface.Structures.Equivalence.EquivalenceClass

namespace LRA.Relation

open LRA.Set

universe u v

/--
`Partition` TODO

Predicate logic:

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

Predicate logic (unfolded):

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
          Block firstIndex = Block secondIndex (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

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
`PartitionBlockContained` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : LRA.Relation.Endorelation Element), LRA.Relation.EquivalenceRelation relation → ∀ (representative : Subtype fun element => element) ∈ ambient(candidate : Element), candidate ∈ LRA.Relation.EquivalenceClass ambient relation representative.val → candidate ∈ ambient

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ambient : SetObject
    relation : Endorelation Element
    relationIsEquivalence : EquivalenceRelation relation
    candidate : Element
  Prove
    (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (representative : Subtype fun element => inst.1 ambient element) (candidate : Element), inst.1 (inst_1.1 ambient fun candidate => relation candidate representative.1) candidate → inst.1 ambient candidate

Logical form (Lean):

```lean
theorem PartitionBlockContained
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation)
    (representative : { element : Element // element ∈ ambient })
    (candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative.1 ->
      candidate ∈ ambient
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

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
  sorry
/--
`EquivalenceClassesCoverAmbient` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : LRA.Relation.Endorelation Element), LRA.Relation.EquivalenceRelation relation → ∀ (element : Element), element ∈ ambient → Exists fun representative => element ∈ LRA.Relation.EquivalenceClass ambient relation representative.val

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ambient : SetObject
    relation : Endorelation Element
    relationIsEquivalence : EquivalenceRelation relation
  Prove
    (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (element : Element), inst.1 ambient element → Exists fun representative => inst.1 (inst_1.1 ambient fun candidate => relation candidate representative.1) element

Logical form (Lean):

```lean
theorem EquivalenceClassesCoverAmbient
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ element : Element, element ∈ ambient ->
      ∃ representative : { candidate : Element // candidate ∈ ambient },
        element ∈ EquivalenceClass ambient relation representative.1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

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
  sorry
/--
`EquivalenceClassBlocksNonempty` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : LRA.Relation.Endorelation Element), LRA.Relation.EquivalenceRelation relation → ∀ (representative : Subtype fun element => element), ∈ ambient Exists fun candidate => candidate ∈ LRA.Relation.EquivalenceClass ambient relation representative.val

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ambient : SetObject
    relation : Endorelation Element
    relationIsEquivalence : EquivalenceRelation relation
  Prove
    (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (representative : Subtype fun element => inst.1 ambient element), Exists fun candidate => inst.1 (inst_1.1 ambient fun candidate => relation candidate representative.1) candidate

Logical form (Lean):

```lean
theorem EquivalenceClassBlocksNonempty
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject] [HasSeparation Element SetObject]
    [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
    (ambient : SetObject) (relation : Endorelation Element)
    (relationIsEquivalence : EquivalenceRelation relation) :
    ∀ representative : { element : Element // element ∈ ambient },
      ∃ candidate : Element,
        candidate ∈ EquivalenceClass ambient relation representative.1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

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
  sorry
/--
`EquivalenceClassBlocksDisjointOrEqual` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : LRA.Relation.Endorelation Element), LRA.Relation.EquivalenceRelation relation → ∀ (first second : Subtype fun element => element), ∈ ambient (Exists fun candidate => (candidate ∈ LRA.Relation.EquivalenceClass ambient relation first.val ∧ candidate ∈ LRA.Relation.EquivalenceClass ambient relation second.val)) → LRA.Relation.EquivalenceClass ambient relation first.val = LRA.Relation.EquivalenceClass ambient relation second.val

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    ambient : SetObject
    relation : Endorelation Element
    relationIsEquivalence : EquivalenceRelation relation
  Prove
    (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), ((∀ (x : Element), relation x x) ∧ ((∀ (x y : Element), relation x y → relation y x) ∧ (∀ (x y z : Element), relation x y → relation y z → relation x z))) → ∀ (first second : Subtype fun element => inst.1 ambient element), (Exists fun candidate => (inst.1 (inst_1.1 ambient fun candidate => relation candidate first.1) candidate ∧ inst.1 (inst_1.1 ambient fun candidate => relation candidate second.1) candidate)) → inst_1.1 ambient fun candidate => relation candidate first.1 = inst_1.1 ambient fun candidate => relation candidate second.1

Logical form (Lean):

```lean
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
          EquivalenceClass ambient relation second.1
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

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
  sorry
/--
`PartitionFromEquivalence` TODO

Predicate logic:

  def PartitionFromEquivalence
      {Element : Type u} {SetObject : Type v}
      [Membership Element SetObject] [HasSeparation Element SetObject]
      [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
      (ambient : SetObject)
      (relation : Endorelation Element)
      (relationIsEquivalence : EquivalenceRelation relation) :
      Partition Element SetObject

Predicate logic (unfolded):

  def PartitionFromEquivalence
      {Element : Type u} {SetObject : Type v}
      [Membership Element SetObject] [HasSeparation Element SetObject]
      [SeparationLaws Element SetObject] [ExtensionalityLaw Element SetObject]
      (ambient : SetObject)
      (relation : Endorelation Element)
      (relationIsEquivalence : EquivalenceRelation relation) :
      Partition Element SetObject (source fallback; no compiled unfold data available)

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

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
      EquivalenceClassBlocksDisjointOrEqual ambient relation relationIsEquivalence }

end LRA.Relation
