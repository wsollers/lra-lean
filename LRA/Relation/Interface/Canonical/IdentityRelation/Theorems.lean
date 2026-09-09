import LRA.Relation.Interface.Laws.Definition
import LRA.Relation.Interface.Canonical.IdentityRelation.Definition
import LRA.Relation.Interface.Operations.Converse.Definition

namespace LRA.Relation

universe u v

/--
`IdentityRelationIsReflexive` TODO

Predicate logic:

  ∀ {Alpha : Type u}, LRA.Relation.Reflexive (LRA.Relation.IdentityRelation Alpha)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    x = x

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

  ∀ {Alpha : Type u}, LRA.Relation.Symmetric (LRA.Relation.IdentityRelation Alpha)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    x = y → y = x

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

  ∀ {Alpha : Type u}, LRA.Relation.Transitive (LRA.Relation.IdentityRelation Alpha)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    (none)
  Prove
    (x = y ∧ y = z) → x = z

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
