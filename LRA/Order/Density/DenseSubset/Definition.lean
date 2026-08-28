import LRA.Relation.Interface.Definitions

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`DenseSubset` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (x y : Element), relation x y → Exists fun d => (d ∈ subset ∧ (relation x d ∧ relation d y))

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (x y : Element), relation x y → Exists fun d => (inst.1 subset d ∧ (relation x d ∧ relation d y))

Logical form (Lean):

```lean
def DenseSubset
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall x y, relation x y ->
    exists d, d ∈ subset /\ relation x d /\ relation d y
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
def DenseSubset
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  forall x y, relation x y ->
    exists d, d ∈ subset /\ relation x d /\ relation d y

end LRA.Order
