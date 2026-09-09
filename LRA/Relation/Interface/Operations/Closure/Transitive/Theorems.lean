import LRA.Relation.Interface.Operations.Closure.Transitive.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`RelationIncludedInTransitiveClosure` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.RelationIncluded relation (LRA.Relation.TransitiveClosure relation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    relation x y → LRA.Relation.TransitiveClosure relation x y

Logical form (Lean):

```lean
theorem RelationIncludedInTransitiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (TransitiveClosure relation)
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
theorem RelationIncludedInTransitiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (TransitiveClosure relation) := by
  sorry
/--
`TransitiveClosureIsTransitive` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Transitive (LRA.Relation.TransitiveClosure relation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    (LRA.Relation.TransitiveClosure relation x y ∧ LRA.Relation.TransitiveClosure relation y z) → LRA.Relation.TransitiveClosure relation x z

Logical form (Lean):

```lean
theorem TransitiveClosureIsTransitive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Transitive (TransitiveClosure relation)
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
theorem TransitiveClosureIsTransitive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Transitive (TransitiveClosure relation) := by
  sorry
/--
`TransitiveClosureIsLeast` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation target : LRA.Relation.Endorelation Alpha), (LRA.Relation.RelationIncluded relation target ∧ LRA.Relation.Transitive target) → LRA.Relation.RelationIncluded (LRA.Relation.TransitiveClosure relation) target

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation target : Endorelation Alpha
    relationIncluded : RelationIncluded relation target
    targetTransitive : Transitive target
  Prove
    ((∀ (x y : Alpha), relation x y → target x y) ∧ (∀ (x y z : Alpha), target x y → target y z → target x z)) → ∀ (x y : Alpha), LRA.Relation.TransitiveClosure relation x y → target x y

Logical form (Lean):

```lean
theorem TransitiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetTransitive : Transitive target) :
    RelationIncluded (TransitiveClosure relation) target
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
theorem TransitiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetTransitive : Transitive target) :
    RelationIncluded (TransitiveClosure relation) target := by
  sorry
end LRA.Relation
