import LRA.Operation.Definition

namespace LRA.Morphism

universe u v

/--
`PreservesUnaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : LRA.Operation.UnaryEndoOperation Source) (targetOperation : LRA.Operation.UnaryEndoOperation Target) (element : Source), function (sourceOperation element) = targetOperation (function element)

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceOperation : Source → Source) (targetOperation : Target → Target) (element : Source), function (sourceOperation element) = targetOperation (function element)

Logical form (Lean):

```lean
def PreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ∀ element,
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

Related proof moves: intro, unfold

-/
def PreservesUnaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceOperation : LRA.Operation.UnaryEndoOperation Source)
    (targetOperation : LRA.Operation.UnaryEndoOperation Target) : Prop :=
  ∀ element,
    function (sourceOperation element) = targetOperation (function element)

end LRA.Morphism
