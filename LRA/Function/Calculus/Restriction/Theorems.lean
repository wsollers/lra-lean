import LRA.Function.Calculus.Restriction.Definition
import LRA.Function.Operations.Composition.Definition
import LRA.Function.Properties.Definition

namespace LRA.Function

universe u v w

variable {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
variable (original : LRA.Function Domain Codomain)
variable (inclusion : LRA.Function Subdomain Domain)

/--
`RestrictionRestrictsTo` TODO

Predicate logic:

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (original : LRA.Function Domain Codomain) (inclusion : LRA.Function Subdomain Domain), (original.Restriction inclusion).RestrictsTo original inclusion

Predicate logic (unfolded):

  Ambient
    (Subdomain, Domain, Codomain)
  Objects
    original : LRA.Function Domain Codomain
    inclusion : LRA.Function Subdomain Domain
  Prove
    original (inclusion input) = original (inclusion input)

Logical form (Lean):

```lean
theorem RestrictionRestrictsTo :
    RestrictsTo (Restriction original inclusion) original inclusion
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
theorem RestrictionRestrictsTo :
    RestrictsTo (Restriction original inclusion) original inclusion := by
  sorry
/--
`RestrictionEqualsCompose` TODO

Predicate logic:

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (original : LRA.Function Domain Codomain) (inclusion : LRA.Function Subdomain Domain), original.Restriction inclusion = original.Compose inclusion

Predicate logic (unfolded):

  Ambient
    (Subdomain, Domain, Codomain)
  Objects
    original : LRA.Function Domain Codomain
    inclusion : LRA.Function Subdomain Domain
  Prove
    fun input => original (inclusion input) = funinput => original (inclusion input)

Logical form (Lean):

```lean
theorem RestrictionEqualsCompose :
    Restriction original inclusion = Compose original inclusion
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
theorem RestrictionEqualsCompose :
    Restriction original inclusion = Compose original inclusion := by
  sorry
/--
`RestrictionInjective` TODO

Predicate logic:

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (original : LRA.Function Domain Codomain) (inclusion : LRA.Function Subdomain Domain), (original.Injective ∧ inclusion.Injective) → (original.Restriction inclusion).Injective

Predicate logic (unfolded):

  Ambient
    (Subdomain, Domain, Codomain)
  Objects
    original : LRA.Function Domain Codomain
    inclusion : LRA.Function Subdomain Domain
    originalInjective : Injective original
    inclusionInjective : Injective inclusion
  Prove
    ((∀ (y : Codomain) (x₁ x₂ : Domain), original x₁ = y → original x₂ = y → x₁ = x₂) ∧ (∀ (y : Domain) (x₁ x₂ : Subdomain), inclusion x₁ = y → inclusion x₂ = y → x₁ = x₂)) → ∀ (y : Codomain) (x₁ x₂ : Subdomain), (original (inclusion x₁) = y ∧ original (inclusion x₂) = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem RestrictionInjective
    (originalInjective : Injective original)
    (inclusionInjective : Injective inclusion) :
    Injective (Restriction original inclusion)
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
theorem RestrictionInjective
    (originalInjective : Injective original)
    (inclusionInjective : Injective inclusion) :
    Injective (Restriction original inclusion) := by
  sorry
/--
`RestrictionSurjectiveOfSurjective` TODO

Predicate logic:

  ∀ {Subdomain : Type u} {Domain : Type v} {Codomain : Type w} (original : LRA.Function Domain Codomain) (inclusion : LRA.Function Subdomain Domain), (original.Surjective ∧ inclusion.Surjective) → (original.Restriction inclusion).Surjective

Predicate logic (unfolded):

  Ambient
    (Subdomain, Domain, Codomain)
  Objects
    original : LRA.Function Domain Codomain
    inclusion : LRA.Function Subdomain Domain
    originalSurjective : Surjective original
    inclusionSurjective : Surjective inclusion
  Prove
    ((∀ (y : Codomain), Exists fun x => original x = y) ∧ (∀ (y : Domain), Exists fun x => inclusion x = y)) → ∀ (y : Codomain), Exists fun x => original (inclusion x) = y

Logical form (Lean):

```lean
theorem RestrictionSurjectiveOfSurjective
    (originalSurjective : Surjective original)
    (inclusionSurjective : Surjective inclusion) :
    Surjective (Restriction original inclusion)
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
theorem RestrictionSurjectiveOfSurjective
    (originalSurjective : Surjective original)
    (inclusionSurjective : Surjective inclusion) :
    Surjective (Restriction original inclusion) := by
  sorry
end LRA.Function
