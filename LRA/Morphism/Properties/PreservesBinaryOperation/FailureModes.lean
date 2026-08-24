import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`FailsPreservesBinaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.BinaryEndoOperation Source) (targetOperation : LRA.Operation.BinaryEndoOperation Target), LRA.Morphism.PreservesBinaryOperation function sourceOperation targetOperation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source → Source) (targetOperation : Target → Target → Target), (∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)) → False

Logical form (Lean):

```lean
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ PreservesBinaryOperation function sourceOperation targetOperation
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
def FailsPreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ¬ PreservesBinaryOperation function sourceOperation targetOperation

end LRA.Morphism
