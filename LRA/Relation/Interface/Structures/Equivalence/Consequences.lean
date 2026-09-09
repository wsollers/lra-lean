import LRA.Relation.Interface.Structures.Definition

namespace LRA.Relation

universe u v

/--
`EquivalenceRelation.reflexive` TODO

Predicate logic:

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.EquivalenceRelation relation → LRA.Relation.Reflexive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
    equivalence : EquivalenceRelation relation
  Prove
    ((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) → ∀ (x : Alpha), relation x x

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

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.EquivalenceRelation relation → LRA.Relation.Symmetric relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
    equivalence : EquivalenceRelation relation
  Prove
    ((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) → ∀ (x y : Alpha), relation x y → relation y x

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

  ∀ {Alpha : Type u} {relation : LRA.Relation.Endorelation Alpha}, LRA.Relation.EquivalenceRelation relation → LRA.Relation.Transitive relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
    equivalence : EquivalenceRelation relation
  Prove
    ((∀ (x : Alpha), relation x x) ∧ ((∀ (x y : Alpha), relation x y → relation y x) ∧ (∀ (x y z : Alpha), relation x y → relation y z → relation x z))) → ∀ (x y z : Alpha), (relation x y ∧ relation y z) → relation x z

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
