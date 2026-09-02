import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Interface.Laws.WellFounded

namespace LRA.Order

universe u v

/--
`WellOrderIffLinearAndStrictPartWellFounded` TODO

Predicate logic:

  WellOrder SetObject nonStrictRelation ↔ LinearOrder nonStrictRelation ∧ LRA.Relation.WellFounded SetObject (StrictPart nonStrictRelation)

Predicate logic (unfolded):

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {nonStrictRelation : Element → Element → Prop}, (((∀ (x : Element), nonStrictRelation x x ∧ (∀ (x y : Element), nonStrictRelation x y → nonStrictRelation y x → x = y ∧ ∀ (x y z : Element), nonStrictRelation x y → nonStrictRelation y z → nonStrictRelation x z)) ∧ ∀ (x y : Element), Or (nonStrictRelation x y) (nonStrictRelation y x)) ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun least => (inst.1 subset least ∧ ∀ (element : Element), inst.1 subset element → nonStrictRelation least element)) ↔ (((∀ (x : Element), nonStrictRelation x x ∧ (∀ (x y : Element), nonStrictRelation x y → nonStrictRelation y x → x = y ∧ ∀ (x y z : Element), nonStrictRelation x y → nonStrictRelation y z → nonStrictRelation x z)) ∧ ∀ (x y : Element), Or (nonStrictRelation x y) (nonStrictRelation y x)) ∧ ∀ (subset : SetObject), (Exists fun element => inst.1 subset element) → Exists fun minimum => (inst.1 subset minimum ∧ ∀ (element : Element), inst.1 subset element → (nonStrictRelation element minimum ∧ element = minimum → False) → False))

Logical form (Lean):

```lean
theorem WellOrderIffLinearAndStrictPartWellFounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element} :
    WellOrder SetObject nonStrictRelation ↔
      LinearOrder nonStrictRelation /\
        LRA.Relation.WellFounded SetObject
          (StrictPart nonStrictRelation)
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
theorem WellOrderIffLinearAndStrictPartWellFounded
    {Element : Type u} {SetObject : Type v}
    [Membership Element SetObject]
    {nonStrictRelation : LRA.Relation.Endorelation Element} :
    WellOrder SetObject nonStrictRelation ↔
      LinearOrder nonStrictRelation /\
        LRA.Relation.WellFounded SetObject
          (StrictPart nonStrictRelation) := by
  sorry
end LRA.Order
