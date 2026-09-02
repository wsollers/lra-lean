import LRA.Relation.Interface.Operations.Closure.Symmetric.Definition
import LRA.Relation.Interface.Laws

namespace LRA.Relation

universe u

/--
`RelationIncludedInSymmetricClosure` TODO

Predicate logic:

  RelationIncluded relation (SymmetricClosure relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (x y : Alpha), relation x y → Or (relation x y) (relation y x)

Logical form (Lean):

```lean
theorem RelationIncludedInSymmetricClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (SymmetricClosure relation)
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
theorem RelationIncludedInSymmetricClosure
    {Alpha : Type u} (relation : Endorelation Alpha) :
    RelationIncluded relation (SymmetricClosure relation) := by
  sorry
/--
`SymmetricClosureIsSymmetric` TODO

Predicate logic:

  Symmetric (SymmetricClosure relation)

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation : Alpha → Alpha → Prop) (x y : Alpha), Or (relation x y) (relation y x) → Or (relation y x) (relation x y)

Logical form (Lean):

```lean
theorem SymmetricClosureIsSymmetric
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Symmetric (SymmetricClosure relation)
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
theorem SymmetricClosureIsSymmetric
    {Alpha : Type u} (relation : Endorelation Alpha) :
    Symmetric (SymmetricClosure relation) := by
  sorry
/--
`SymmetricClosureIsLeast` TODO

Predicate logic:

  RelationIncluded (SymmetricClosure relation) target

Predicate logic (unfolded):

  ∀ {Alpha : Type u} (relation target : Alpha → Alpha → Prop), (∀ (x y : Alpha), relation x y → target x y ∧ ∀ (x y : Alpha), target x y → target y x) → ∀ (x y : Alpha), Or (relation x y) (relation y x) → target x y

Logical form (Lean):

```lean
theorem SymmetricClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetSymmetric : Symmetric target) :
    RelationIncluded (SymmetricClosure relation) target
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
theorem SymmetricClosureIsLeast
    {Alpha : Type u} (relation target : Endorelation Alpha)
    (relationIncluded : RelationIncluded relation target)
    (targetSymmetric : Symmetric target) :
    RelationIncluded (SymmetricClosure relation) target := by
  sorry
end LRA.Relation
