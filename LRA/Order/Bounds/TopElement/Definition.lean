import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Set.Interface.Operations

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]

/--
`TopElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] (relation : LRA.Relation.Endorelation Element) (top : Element), (top ∈ inst_1.universal ∧ LRA.Order.UpperBound relation inst_1.universal top)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] (relation : Element → Element → Prop) (top : Element), (inst.1 inst_1.1 top ∧ ∀ (element : Element), inst.1 inst_1.1 element → relation element top)

Logical form (Lean):

```lean
def TopElement
    (relation : LRA.Relation.Endorelation Element)
    (top : Element) : Prop :=
  GreatestElement relation (𝒰 : SetObject) top
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
def TopElement
    (relation : LRA.Relation.Endorelation Element)
    (top : Element) : Prop :=
  GreatestElement relation (𝒰 : SetObject) top

end LRA.Order
