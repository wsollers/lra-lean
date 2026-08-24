import LRA.Function.Properties.Definition

namespace LRA.Function

universe u v

/--
`HasCollision` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Exists fun first => Exists fun second => (Ne first second ∧ function first = function second)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun first => Exists fun second => (first = second → False ∧ function first = function second)

Logical form (Lean):

```lean
def HasCollision {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : Domain, first ≠ second ∧ function first = function second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use, unfold

-/
def HasCollision {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ first second : Domain, first ≠ second ∧ function first = function second

/--
`MissesValue` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Exists fun output => ∀ (input : Domain), Ne (function input) output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun output => ∀ (input : Domain), function input = output → False

Logical form (Lean):

```lean
def MissesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ output : Codomain, ∀ input : Domain, function input ≠ output
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases, unfold

-/
def MissesValue {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  ∃ output : Codomain, ∀ input : Domain, function input ≠ output

/--
`FailsBijective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), Or function.HasCollision function.MissesValue

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Or (Exists fun first => Exists fun second => (first = second → False ∧ function first = function second)) (Exists fun output => ∀ (input : Domain), function input = output → False)

Logical form (Lean):

```lean
def FailsBijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasCollision function ∨ MissesValue function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: Or.inl, Or.inr, cases, rcases, unfold

-/
def FailsBijective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  HasCollision function ∨ MissesValue function

/--
`HasCollisionIffNotInjective` TODO

Predicate logic:

  HasCollision function ↔ ¬ Injective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun first => Exists fun second => (first = second → False ∧ function first = function second) ↔ (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) → False

Logical form (Lean):

```lean
theorem HasCollisionIffNotInjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    HasCollision function ↔ ¬ Injective function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem HasCollisionIffNotInjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    HasCollision function ↔ ¬ Injective function := by
  sorry

/--
`MissesValueIffNotSurjective` TODO

Predicate logic:

  MissesValue function ↔ ¬ Surjective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), Exists fun output => ∀ (input : Domain), function input = output → False ↔ (∀ (y : Codomain), Exists fun x => function x = y) → False

Logical form (Lean):

```lean
theorem MissesValueIffNotSurjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    MissesValue function ↔ ¬ Surjective function
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, .mp, .mpr

-/
theorem MissesValueIffNotSurjective {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    MissesValue function ↔ ¬ Surjective function := by
  sorry

end LRA.Function
