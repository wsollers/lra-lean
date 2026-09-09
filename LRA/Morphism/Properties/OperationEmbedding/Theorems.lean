import LRA.Morphism.Properties.PreservesBinaryOperation.Theorems
import LRA.Morphism.Properties.OperationEmbedding.Definition

namespace LRA.Morphism

universe u v

section OperationEmbedding

variable {Source : Type u} {Target : Type v}
variable {function : Source → Target}
variable {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
variable {targetOperation : LRA.Operation.BinaryEndoOperation Target}

/--
`BinaryOperationEmbedding.injective` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceOperation : LRA.Operation.BinaryEndoOperation Source} {targetOperation : LRA.Operation.BinaryEndoOperation Target}, LRA.Morphism.BinaryOperationEmbedding function sourceOperation targetOperation → LRA.Function.Injective function

Predicate logic (unfolded):

  Ambient
    (Source, Target)
  Objects
    function : Source → Target
    sourceOperation : LRA.Operation.BinaryEndoOperation Source
    targetOperation : LRA.Operation.BinaryEndoOperation Target
    law : BinaryOperationEmbedding function sourceOperation targetOperation
  Prove
    ((∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂) ∧ (∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right))) → ∀ (y : Target) (x₁ x₂ : Source), (function x₁ = y ∧ function x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem BinaryOperationEmbedding.injective
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    LRA.Function.Injective function
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
theorem BinaryOperationEmbedding.injective
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    LRA.Function.Injective function := by
  sorry
/--
`BinaryOperationEmbedding.preserves` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceOperation : LRA.Operation.BinaryEndoOperation Source} {targetOperation : LRA.Operation.BinaryEndoOperation Target}, LRA.Morphism.BinaryOperationEmbedding function sourceOperation targetOperation → LRA.Morphism.PreservesBinaryOperation function sourceOperation targetOperation

Predicate logic (unfolded):

  Ambient
    (Source, Target)
  Objects
    function : Source → Target
    sourceOperation : LRA.Operation.BinaryEndoOperation Source
    targetOperation : LRA.Operation.BinaryEndoOperation Target
    law : BinaryOperationEmbedding function sourceOperation targetOperation
  Prove
    ((∀ (y : Target) (x₁ x₂ : Source), function x₁ = y → function x₂ = y → x₁ = x₂) ∧ (∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right))) → ∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)

Logical form (Lean):

```lean
theorem BinaryOperationEmbedding.preserves
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
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

Related proof moves: TODO

-/
theorem BinaryOperationEmbedding.preserves
    (law : BinaryOperationEmbedding function sourceOperation targetOperation) :
    PreservesBinaryOperation function sourceOperation targetOperation := by
  sorry
end OperationEmbedding

end LRA.Morphism
