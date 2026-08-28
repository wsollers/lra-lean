import LRA.Relation.Interface.Operations.Closure.Reflexive.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`RelationIncludedInReflexiveClosure` TODO

Predicate logic:

  RelationIncluded relation (ReflexiveClosure relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (x y : Alpha), relation x y → Or (relation x y) (x = y)

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

  Reflexive (ReflexiveClosure relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (x : Alpha), Or (relation x x) (x = x)

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

  RelationIncluded (ReflexiveClosure relation) target

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation target : Alpha → Alpha → Prop), (∀ (x y : Alpha), relation x y → target x y ∧ ∀ (x : Alpha), target x x) → ∀ (x y : Alpha), Or (relation x y) (x = y) → target x y

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
