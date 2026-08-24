import LRA.Relation.Operations.Converse.Theorems

namespace LRA.Relation

universe u v

/--
`Asymmetric.implies_irreflexive` TODO

Predicate logic:

  Irreflexive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x y : Alpha), relation x y → relation y x → False) → ∀ (x : Alpha), relation x x → False

Logical form (Lean):

```lean
theorem Asymmetric.implies_irreflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Irreflexive relation
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
theorem Asymmetric.implies_irreflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Irreflexive relation := by
  sorry

/--
`Irreflexive.transitive_implies_asymmetric` TODO

Predicate logic:

  Asymmetric relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x → False ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z) → ∀ (x y : Alpha), (relation x y ∧ relation y x) → False

Logical form (Lean):

```lean
theorem Irreflexive.transitive_implies_asymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (irreflexive : Irreflexive relation)
    (transitive : Transitive relation) :
    Asymmetric relation
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
theorem Irreflexive.transitive_implies_asymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (irreflexive : Irreflexive relation)
    (transitive : Transitive relation) :
    Asymmetric relation := by
  sorry

/--
`Asymmetric.implies_antisymmetric` TODO

Predicate logic:

  Antisymmetric relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x y : Alpha), relation x y → relation y x → False) → ∀ (x y : Alpha), (relation x y ∧ relation y x) → x = y

Logical form (Lean):

```lean
theorem Asymmetric.implies_antisymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Antisymmetric relation
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
theorem Asymmetric.implies_antisymmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (asymmetric : Asymmetric relation) :
    Antisymmetric relation := by
  sorry

/--
`Symmetric.antisymmetric_related_implies_equal` TODO

Predicate logic:

  left = right

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x y : Alpha), relation x y → relation y x ∧ ∀ (x y : Alpha), relation x y → relation y x → x = y) → ∀ {left right : Alpha}, relation left right → left = right

Logical form (Lean):

```lean
theorem Symmetric.antisymmetric_related_implies_equal
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (symmetric : Symmetric relation)
    (antisymmetric : Antisymmetric relation)
    {left right : Alpha}
    (related : relation left right) :
    left = right
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
theorem Symmetric.antisymmetric_related_implies_equal
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (symmetric : Symmetric relation)
    (antisymmetric : Antisymmetric relation)
    {left right : Alpha}
    (related : relation left right) :
    left = right := by
  sorry

/--
`Reflexive.asymmetric_contradiction_at` TODO

Predicate logic:

  (∀ element ∈ Alpha), False

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.Reflexive relation → LRA.Relation.Asymmetric relation → ∀ (element : Alpha), False (compiled unfold unavailable; showing predicate logic)

Logical form (Lean):

```lean
theorem Reflexive.asymmetric_contradiction_at
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (reflexive : Reflexive relation)
    (asymmetric : Asymmetric relation)
    (element : Alpha) :
    False
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
theorem Reflexive.asymmetric_contradiction_at
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (reflexive : Reflexive relation)
    (asymmetric : Asymmetric relation)
    (element : Alpha) :
    False := by
  sorry

end LRA.Relation
