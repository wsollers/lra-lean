import LRA.Function.Properties.Definition
import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`BinaryOperationEmbedding` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.BinaryEndoOperation Source) (targetOperation : LRA.Operation.BinaryEndoOperation Target), (LRA.Function.Injective function ∧ LRA.Morphism.PreservesBinaryOperation function sourceOperation targetOperation)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source → Source) (targetOperation : Target → Target → Target), (∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ ∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right))

Logical form (Lean):

```lean
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  LRA.Function.Injective function ∧
    PreservesBinaryOperation function sourceOperation targetOperation
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def BinaryOperationEmbedding {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  LRA.Function.Injective function ∧
    PreservesBinaryOperation function sourceOperation targetOperation

end LRA.Morphism
