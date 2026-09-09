import LRA.Relation.Interface.Operations.Closure.Reflexive.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`RelationIncludedInReflexiveClosure` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.RelationIncluded relation (LRA.Relation.ReflexiveClosure relation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    relation x y → Or (relation x y) (x = y)

Logical form (Lean):

```lean
theorem RelationIncludedInReflexiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (ReflexiveClosure relation)
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
theorem RelationIncludedInReflexiveClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (ReflexiveClosure relation) := by
  sorry
/--
`ReflexiveClosureIsReflexive` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation : LRA.Relation.Endorelation Alpha), LRA.Relation.Reflexive (LRA.Relation.ReflexiveClosure relation)

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation : Endorelation Alpha
  Prove
    Or (relation x x) (x = x)

Logical form (Lean):

```lean
theorem ReflexiveClosureIsReflexive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Reflexive (ReflexiveClosure relation)
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
theorem ReflexiveClosureIsReflexive
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Reflexive (ReflexiveClosure relation) := by
  sorry
/--
`ReflexiveClosureIsLeast` TODO

Predicate logic:

  ∀ {Alpha : Type u} (relation target : LRA.Relation.Endorelation Alpha), (LRA.Relation.RelationIncluded relation target ∧ LRA.Relation.Reflexive target) → LRA.Relation.RelationIncluded (LRA.Relation.ReflexiveClosure relation) target

Predicate logic (unfolded):

  Ambient
    (Alpha)
  Objects
    relation target : Endorelation Alpha
    relationIncluded : RelationIncluded relation target
    targetReflexive : Reflexive target
  Prove
    ((∀ (x y : Alpha), relation x y → target x y) ∧ (∀ (x : Alpha), target x x)) → ∀ (x y : Alpha), Or (relation x y) (x = y) → target x y

Logical form (Lean):

```lean
theorem ReflexiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetReflexive : Reflexive target) :
    RelationIncluded (ReflexiveClosure relation) target
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
theorem ReflexiveClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetReflexive : Reflexive target) :
    RelationIncluded (ReflexiveClosure relation) target := by
  sorry
end LRA.Relation
