import LRA.Relation.Interface.Canonical.EmptyRelation.Definition
import LRA.Relation.Interface.Laws.Definition

namespace LRA.Relation

universe u v

/--
`EmptyRelationIsRightUnique` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v}, LRA.Relation.RightUnique fun _input _output => False

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    (none)
  Prove
    (False ∧ False) → y₁ = y₂

Logical form (Lean):

```lean
theorem EmptyRelationIsRightUnique {Domain : Type u} {Codomain : Type v} :
    RightUnique (fun _input : Domain => fun _output : Codomain => False)
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
theorem EmptyRelationIsRightUnique {Domain : Type u} {Codomain : Type v} :
    RightUnique (fun _input : Domain => fun _output : Codomain => False) := by
  sorry
end LRA.Relation
