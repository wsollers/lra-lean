import LRA.Morphism.Properties.PreservesNullaryOperation.Definition

namespace LRA.Morphism

universe u v

/--
`FailsPreservesNullaryOperation` TODO

Predicate logic:

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceElement : LRA.Operation.NullaryOperation Source) (targetElement : LRA.Operation.NullaryOperation Target), LRA.Morphism.PreservesNullaryOperation function sourceElement targetElement → False

Predicate logic (unfolded):

  ∀ {Source : Type u} {Target : Type v} (function : Source → Target) (sourceElement : Source) (targetElement : Target), function sourceElement = targetElement → False

Logical form (Lean):

```lean
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  ¬ PreservesNullaryOperation function sourceElement targetElement
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
def FailsPreservesNullaryOperation {Source : Type u} {Target : Type v}
    (function : Source → Target)
    (sourceElement : LRA.Operation.NullaryOperation Source)
    (targetElement : LRA.Operation.NullaryOperation Target) : Prop :=
  ¬ PreservesNullaryOperation function sourceElement targetElement

/--
`ConstantZeroNaturalToIntegerFunction` TODO

Predicate logic:

  def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0

Predicate logic (unfolded):

  def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def ConstantZeroNaturalToIntegerFunction (_ : Nat) : Int :=
  0

end LRA.Morphism
