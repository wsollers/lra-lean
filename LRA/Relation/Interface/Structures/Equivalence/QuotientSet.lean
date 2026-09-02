import LRA.Relation.Interface.Structures.Equivalence.Partition
import LRA.Identity.Interface.Definitions.Witnesses
import LRA.Identity.Constructions.Mathlib

namespace LRA.Relation

open LRA.Set
open scoped LRA.Identity.Construction.Mathlib

universe u v w

section QuotientSets

variable {Element : Type u} {SetObject : Type v} {Collection : Type w}
variable [Membership Element SetObject]
variable [Membership SetObject Collection]
variable [HasSeparation Element SetObject]

section WithPowerset

variable [HasPowerset SetObject Collection]

/--
`IsQuotientSetOf` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] (quotient : Collection) (ambient : SetObject) (relation : LRA.Relation.Endorelation Element) (candidate : SetObject), candidate ∈ quotient ↔ (candidate ∈ inst_3.powerset ambient ∧ Exists fun representative => (representative ∈ ambient ∧ candidate = LRA.Relation.EquivalenceClass ambient relation representative))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] (quotient : Collection) (ambient : SetObject) (relation : Element → Element → Prop) (candidate : SetObject), inst_1.1 quotient candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))

Logical form (Lean):

```lean
def IsQuotientSetOf
    (quotient : Collection)
    (ambient : SetObject)
    (relation : Endorelation Element) : Prop :=
  ∀ candidate : SetObject,
    candidate ∈ quotient ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, use, unfold

-/
def IsQuotientSetOf
    (quotient : Collection)
    (ambient : SetObject)
    (relation : Endorelation Element) : Prop :=
  ∀ candidate : SetObject,
    candidate ∈ quotient ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative

section WithCollectionSeparation

variable [HasSeparation SetObject Collection]

/--
`QuotientSet` TODO

Predicate logic:

  def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)

Predicate logic (unfolded):

  def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)
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
def QuotientSet
    (ambient : SetObject)
    (relation : Endorelation Element) : Collection :=
  HasSeparation.separation (HasPowerset.powerset ambient : Collection)
    (fun candidate =>
      ∃ representative : Element,
        representative ∈ ambient ∧
          candidate = EquivalenceClass ambient relation representative)

section Laws

variable [SeparationLaws SetObject Collection]
variable [ExtensionalityLaw SetObject Collection]
variable [HasSubset SetObject]
variable [PowersetMembershipLaws SetObject Collection]
variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

/--
`QuotientSetExists` TODO

Predicate logic:

  (∀ A ∈ U), ∃ quotient ∈ Collection, IsQuotientSetOf quotient A relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] [inst_4 : LRA.Set.HasSeparation SetObject Collection], (LRA.Set.SeparationLaws SetObject Collection ∧ LRA.Set.ExtensionalityLaw SetObject Collection) → ∀ [inst_5 : HasSubset SetObject], (LRA.Set.PowersetMembershipLaws SetObject Collection ∧ (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject)) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), Exists fun quotient => ∀ (candidate : SetObject), inst_1.1 quotient candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))

Logical form (Lean):

```lean
theorem QuotientSetExists
    (ambient : SetObject)
    (relation : Endorelation Element) :
    ∃ quotient : Collection,
      IsQuotientSetOf quotient ambient relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem QuotientSetExists
    (ambient : SetObject)
    (relation : Endorelation Element) :
    ∃ quotient : Collection,
      IsQuotientSetOf quotient ambient relation := by
  sorry
/--
`QuotientSetUnique` TODO

Predicate logic:

  (∀ A ∈ U), LRA.Identity.AtMostOne fun quotient ∈ Collection =>
    IsQuotientSetOf quotient A relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] [inst_4 : LRA.Set.HasSeparation SetObject Collection], (LRA.Set.SeparationLaws SetObject Collection ∧ LRA.Set.ExtensionalityLaw SetObject Collection) → ∀ [inst_5 : HasSubset SetObject], (LRA.Set.PowersetMembershipLaws SetObject Collection ∧ (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject)) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (left right : Collection), (∀ (candidate : SetObject), inst_1.1 left candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative)) ∧ ∀ (candidate : SetObject), inst_1.1 right candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))) → left = right

Logical form (Lean):

```lean
theorem QuotientSetUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.AtMostOne
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem QuotientSetUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.AtMostOne
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry
/--
`QuotientSetExistsAndUnique` TODO

Predicate logic:

  (∀ A ∈ U), LRA.Identity.ExactlyOne fun quotient ∈ Collection =>
    IsQuotientSetOf quotient A relation

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] [inst_4 : LRA.Set.HasSeparation SetObject Collection], (LRA.Set.SeparationLaws SetObject Collection ∧ LRA.Set.ExtensionalityLaw SetObject Collection) → ∀ [inst_5 : HasSubset SetObject], (LRA.Set.PowersetMembershipLaws SetObject Collection ∧ (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject)) → ∀ (ambient : SetObject) (relation : Element → Element → Prop), (Exists fun witness => (fun quotient => ∀ (candidate : SetObject), inst_1.1 quotient candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))) witness ∧ ∀ (left right : Collection), (∀ (candidate : SetObject), inst_1.1 left candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))) → (∀ (candidate : SetObject), inst_1.1 right candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))) → left = right)

Logical form (Lean):

```lean
theorem QuotientSetExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.ExactlyOne
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem QuotientSetExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element) :
    LRA.Identity.ExactlyOne
      (fun quotient : Collection =>
        IsQuotientSetOf quotient ambient relation) := by
  sorry
/--
`QuotientSetMembership` TODO

Predicate logic:

  (∀ A ∈ U ∀ B ∈ U), B ∈ QuotientSet Collection ∈ = Collection A relation ↔ B ∈ HasPowerset.powerset A ∈ Collection ∧ ∃ representative ∈ Element, representative ∈ A ∧ B = EquivalenceClass A relation representative

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} {Collection : Type w} [inst : Membership Element SetObject] [inst_1 : Membership SetObject Collection] [inst_2 : LRA.Set.HasSeparation Element SetObject] [inst_3 : LRA.Set.HasPowerset SetObject Collection] [inst_4 : LRA.Set.HasSeparation SetObject Collection], (LRA.Set.SeparationLaws SetObject Collection ∧ LRA.Set.ExtensionalityLaw SetObject Collection) → ∀ [inst_5 : HasSubset SetObject], (LRA.Set.PowersetMembershipLaws SetObject Collection ∧ (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject)) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (candidate : SetObject), inst_1.1 (inst_4.1 (inst_3.1 ambient) fun candidate => Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative)) candidate ↔ (inst_1.1 (inst_3.1 ambient) candidate ∧ Exists fun representative => (inst.1 ambient representative ∧ candidate = inst_2.1 ambient fun candidate => relation candidate representative))

Logical form (Lean):

```lean
theorem QuotientSetMembership
    (ambient : SetObject)
    (relation : Endorelation Element)
    (candidate : SetObject) :
    candidate ∈ QuotientSet (Collection := Collection) ambient relation ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases, use

-/
theorem QuotientSetMembership
    (ambient : SetObject)
    (relation : Endorelation Element)
    (candidate : SetObject) :
    candidate ∈ QuotientSet (Collection := Collection) ambient relation ↔
      candidate ∈ (HasPowerset.powerset ambient : Collection) ∧
        ∃ representative : Element,
          representative ∈ ambient ∧
            candidate = EquivalenceClass ambient relation representative := by
  sorry
end Laws
end WithCollectionSeparation
end WithPowerset

/--
`QuotientProjection` TODO

Predicate logic:

  def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element

Predicate logic (unfolded):

  def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def QuotientProjection
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  fun element => EquivalenceClass ambient relation element

/--
`QuotientClassElement` TODO

Predicate logic:

  def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation

Predicate logic (unfolded):

  def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def QuotientClassElement
    (ambient : SetObject)
    (relation : Endorelation Element) :
    Element -> SetObject :=
  QuotientProjection ambient relation

section WellDefined

variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

/--
`QuotientProjectionWellDefined` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), QuotientProjection A relation x = QuotientProjection A relation y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ {ambient : SetObject} {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ {firstRepresentative secondRepresentative : Element}, relation firstRepresentative secondRepresentative → inst_1.1 ambient fun candidate => relation candidate firstRepresentative = inst_1.1 ambient fun candidate => relation candidate secondRepresentative

Logical form (Lean):

```lean
theorem QuotientProjectionWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientProjection ambient relation firstRepresentative =
      QuotientProjection ambient relation secondRepresentative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem QuotientProjectionWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientProjection ambient relation firstRepresentative =
      QuotientProjection ambient relation secondRepresentative := by
  sorry
/--
`QuotientClassElementWellDefined` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), QuotientClassElement A relation x = QuotientClassElement A relation y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ {ambient : SetObject} {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ {firstRepresentative secondRepresentative : Element}, relation firstRepresentative secondRepresentative → inst_1.1 ambient fun candidate => relation candidate firstRepresentative = inst_1.1 ambient fun candidate => relation candidate secondRepresentative

Logical form (Lean):

```lean
theorem QuotientClassElementWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientClassElement ambient relation firstRepresentative =
      QuotientClassElement ambient relation secondRepresentative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem QuotientClassElementWellDefined
    {ambient : SetObject}
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated : relation firstRepresentative secondRepresentative) :
    QuotientClassElement ambient relation firstRepresentative =
      QuotientClassElement ambient relation secondRepresentative := by
  sorry
end WellDefined
end QuotientSets

end LRA.Relation
