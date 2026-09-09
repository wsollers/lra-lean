import LRA.Order.OrderedSets.PartialOrder.Characterizations
import LRA.Order.OrderedSets.Preorder.Relationships
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
`StrictPart` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (a a_1 : Carrier), (order.relation a a_1 ∧ Ne a a_1)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (order.1 a a_1 ∧ (a = a_1 → False))

Logical form (Lean):

```lean
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.StrictPart order.relation
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
def StrictPart
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.OrderRelation Carrier :=
  LRA.Order.StrictPart order.relation

/--
`StrictPartIff` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right : Carrier), LRA.Order.OrderedSets.PartialOrder.StrictPart order left right ↔ (order.relation left right ∧ Ne left right)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    left right : Carrier
  Prove
    LRA.Order.OrderedSets.PartialOrder.StrictPart order left right ↔ (order.relation left right ∧ Ne left right)

Logical form (Lean):

```lean
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem StrictPartIff
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ left ≠ right := by
  sorry
/--
`StrictPartIffNotConverse` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier) (left right : Carrier), LRA.Order.OrderedSets.PartialOrder.StrictPart order left right ↔ (order.relation left right ∧ ¬ order.relation right left)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    left right : Carrier
  Prove
    LRA.Order.OrderedSets.PartialOrder.StrictPart order left right ↔ (order.relation left right ∧ ¬ order.relation right left)

Logical form (Lean):

```lean
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
theorem StrictPartIffNotConverse
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier)
    (left right : Carrier) :
    StrictPart order left right <->
      order.relation left right /\ Not (order.relation right left) := by
  sorry
/--
`StrictPartRelationIsStrictOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier), LRA.Order.StrictOrder (LRA.Order.OrderedSets.PartialOrder.StrictPart order)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), (order.1 x x ∧ ¬ x = x) → False) ∧ (∀ (x y z : Carrier), (order.1 x y ∧ (x = y → False)) → (order.1 y z ∧ (y = z → False)) → (order.1 x z ∧ (x = z → False))))

Logical form (Lean):

```lean
theorem StrictPartRelationIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order)
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
theorem StrictPartRelationIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry
/--
`StrictPartAsStrictOrder` TODO

Predicate logic:

  def StrictPartAsStrictOrder
      {Carrier : Type u}
      (order : NonStrictPartialOrder Carrier) :
      LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
    relation := StrictPart order
    relationIsStrictOrder := StrictPartRelationIsStrictOrder order

Predicate logic (unfolded):

  def StrictPartAsStrictOrder
      {Carrier : Type u}
      (order : NonStrictPartialOrder Carrier) :
      LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
    relation := StrictPart order
    relationIsStrictOrder := StrictPartRelationIsStrictOrder order (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := StrictPartRelationIsStrictOrder order
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
def StrictPartAsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.OrderedSets.StrictOrder.StrictOrderRelation Carrier where
  relation := StrictPart order
  relationIsStrictOrder := StrictPartRelationIsStrictOrder order

/--
`StrictPartIsStrictOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier), LRA.Order.StrictOrder (LRA.Order.OrderedSets.PartialOrder.StrictPart order)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), (order.1 x x ∧ ¬ x = x) → False) ∧ (∀ (x y z : Carrier), (order.1 x y ∧ (x = y → False)) → (order.1 y z ∧ (y = z → False)) → (order.1 x z ∧ (x = z → False))))

Logical form (Lean):

```lean
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order)
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
theorem StrictPartIsStrictOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.StrictOrder (StrictPart order) := by
  sorry
/--
`DualRelationIsPartialOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier), LRA.Order.PartialOrder (LRA.Relation.Converse order.relation)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), order.1 x x) ∧ ((∀ (x y : Carrier), order.1 y x → order.1 x y → x = y) ∧ (∀ (x y z : Carrier), order.1 y x → order.1 z y → order.1 z x)))

Logical form (Lean):

```lean
theorem DualRelationIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation)
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
theorem DualRelationIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry
/--
`Dual` TODO

Predicate logic:

  def Dual
      {Carrier : Type u}
      (order : NonStrictPartialOrder Carrier) :
      NonStrictPartialOrder Carrier where
    relation := LRA.Relation.Converse order.relation
    relationIsPartialOrder := DualRelationIsPartialOrder order

Predicate logic (unfolded):

  def Dual
      {Carrier : Type u}
      (order : NonStrictPartialOrder Carrier) :
      NonStrictPartialOrder Carrier where
    relation := LRA.Relation.Converse order.relation
    relationIsPartialOrder := DualRelationIsPartialOrder order (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := LRA.Relation.Converse order.relation
  relationIsPartialOrder := DualRelationIsPartialOrder order
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
def Dual
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    NonStrictPartialOrder Carrier where
  relation := LRA.Relation.Converse order.relation
  relationIsPartialOrder := DualRelationIsPartialOrder order

/--
`DualIsPartialOrder` TODO

Predicate logic:

  ∀ {Carrier : Type u} (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier), LRA.Order.PartialOrder (LRA.Relation.Converse order.relation)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (x : Carrier), order.1 x x) ∧ ((∀ (x y : Carrier), order.1 y x → order.1 x y → x = y) ∧ (∀ (x y z : Carrier), order.1 y x → order.1 z y → order.1 z x)))

Logical form (Lean):

```lean
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation)
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
theorem DualIsPartialOrder
    {Carrier : Type u}
    (order : NonStrictPartialOrder Carrier) :
    LRA.Order.PartialOrder
      (LRA.Relation.Converse order.relation) := by
  sorry
end LRA.Order.OrderedSets.PartialOrder
