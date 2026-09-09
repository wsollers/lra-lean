import LRA.Order.OrderedSets.WellOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Interface.Laws.WellFounded

namespace LRA.Order

universe u v

/--
`WellOrderIffLinearAndStrictPartWellFounded` TODO

Predicate logic:

  ∀ {Element : Type u} {SetObject : Type v} [inst : Membership Element SetObject] {nonStrictRelation : LRA.Relation.Endorelation Element}, LRA.Order.WellOrder SetObject nonStrictRelation ↔ (LRA.Order.LinearOrder nonStrictRelation ∧ LRA.Relation.WellFounded SetObject (LRA.Order.StrictPart nonStrictRelation))

Predicate logic (unfolded):

  Ambient
    (Element, SetObject, ∈)
  Objects
    nonStrictRelation : LRA.Relation.Endorelation Element
  Prove
    LRA.Order.WellOrder SetObject nonStrictRelation ↔ (LRA.Order.LinearOrder nonStrictRelation ∧ LRA.Relation.WellFounded SetObject (LRA.Order.StrictPart nonStrictRelation))

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
