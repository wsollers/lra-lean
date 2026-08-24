import LRA.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`BoundedBelow` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), Exists fun bound => LRA.Order.LowerBound relation subset bound

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element

Logical form (Lean):

```lean
def BoundedBelow
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists bound, LowerBound relation subset bound
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases, unfold

-/
def BoundedBelow
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  exists bound, LowerBound relation subset bound

end LRA.Order
