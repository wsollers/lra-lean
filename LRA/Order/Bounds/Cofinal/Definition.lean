import LRA.Relation.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Cofinal` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (point : Element), Exists fun element => (element ∈ subset ∧ relation point element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (point : Element), Exists fun element => (inst.1 subset element ∧ relation point element)

Logical form (Lean):

```lean
def Cofinal
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation point element
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def Cofinal
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation point element

/--
`DenseAbove` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (point : Element), Exists fun element => (element ∈ subset ∧ relation point element)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (point : Element), Exists fun element => (inst.1 subset element ∧ relation point element)

Logical form (Lean):

```lean
def DenseAbove
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Cofinal relation subset
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
def DenseAbove
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Cofinal relation subset

end LRA.Order
