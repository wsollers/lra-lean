import LRA.Relation.Interface.Structures.Equivalence.Definition
import LRA.Identity.Laws.Witnesses
import LRA.Identity.Constructions.Mathlib
import LRA.Set.Interface.Laws.Membership

namespace LRA.Relation

open LRA.Set
open scoped LRA.Identity.Construction.Mathlib

universe u v

section EquivalenceClasses

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`IsEquivalenceClassOf` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (classSet ambient : SetObject) (relation : LRA.Relation.Endorelation Element) (representative candidate : Element), candidate ∈ classSet ↔ (candidate ∈ ambient ∧ relation candidate representative)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (classSet ambient : SetObject) (relation : Element → Element → Prop) (representative candidate : Element), inst.1 classSet candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)

Logical form (Lean):

```lean
def IsEquivalenceClassOf
    (classSet ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : Prop :=
  ∀ candidate : Element,
    candidate ∈ classSet ↔
      candidate ∈ ambient ∧ relation candidate representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases, unfold

-/
def IsEquivalenceClassOf
    (classSet ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : Prop :=
  ∀ candidate : Element,
    candidate ∈ classSet ↔
      candidate ∈ ambient ∧ relation candidate representative

section WithSeparation

variable [HasSeparation Element SetObject]

/--
`EquivalenceClass` TODO

Predicate logic:

  def EquivalenceClass
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : SetObject :=
  HasSeparation.separation ambient
    (fun candidate => relation candidate representative)

Predicate logic (unfolded):

  def EquivalenceClass
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : SetObject :=
  HasSeparation.separation ambient
    (fun candidate => relation candidate representative) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def EquivalenceClass
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : SetObject :=
  HasSeparation.separation ambient
    (fun candidate => relation candidate representative)
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
def EquivalenceClass
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) : SetObject :=
  HasSeparation.separation ambient
    (fun candidate => relation candidate representative)

section Laws

variable [SeparationLaws Element SetObject]
variable [ExtensionalityLaw Element SetObject]

/--
`EquivalenceClassExists` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), ∃ classSet ∈ SetObject, IsEquivalenceClassOf classSet A relation x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (representative : Element), Exists fun classSet => ∀ (candidate : Element), inst.1 classSet candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)

Logical form (Lean):

```lean
theorem EquivalenceClassExists
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    ∃ classSet : SetObject,
      IsEquivalenceClassOf classSet ambient relation representative
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
theorem EquivalenceClassExists
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    ∃ classSet : SetObject,
      IsEquivalenceClassOf classSet ambient relation representative := by
  sorry
/--
`EquivalenceClassUnique` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), LRA.Identity.AtMostOne fun classSet ∈ SetObject =>
    IsEquivalenceClassOf classSet A relation x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (representative : Element) (left right : SetObject), (∀ (candidate : Element), inst.1 left candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative) ∧ ∀ (candidate : Element), inst.1 right candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)) → left = right

Logical form (Lean):

```lean
theorem EquivalenceClassUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.AtMostOne
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative)
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
theorem EquivalenceClassUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.AtMostOne
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry
/--
`EquivalenceClassExistsAndUnique` TODO

Predicate logic:

  (∀ A ∈ U ∀ x ∈ Element), LRA.Identity.ExactlyOne fun classSet ∈ SetObject =>
    IsEquivalenceClassOf classSet A relation x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (representative : Element), (Exists fun witness => (fun classSet => ∀ (candidate : Element), inst.1 classSet candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)) witness ∧ ∀ (left right : SetObject), (∀ (candidate : Element), inst.1 left candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)) → (∀ (candidate : Element), inst.1 right candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)) → left = right)

Logical form (Lean):

```lean
theorem EquivalenceClassExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.ExactlyOne
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative)
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
theorem EquivalenceClassExistsAndUnique
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative : Element) :
    LRA.Identity.ExactlyOne
      (fun classSet : SetObject =>
        IsEquivalenceClassOf classSet ambient relation representative) := by
  sorry
/--
`EquivalenceClassMembershipIff` TODO

Predicate logic:

  (∀ A ∈ U ∀ x y ∈ Element), y ∈ EquivalenceClass A relation x ↔ y ∈ A ∧ relation y x

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ (ambient : SetObject) (relation : Element → Element → Prop) (representative candidate : Element), inst.1 (inst_1.1 ambient fun candidate => relation candidate representative) candidate ↔ (inst.1 ambient candidate ∧ relation candidate representative)

Logical form (Lean):

```lean
theorem EquivalenceClassMembershipIff
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative ↔
      candidate ∈ ambient ∧ relation candidate representative
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr, cases, rcases

-/
theorem EquivalenceClassMembershipIff
    (ambient : SetObject)
    (relation : Endorelation Element)
    (representative candidate : Element) :
    candidate ∈ EquivalenceClass ambient relation representative ↔
      candidate ∈ ambient ∧ relation candidate representative := by
  sorry
/--
`RelatedRepresentativesHaveSameEquivalenceClass` TODO

Predicate logic:

  (∀ x y ∈ Element), ∀ ambient : SetObject, EquivalenceClass ambient relation x = EquivalenceClass ambient relation y

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasSeparation Element SetObject], (LRA.Set.SeparationLaws Element SetObject ∧ LRA.Set.ExtensionalityLaw Element SetObject) → ∀ {relation : Element → Element → Prop}, (∀ (x : Element), relation x x ∧ (∀ (x y : Element), relation x y → relation y x ∧ ∀ (x y z : Element), relation x y → relation y z → relation x z)) → ∀ {firstRepresentative secondRepresentative : Element}, relation firstRepresentative secondRepresentative → ∀ (ambient : SetObject), inst_1.1 ambient fun candidate => relation candidate firstRepresentative = inst_1.1 ambient fun candidate => relation candidate secondRepresentative

Logical form (Lean):

```lean
theorem RelatedRepresentativesHaveSameEquivalenceClass
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    ∀ ambient : SetObject,
      EquivalenceClass ambient relation firstRepresentative =
        EquivalenceClass ambient relation secondRepresentative
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
theorem RelatedRepresentativesHaveSameEquivalenceClass
    {relation : Endorelation Element}
    (relationIsEquivalence : EquivalenceRelation relation)
    {firstRepresentative secondRepresentative : Element}
    (representativesRelated :
      relation firstRepresentative secondRepresentative) :
    ∀ ambient : SetObject,
      EquivalenceClass ambient relation firstRepresentative =
        EquivalenceClass ambient relation secondRepresentative := by
  sorry
end Laws
end WithSeparation
end EquivalenceClasses

end LRA.Relation
