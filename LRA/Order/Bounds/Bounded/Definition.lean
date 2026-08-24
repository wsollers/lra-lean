import LRA.Order.Bounds.BoundedAbove.Definition
import LRA.Order.Bounds.BoundedBelow.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Bounded` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject), (LRA.Order.BoundedAbove relation subset ∧ LRA.Order.BoundedBelow relation subset)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject), (Exists fun bound => ∀ (element : Element), inst.1 subset element → relation element bound ∧ Exists fun bound => ∀ (element : Element), inst.1 subset element → relation bound element)

Logical form (Lean):

```lean
def Bounded
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  BoundedAbove relation subset /\ BoundedBelow relation subset
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def Bounded
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject) : Prop :=
  BoundedAbove relation subset /\ BoundedBelow relation subset

end LRA.Order
