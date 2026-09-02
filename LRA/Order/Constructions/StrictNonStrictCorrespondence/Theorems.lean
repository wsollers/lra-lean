import LRA.Order.Constructions.StrictNonStrictCorrespondence.Definition
import LRA.Order.OrderedSets.LinearOrder.Definition
import LRA.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/--
`StrictOrderInducesPartialOrder` TODO

Predicate logic:

  PartialOrder (NonStrictFromStrict strictRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {strictRelation : Alpha → Alpha → Prop}, (∀ (x : Alpha), strictRelation x x → False ∧ ∀ (x y z : Alpha), strictRelation x y → strictRelation y z → strictRelation x z) → (∀ (x : Alpha), Or (strictRelation x x) (x = x) ∧ (∀ (x y : Alpha), Or (strictRelation x y) (x = y) → Or (strictRelation y x) (y = x) → x = y ∧ ∀ (x y z : Alpha), Or (strictRelation x y) (x = y) → Or (strictRelation y z) (y = z) → Or (strictRelation x z) (x = z)))

Logical form (Lean):

```lean
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation)
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
theorem StrictOrderInducesPartialOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictOrder : StrictOrder strictRelation) :
    PartialOrder (NonStrictFromStrict strictRelation) := by
  sorry
/--
`PartialOrderInducesStrictOrder` TODO

Predicate logic:

  StrictOrder (StrictFromNonStrict nonStrictRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {nonStrictRelation : Alpha → Alpha → Prop}, (∀ (x : Alpha), nonStrictRelation x x ∧ (∀ (x y : Alpha), nonStrictRelation x y → nonStrictRelation y x → x = y ∧ ∀ (x y z : Alpha), nonStrictRelation x y → nonStrictRelation y z → nonStrictRelation x z)) → (∀ (x : Alpha), (nonStrictRelation x x ∧ ¬ x = x) → False ∧ ∀ (x y z : Alpha), (nonStrictRelation x y ∧ x = y → False) → (nonStrictRelation y z ∧ y = z → False) → (nonStrictRelation x z ∧ x = z → False))

Logical form (Lean):

```lean
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation)
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
theorem PartialOrderInducesStrictOrder
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsPartialOrder : PartialOrder nonStrictRelation) :
    StrictOrder (StrictFromNonStrict nonStrictRelation) := by
  sorry
/--
`StrictLinearOrderInducesLinearOrder` TODO

Predicate logic:

  LinearOrder (NonStrictFromStrict strictRelation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {strictRelation : Alpha → Alpha → Prop}, ((∀ (x : Alpha), strictRelation x x → False ∧ ∀ (x y z : Alpha), strictRelation x y → strictRelation y z → strictRelation x z) ∧ ∀ (x y : Alpha), Or ((strictRelation x y ∧ (x = y → False ∧ strictRelation y x → False))) (Or ((x = y ∧ (strictRelation x y → False ∧ strictRelation y x → False))) ((strictRelation y x ∧ (strictRelation x y → False ∧ x = y → False))))) → ((∀ (x : Alpha), Or (strictRelation x x) (x = x) ∧ (∀ (x y : Alpha), Or (strictRelation x y) (x = y) → Or (strictRelation y x) (y = x) → x = y ∧ ∀ (x y z : Alpha), Or (strictRelation x y) (x = y) → Or (strictRelation y z) (y = z) → Or (strictRelation x z) (x = z))) ∧ ∀ (x y : Alpha), Or (Or (strictRelation x y) (x = y))(Or (strictRelation y x) (y = x)))

Logical form (Lean):

```lean
theorem StrictLinearOrderInducesLinearOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    LinearOrder (NonStrictFromStrict strictRelation)
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
theorem StrictLinearOrderInducesLinearOrder
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsStrictLinearOrder : StrictLinearOrder strictRelation) :
    LinearOrder (NonStrictFromStrict strictRelation) := by
  sorry
/--
`StrictNonStrictInverseCorrespondence` TODO

Predicate logic:

  StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {strictRelation : Alpha → Alpha → Prop}, (∀ (x : Alpha), strictRelation x x → False) → fun left right => (Or (strictRelation left right) (left = right) ∧ left = right → False) = strictRelation

Logical form (Lean):

```lean
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsIrreflexive : LRA.Relation.Irreflexive strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation
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
theorem StrictNonStrictInverseCorrespondence
    {Alpha : Type u}
    {strictRelation : LRA.Relation.Endorelation Alpha}
    (strictRelationIsIrreflexive : LRA.Relation.Irreflexive strictRelation) :
    StrictFromNonStrict (NonStrictFromStrict strictRelation) = strictRelation := by
  sorry
/--
`NonStrictStrictInverseCorrespondence` TODO

Predicate logic:

  NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) = nonStrictRelation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {nonStrictRelation : Alpha → Alpha → Prop}, (∀ (x : Alpha), nonStrictRelation x x) → fun left right => Or ((nonStrictRelation left right ∧ left = right → False)) (left = right) = nonStrictRelation

Logical form (Lean):

```lean
theorem NonStrictStrictInverseCorrespondence
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsReflexive : LRA.Relation.Reflexive nonStrictRelation) :
    NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) = nonStrictRelation
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
theorem NonStrictStrictInverseCorrespondence
    {Alpha : Type u}
    {nonStrictRelation : LRA.Relation.Endorelation Alpha}
    (nonStrictRelationIsReflexive : LRA.Relation.Reflexive nonStrictRelation) :
    NonStrictFromStrict (StrictFromNonStrict nonStrictRelation) = nonStrictRelation := by
  sorry
/--
`PosetOfStrictPosetOfPoset` TODO

Predicate logic:

  (∀ poset ∈ Poset), PosetOfStrictPoset (StrictPosetOfPoset poset) = poset

Predicate logic (unfolded):

  ∀ (poset : LRA.Order.Poset), { Carrier := (LRA.Order.StrictPosetOfPoset poset).1, NonStrictOrder := fun left right => Or ((LRA.Order.StrictPosetOfPoset poset).2 left right) (left = right), NonStrictOrderIsPartialOrder := ⋯ } = poset

Logical form (Lean):

```lean
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset
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
theorem PosetOfStrictPosetOfPoset (poset : Poset) :
    PosetOfStrictPoset (StrictPosetOfPoset poset) = poset := by
  sorry
/--
`StrictPosetOfPosetOfStrictPoset` TODO

Predicate logic:

  (∀ strictPoset ∈ StrictPoset), StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset

Predicate logic (unfolded):

  ∀ (strictPoset : LRA.Order.StrictPoset), { Carrier := (LRA.Order.PosetOfStrictPoset strictPoset).1, StrictRelation := fun left right => ((LRA.Order.PosetOfStrictPoset strictPoset).2 left right ∧ left = right → False), StrictRelationIsStrictOrder := ⋯ } = strictPoset

Logical form (Lean):

```lean
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset
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
theorem StrictPosetOfPosetOfStrictPoset (strictPoset : StrictPoset) :
    StrictPosetOfPoset (PosetOfStrictPoset strictPoset) = strictPoset := by
  sorry
end LRA.Order
