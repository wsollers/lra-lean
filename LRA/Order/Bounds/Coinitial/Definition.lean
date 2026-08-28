import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Coinitial` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (point : Element), Exists fun element => (element ∈ subset ∧ relation element point)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (point : Element), Exists fun element => (inst.1 subset element ∧ relation element point)

Logical form (Lean):

```lean
def Coinitial
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation element point
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
def Coinitial
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall point, exists element, element ∈ subset /\ relation element point

/--
`DenseBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (point : Element), Exists fun element => (element ∈ subset ∧ relation element point)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (point : Element), Exists fun element => (inst.1 subset element ∧ relation element point)

Logical form (Lean):

```lean
def DenseBelow
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Coinitial relation subset
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
def DenseBelow
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  Coinitial relation subset

end LRA.Order
