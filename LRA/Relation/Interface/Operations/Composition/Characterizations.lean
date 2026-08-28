import LRA.Relation.Interface.Operations.Composition.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`Transitive.iff_square_included` TODO

Predicate logic:

  Transitive relation ↔ RelationIncluded (RelationComposition relation relation) relation

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop), ∀ (x y z : Alpha), relation x y → relation y z → relation x z ↔ ∀ (x y : Alpha), (Exists fun middle => (relation x middle ∧ relation middle y)) → relation x y

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
