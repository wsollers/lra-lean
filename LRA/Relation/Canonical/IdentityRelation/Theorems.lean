import LRA.Relation.Properties.Definition
import LRA.Relation.Canonical.IdentityRelation.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Relation

universe u v

/--
`IdentityRelationIsReflexive` TODO

Predicate logic:

  Reflexive (IdentityRelation Alpha)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (x : Alpha), x = x

Logical form (Lean):

```lean
theorem IdentityRelationIsReflexive
    {Alpha : Type u} :
    Reflexive (IdentityRelation Alpha)
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
theorem IdentityRelationIsReflexive
    {Alpha : Type u} :
    Reflexive (IdentityRelation Alpha) := by
  sorry

/--
`IdentityRelationIsSymmetric` TODO

Predicate logic:

  Symmetric (IdentityRelation Alpha)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (x y : Alpha), x = y → y = x

Logical form (Lean):

```lean
theorem IdentityRelationIsSymmetric
    {Alpha : Type u} :
    Symmetric (IdentityRelation Alpha)
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
theorem IdentityRelationIsSymmetric
    {Alpha : Type u} :
    Symmetric (IdentityRelation Alpha) := by
  sorry

/--
`IdentityRelationIsTransitive` TODO

Predicate logic:

  Transitive (IdentityRelation Alpha)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (x y z : Alpha), (x = y ∧ y = z) → x = z

Logical form (Lean):

```lean
theorem IdentityRelationIsTransitive
    {Alpha : Type u} :
    Transitive (IdentityRelation Alpha)
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
theorem IdentityRelationIsTransitive
    {Alpha : Type u} :
    Transitive (IdentityRelation Alpha) := by
  sorry

end LRA.Relation
