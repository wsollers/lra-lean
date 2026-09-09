import LRA.Relation.Interface.Operations.Composition.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`Transitive.iff_square_included` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Transitive relation ↔ LRA.Relation.RelationIncluded (LRA.Relation.RelationComposition relation relation) relation

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    LRA.Relation.Transitive relation ↔ LRA.Relation.RelationIncluded (LRA.Relation.RelationComposition relation relation) relation

Logical form (Lean):

```lean
theorem Transitive.iff_square_included
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive relation ↔
      RelationIncluded (RelationComposition relation relation) relation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem Transitive.iff_square_included
    {Alpha : Type u}
    (relation : Endorelation Alpha) :
    Transitive relation ↔
      RelationIncluded (RelationComposition relation relation) relation := by
  sorry
end LRA.Relation
