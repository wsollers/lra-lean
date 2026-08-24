import LRA.Order.Bounds.LeastElement.Definition
import LRA.Set.Interface.Operations

namespace LRA.Order

open scoped LRA.Set

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]
variable [LRA.Set.HasUniversal SetObject]

/--
`BottomElement` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] (relation : LRA.Relation.Endorelation Element) (bottom : Element), (bottom ∈ inst_1.universal ∧ LRA.Order.LowerBound relation inst_1.universal bottom)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] [inst_1 : LRA.Set.HasUniversal SetObject] (relation : Element → Element → Prop) (bottom : Element), (inst.1 inst_1.1 bottom ∧ ∀ (element : Element), inst.1 inst_1.1 element → relation bottom element)

Logical form (Lean):

```lean
def BottomElement
    (relation : LRA.Relation.Endorelation Element)
    (bottom : Element) : Prop :=
  LeastElement relation (𝒰 : SetObject) bottom
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
def BottomElement
    (relation : LRA.Relation.Endorelation Element)
    (bottom : Element) : Prop :=
  LeastElement relation (𝒰 : SetObject) bottom

end LRA.Order
