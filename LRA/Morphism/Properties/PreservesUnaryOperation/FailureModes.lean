import LRA.Morphism.Properties.PreservesUnaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`FailsPreservesUnaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.UnaryEndoOperation Source) (targetOperation : LRA.Operation.UnaryEndoOperation Target), LRA.Morphism.PreservesUnaryOperation function sourceOperation targetOperation → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source) (targetOperation : Target → Target), (∀ (element : Source), function (sourceOperation element) = targetOperation (function element)) → False

Logical form (Lean):

```lean
def FailsPreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ¬ PreservesUnaryOperation function sourceOperation targetOperation
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
def FailsPreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ¬ PreservesUnaryOperation function sourceOperation targetOperation

end LRA.Morphism
