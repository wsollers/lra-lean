import LRA.Morphism.Properties.PreservesUnaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesUnaryOperation.apply` TODO

Predicate logic:

  (∀ element ∈ Source), function (sourceOperation element) = targetOperation (function element)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceOperation : Source → Source} {targetOperation : Target → Target}, (∀ (element : Source), function (sourceOperation element) = targetOperation (function element)) → ∀ (element : Source), function (sourceOperation element) = targetOperation (function element)

Logical form (Lean):

```lean
theorem PreservesUnaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.UnaryEndoOperation Source}
    {targetOperation : LRA.Operation.UnaryEndoOperation Target}
    (law : PreservesUnaryOperation function sourceOperation targetOperation)
    (element : Source) :
    function (sourceOperation element) = targetOperation (function element)
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
theorem PreservesUnaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceOperation : LRA.Operation.UnaryEndoOperation Source}
    {targetOperation : LRA.Operation.UnaryEndoOperation Target}
    (law : PreservesUnaryOperation function sourceOperation targetOperation)
    (element : Source) :
    function (sourceOperation element) = targetOperation (function element) := by
  sorry
end LRA.Morphism
