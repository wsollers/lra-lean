import LRA.Function.Examples.Canonical
import LRA.Function.Properties.FailureModes

namespace LRA.Function.Examples

/--
`CollapseHasCollision` TODO

Predicate logic:

  LRA.Function.Examples.collapse.HasCollision

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun first => Exists fun second => ((first = second → False) ∧ Unit.unit = Unit.unit)

Logical form (Lean):

```lean
theorem CollapseHasCollision : HasCollision collapse
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
theorem CollapseHasCollision : HasCollision collapse := by
  sorry
/--
`CollapseNotInjective` TODO

Predicate logic:

  ¬ LRA.Function.Examples.collapse.Injective

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (y : Unit) (x₁ x₂ : Bool), Unit.unit = y → Unit.unit = y → x₁ = x₂) → False

Logical form (Lean):

```lean
theorem CollapseNotInjective : ¬ Injective collapse
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
theorem CollapseNotInjective : ¬ Injective collapse := by
  sorry
/--
`ShiftMissesZero` TODO

Predicate logic:

  LRA.Function.MissesValue LRA.Function.Examples.shift

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun output => ∀ (input : Nat), input.succ = output → False

Logical form (Lean):

```lean
theorem ShiftMissesZero : MissesValue shift
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
theorem ShiftMissesZero : MissesValue shift := by
  sorry
/--
`ShiftNotSurjective` TODO

Predicate logic:

  ¬ LRA.Function.Surjective LRA.Function.Examples.shift

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (∀ (y : Nat), Exists fun x => x.succ = y) → False

Logical form (Lean):

```lean
theorem ShiftNotSurjective : ¬ Surjective shift
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
theorem ShiftNotSurjective : ¬ Surjective shift := by
  sorry
end LRA.Function.Examples
