import LRA.Morphism.Properties.PreservesNullaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesNullaryOperation.apply` TODO

Predicate logic:

  function sourceElement = targetElement

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} {function : Source → Target} {sourceElement : Source} {targetElement : Target}, function sourceElement = targetElement → function sourceElement = targetElement

Logical form (Lean):

```lean
theorem PreservesNullaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceElement : LRA.Operation.NullaryOperation Source}
    {targetElement : LRA.Operation.NullaryOperation Target}
    (law : PreservesNullaryOperation function sourceElement targetElement) :
    function sourceElement = targetElement
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
theorem PreservesNullaryOperation.apply {Source : Type u} {Target : Type v}
    {function : Source → Target}
    {sourceElement : LRA.Operation.NullaryOperation Source}
    {targetElement : LRA.Operation.NullaryOperation Target}
    (law : PreservesNullaryOperation function sourceElement targetElement) :
    function sourceElement = targetElement := by
  sorry

end LRA.Morphism
