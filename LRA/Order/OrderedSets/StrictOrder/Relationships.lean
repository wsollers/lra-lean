import LRA.Order.OrderedSets.PartialOrder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Characterizations
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order.OrderedSets.StrictOrder

universe u

/--
`ReflexiveClosure` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (a a_1 : Carrier), Or (order.relation a a_1) (a = a_1)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (a a_1 : Carrier), Or (order.1 a a_1) (a = a_1)

Logical form (Lean):

```lean
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.LessThanOrEqual order.relation
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
def ReflexiveClosure
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.LessThanOrEqual order.relation

/--
`ReflexiveClosureIff` TODO

Predicate logic:

  (∀ left right ∈ Carrier), ReflexiveClosure order left right <-> order.relation left right ∨ left = right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (left right : Carrier), Or (order.1 left right) (left = right) ↔ Or (order.1 left right) (left = right)

Logical form (Lean):

```lean
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, Or.inl, Or.inr, cases, rcases

-/
theorem ReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    ReflexiveClosure order left right <->
      order.relation left right \/ left = right := by
  sorry
/--
`ReflexiveClosureRelationIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder (ReflexiveClosure order)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier), (∀ (x : Carrier), Or (order.1 x x) (x = x) ∧ (∀ (x y : Carrier), Or (order.1 x y) (x = y) → Or (order.1 y x) (y = x) → x = y ∧ ∀ (x y z : Carrier), Or (order.1 x y) (x = y) → Or (order.1 y z) (y = z) → Or (order.1 x z) (x = z)))

Logical form (Lean):

```lean
theorem ReflexiveClosureRelationIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ReflexiveClosureRelationIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  sorry
/--
`ReflexiveClosureAsPartialOrder` TODO

Predicate logic:

  def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order

Predicate logic (unfolded):

  def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order
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
def ReflexiveClosureAsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier where
  relation := ReflexiveClosure order
  relationIsPartialOrder := ReflexiveClosureRelationIsPartialOrder order

/--
`ReflexiveClosureIsPartialOrder` TODO

Predicate logic:

  LRA.Order.PartialOrder (ReflexiveClosure order)

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier), (∀ (x : Carrier), Or (order.1 x x) (x = x) ∧ (∀ (x y : Carrier), Or (order.1 x y) (x = y) → Or (order.1 y x) (y = x) → x = y ∧ ∀ (x y z : Carrier), Or (order.1 x y) (x = y) → Or (order.1 y z) (y = z) → Or (order.1 x z) (x = z)))

Logical form (Lean):

```lean
theorem ReflexiveClosureIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ReflexiveClosureIsPartialOrder
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier) :
    LRA.Order.PartialOrder (ReflexiveClosure order) := by
  sorry
/--
`StrictPartOfReflexiveClosureIff` TODO

Predicate logic:

  (∀ left right ∈ Carrier), LRA.Order.OrderedSets.PartialOrder.StrictPart (ReflexiveClosureAsPartialOrder order) left right <-> order.relation left right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier) (left right : Carrier), ((LRA.Order.OrderedSets.StrictOrder.ReflexiveClosureAsPartialOrder order).1 left right ∧ left = right → False) ↔ order.1 left right

Logical form (Lean):

```lean
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    LRA.Order.OrderedSets.PartialOrder.StrictPart
      (ReflexiveClosureAsPartialOrder order) left right <->
      order.relation left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem StrictPartOfReflexiveClosureIff
    {Carrier : Type u}
    (order : StrictOrderRelation Carrier)
    (left right : Carrier) :
    LRA.Order.OrderedSets.PartialOrder.StrictPart
      (ReflexiveClosureAsPartialOrder order) left right <->
      order.relation left right := by
  sorry
/--
`ReflexiveClosureOfStrictPartIff` TODO

Predicate logic:

  (∀ left right ∈ Carrier), ReflexiveClosure (LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder order) left right <-> order.relation left right

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.PartialOrderRelation Carrier) (left right : Carrier), Or ((LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder order).1 left right) (left = right) ↔ order.1 left right

Logical form (Lean):

```lean
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder
      Carrier)
    (left right : Carrier) :
    ReflexiveClosure
        (LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder
          order) left right <->
      order.relation left right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem ReflexiveClosureOfStrictPartIff
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder
      Carrier)
    (left right : Carrier) :
    ReflexiveClosure
        (LRA.Order.OrderedSets.PartialOrder.StrictPartAsStrictOrder
          order) left right <->
      order.relation left right := by
  sorry
end LRA.Order.OrderedSets.StrictOrder
