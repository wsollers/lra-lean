import LRA.Order.Bounds.LowerBound.Definition

namespace LRA.Order

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

/--
`Infimum` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : LRA.Relation.Endorelation Element) (subset : SetObject) (infimum : Element), (LRA.Order.LowerBound relation subset infimum ∧ ∀ (bound : Element), LRA.Order.LowerBound relation subset bound → relation bound infimum)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] (relation : Element → Element → Prop) (subset : SetObject) (infimum : Element), (∀ (element : Element), inst.1 subset element → relation infimum element ∧ ∀ (bound : Element), (∀ (element : Element), inst.1 subset element → relation bound element) → relation bound infimum)

Logical form (Lean):

```lean
def Infimum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def Infimum
    (relation : LRA.Relation.Endorelation Element)
    (subset : SetObject)
    (infimum : Element) : Prop :=
  LowerBound relation subset infimum /\
    forall bound, LowerBound relation subset bound -> relation bound infimum

end LRA.Order
