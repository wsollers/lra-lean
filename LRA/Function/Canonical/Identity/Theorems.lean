import LRA.Function.Canonical.Identity.Definition
import LRA.Function.Properties.Definition
import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u

/--
`IdentityFunctionValue` TODO

Predicate logic:

  ∀ {Carrier : Type u} (input : Carrier), LRA.Function.IdentityFunction Carrier input = input

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    input : Carrier
  Prove
    input = input

Logical form (Lean):

```lean
theorem IdentityFunctionValue
    {Carrier : Type u} (input : Carrier) :
    IdentityFunction Carrier input = input
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
theorem IdentityFunctionValue
    {Carrier : Type u} (input : Carrier) :
    IdentityFunction Carrier input = input := by
  sorry
/--
`IdentityFunctionInjective` TODO

Predicate logic:

  ∀ {Carrier : Type u}, LRA.Function.Injective (LRA.Function.IdentityFunction Carrier)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    (x₁ = y ∧ x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem IdentityFunctionInjective {Carrier : Type u} :
    Injective (IdentityFunction Carrier)
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
theorem IdentityFunctionInjective {Carrier : Type u} :
    Injective (IdentityFunction Carrier) := by
  sorry
/--
`IdentityFunctionSurjective` TODO

Predicate logic:

  ∀ {Carrier : Type u}, LRA.Function.Surjective (LRA.Function.IdentityFunction Carrier)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    Exists fun x => x = y

Logical form (Lean):

```lean
theorem IdentityFunctionSurjective {Carrier : Type u} :
    Surjective (IdentityFunction Carrier)
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
theorem IdentityFunctionSurjective {Carrier : Type u} :
    Surjective (IdentityFunction Carrier) := by
  sorry
/--
`IdentityFunctionBijective` TODO

Predicate logic:

  ∀ {Carrier : Type u}, LRA.Function.Bijective (LRA.Function.IdentityFunction Carrier)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (y x₁ x₂ : Carrier), x₁ = y → x₂ = y → x₁ = x₂) ∧ (∀ (y : Carrier), Exists fun x => x = y))

Logical form (Lean):

```lean
theorem IdentityFunctionBijective {Carrier : Type u} :
    Bijective (IdentityFunction Carrier)
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
theorem IdentityFunctionBijective {Carrier : Type u} :
    Bijective (IdentityFunction Carrier) := by
  sorry
/--
`IdentityFunctionTwoSidedInverse` TODO

Predicate logic:

  ∀ (Carrier : Type u), LRA.Function.TwoSidedInverse (LRA.Function.IdentityFunction Carrier) (LRA.Function.IdentityFunction Carrier)

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    (none)
  Prove
    ((∀ (input : Carrier), input = input) ∧ (∀ (output : Carrier), output = output))

Logical form (Lean):

```lean
theorem IdentityFunctionTwoSidedInverse (Carrier : Type u) :
    TwoSidedInverse (IdentityFunction Carrier) (IdentityFunction Carrier)
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
theorem IdentityFunctionTwoSidedInverse (Carrier : Type u) :
    TwoSidedInverse (IdentityFunction Carrier) (IdentityFunction Carrier) := by
  sorry
end LRA.Function
