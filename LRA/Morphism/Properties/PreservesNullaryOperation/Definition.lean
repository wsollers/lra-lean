import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesNullaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceElement : LRA.Operation.NullaryOperation Source) (targetElement : LRA.Operation.NullaryOperation Target), function sourceElement = targetElement

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceElement : Source) (targetElement : Target), function sourceElement = targetElement

Logical form (Lean):

```lean
def PreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
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

Related proof moves: intro, unfold

-/
def PreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  function sourceElement = targetElement

end LRA.Morphism
