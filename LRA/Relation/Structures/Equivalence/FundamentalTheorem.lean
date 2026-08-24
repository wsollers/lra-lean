import LRA.Relation.Structures.Equivalence.QuotientSet

namespace LRA.Relation

open LRA.Set

universe u v

/--
`EquivalenceFromPartition` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (partition : LRA.Relation.Partition Element SetObject) (a a_1 : Element), Exists fun index => (a ∈ partition.Block index ∧ a_1 ∈ partition.Block index)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (partition : LRA.Relation.Partition Element SetObject) (a a_1 : Element), Exists fun index => (inst.1 (partition.3 index) a ∧ inst.1 (partition.3 index) a_1)

Logical form (Lean):

```lean
def EquivalenceFromPartition
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (partition : Partition Element SetObject) : Endorelation Element :=
  fun first second =>
    ∃ index,
      first ∈ partition.Block index ∧ second ∈ partition.Block index
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def EquivalenceFromPartition
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    (partition : Partition Element SetObject) : Endorelation Element :=
  fun first second =>
    ∃ index,
      first ∈ partition.Block index ∧ second ∈ partition.Block index

/--
`FundamentalTheoremOfEquivalenceRelations` TODO

Predicate logic:

  (∀ A ∈ U), ∀ first second, first ∈ A -> second ∈ A -> (EquivalenceFromPartition (PartitionFromEquivalence A relation relationIsEquivalence) first second ↔ relation first second)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject] [inst_2 : LRA.Set.SeparationLaws Element SetObject] [inst_3 : LRA.Set.ExtensionalityLaw Element SetObject] (ambient : SetObject) (relation : Element → Element → Prop) (relationIsEquivalence : (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z))) (first second : Element), (inst.1 ambient first ∧ inst.1 ambient second) → Exists fun index => (inst.1 ((LRA.Relation.PartitionFromEquivalence ambient relation relationIsEquivalence).3 index) first ∧ inst.1 ((LRA.Relation.PartitionFromEquivalence ambient relation relationIsEquivalence).3 index) second) ↔ relation first second

Logical form (Lean):

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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

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
