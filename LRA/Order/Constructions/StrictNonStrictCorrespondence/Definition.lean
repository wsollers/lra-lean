import LRA.Order.OrderedSets.PartialOrder.Definition
import LRA.Order.OrderedSets.Poset.Definition
import LRA.Order.OrderedSets.StrictOrder.Definition
import LRA.Order.OrderedSets.StrictPoset.Definition
import LRA.Order.Relation.StrictPart.Definition
import LRA.Order.Relation.LessThanOrEqual.Definition

namespace LRA.Order

universe u

/--
`NonStrictFromStrict` TODO

Predicate logic:

  ∀ {Alpha : Type u} (strictRelation : LRA.Relation.Endorelation Alpha) (a a_1 : Alpha), Or (strictRelation a a_1) (a = a_1)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (strictRelation : Alpha → Alpha → Prop) (a a_1 : Alpha), Or (strictRelation a a_1) (a = a_1)

Logical form (Lean):

```lean
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  LessThanOrEqual strictRelation
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
def NonStrictFromStrict {Alpha : Type u}
    (strictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  LessThanOrEqual strictRelation

/--
`StrictFromNonStrict` TODO

Predicate logic:

  ∀ {Alpha : Type u} (nonStrictRelation : LRA.Relation.Endorelation Alpha) (a a_1 : Alpha), (nonStrictRelation a a_1 ∧ Ne a a_1)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (nonStrictRelation : Alpha → Alpha → Prop) (a a_1 : Alpha), (nonStrictRelation a a_1 ∧ a = a_1 → False)

Logical form (Lean):

```lean
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  StrictPart nonStrictRelation
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
def StrictFromNonStrict {Alpha : Type u}
    (nonStrictRelation : LRA.Relation.Endorelation Alpha) :
    LRA.Relation.Endorelation Alpha :=
  StrictPart nonStrictRelation

/--
`StrictRelationOfPosetIsStrictOrder` TODO

Predicate logic:

  (∀ poset ∈ Poset), LRA.Order.StrictOrder (StrictFromNonStrict poset.NonStrictOrder)

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset), (∀ (x : poset.1), (poset.2 x x ∧ ¬ x = x) → False ∧ ∀ (x y z : poset.1), (poset.2 x y ∧ x = y → False) → (poset.2 y z ∧ y = z → False) → (poset.2 x z ∧ x = z → False))

Logical form (Lean):

```lean
theorem StrictRelationOfPosetIsStrictOrder (poset : Poset) :
    LRA.Order.StrictOrder (StrictFromNonStrict poset.NonStrictOrder)
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
theorem StrictRelationOfPosetIsStrictOrder (poset : Poset) :
    LRA.Order.StrictOrder (StrictFromNonStrict poset.NonStrictOrder) := by
  sorry

/--
`StrictPosetOfPoset` TODO

Predicate logic:

  def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset

Predicate logic (unfolded):

  def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset
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
def StrictPosetOfPoset (poset : Poset) : StrictPoset where
  Carrier := poset.Carrier
  StrictRelation := StrictFromNonStrict poset.NonStrictOrder
  StrictRelationIsStrictOrder := StrictRelationOfPosetIsStrictOrder poset

/--
`NonStrictRelationOfStrictPosetIsPartialOrder` TODO

Predicate logic:

  (∀ strictPoset ∈ StrictPoset), LRA.Order.PartialOrder (NonStrictFromStrict strictPoset.StrictRelation)

Predicate logic (unfolded):

  ∀ (strictPoset : LRA.Order.StrictPoset), (∀ (x : strictPoset.1), Or (strictPoset.2 x x) (x = x) ∧ (∀ (x y : strictPoset.1), Or (strictPoset.2 x y) (x = y) → Or (strictPoset.2 y x) (y = x) → x = y ∧ ∀ (x y z : strictPoset.1), Or (strictPoset.2 x y) (x = y) → Or (strictPoset.2 y z) (y = z) → Or (strictPoset.2 x z) (x = z)))

Logical form (Lean):

```lean
theorem NonStrictRelationOfStrictPosetIsPartialOrder
    (strictPoset : StrictPoset) :
    LRA.Order.PartialOrder
      (NonStrictFromStrict strictPoset.StrictRelation)
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
theorem NonStrictRelationOfStrictPosetIsPartialOrder
    (strictPoset : StrictPoset) :
    LRA.Order.PartialOrder
      (NonStrictFromStrict strictPoset.StrictRelation) := by
  sorry

/--
`PosetOfStrictPoset` TODO

Predicate logic:

  def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset

Predicate logic (unfolded):

  def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset
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
def PosetOfStrictPoset (strictPoset : StrictPoset) : Poset where
  Carrier := strictPoset.Carrier
  NonStrictOrder := NonStrictFromStrict strictPoset.StrictRelation
  NonStrictOrderIsPartialOrder :=
    NonStrictRelationOfStrictPosetIsPartialOrder strictPoset

end LRA.Order
