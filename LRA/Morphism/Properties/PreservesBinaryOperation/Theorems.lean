import LRA.Morphism.Properties.PreservesBinaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesBinaryOperation.apply` TODO

Predicate logic:

  (∀ left right ∈ Source), function (sourceOperation left right) = targetOperation (function left) (function right)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceOperation : Source → Source → Source} {targetOperation : Target → Target → Target}, (∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)) → ∀ (left right : Source), function (sourceOperation left right) = targetOperation (function left) (function right)

Logical form (Lean):

```lean
theorem PreservesBinaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : PreservesBinaryOperation function sourceOperation targetOperation)
    (left right : Source) :
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

Related proof moves: intro

-/
theorem PreservesBinaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.BinaryEndoOperation Source}
    {targetOperation : LRA.Operation.BinaryEndoOperation Target}
    (law : PreservesBinaryOperation function sourceOperation targetOperation)
    (left right : Source) :
    function (sourceOperation left right) =
      targetOperation (function left) (function right) := by
  sorry
end LRA.Morphism
