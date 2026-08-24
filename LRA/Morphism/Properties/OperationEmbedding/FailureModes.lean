import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

/--
`FailsBinaryOperationEmbedding` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.BinaryEndoOperation Source) (targetOperation : LRA.Operation.BinaryEndoOperation Target), LRA.Morphism.BinaryOperationEmbedding function sourceOperation targetOperation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source → Source) (targetOperation : Target → Target → Target), (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ ∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)) → False

Logical form (Lean):

```lean
def FailsBinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ BinaryOperationEmbedding function sourceOperation targetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
def FailsBinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ BinaryOperationEmbedding function sourceOperation targetOperation

end LRA.Morphism
