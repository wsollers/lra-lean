import LRA.Relation.Interface.Structures.Definition

namespace LRA.Relation

universe u v

/--
`EquivalenceRelation.reflexive` TODO

Predicate logic:

  Reflexive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ (x : Alpha), relation x x

Logical form (Lean):

```lean
theorem EquivalenceRelation.reflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Reflexive relation
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
theorem EquivalenceRelation.reflexive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Reflexive relation := by
  sorry
/--
`EquivalenceRelation.symmetric` TODO

Predicate logic:

  Symmetric relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ (x y : Alpha), relation x y → relation y x

Logical form (Lean):

```lean
theorem EquivalenceRelation.symmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Symmetric relation
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
theorem EquivalenceRelation.symmetric
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Symmetric relation := by
  sorry
/--
`EquivalenceRelation.transitive` TODO

Predicate logic:

  Transitive relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} {relation : Alpha → Alpha → Prop}, (∀ (x : Alpha), relation x x ∧ (∀ (x y : Alpha), relation x y → relation y x ∧ ∀ (x y z : Alpha), relation x y → relation y z → relation x z)) → ∀ (x y z : Alpha), (relation x y ∧ relation y z) → relation x z

Logical form (Lean):

```lean
theorem EquivalenceRelation.transitive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Transitive relation
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
theorem EquivalenceRelation.transitive
    {Alpha : Type u}
    {relation : Endorelation Alpha}
    (equivalence : EquivalenceRelation relation) :
    Transitive relation := by
  sorry
end LRA.Relation
