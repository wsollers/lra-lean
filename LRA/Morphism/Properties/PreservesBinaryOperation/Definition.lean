import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesBinaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.BinaryEndoOperation Source) (targetOperation : LRA.Operation.BinaryEndoOperation Target) (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source → Source) (targetOperation : Target → Target → Target) (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)

Logical form (Lean):

```lean
def PreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ∀ left right,
    function (sourceOperation left right) =
      targetOperation (function left) (function right)
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
def PreservesBinaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.BinaryEndoOperation Source)
    (targetOperation : LRA.Operation.BinaryEndoOperation Target) : Prop :=
  ∀ left right,
    function (sourceOperation left right) =
      targetOperation (function left) (function right)

end LRA.Morphism
