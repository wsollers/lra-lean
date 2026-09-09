import LRA.Function.Operations.Composition.Definition
import LRA.Function.Canonical.Identity.Definition
import LRA.Function.Properties.Definition
import LRA.Function.Operations.Inverse.Definition

namespace LRA.Function

universe u v w x

/--
`ComposeValue` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} (outer : LRA.Function Middle Codomain) (inner : LRA.Function Domain Middle) (input : Domain), outer.Compose inner input = outer (inner input)

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    input : Domain
  Prove
    outer (inner input) = outer (inner input)

Logical form (Lean):

```lean
theorem ComposeValue
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) :
    Compose outer inner input = outer (inner input)
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
theorem ComposeValue
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (outer : LRA.Function Middle Codomain)
    (inner : LRA.Function Domain Middle)
    (input : Domain) :
    Compose outer inner input = outer (inner input) := by
  sorry
/--
`ComposeLeftIdentity` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), LRA.Function.Compose (LRA.Function.IdentityFunction Codomain) function = function

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    fun input => function input = function

Logical form (Lean):

```lean
theorem ComposeLeftIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose (IdentityFunction Codomain) function = function
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
theorem ComposeLeftIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose (IdentityFunction Codomain) function = function := by
  sorry
/--
`ComposeRightIdentity` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Compose (LRA.Function.IdentityFunction Domain) = function

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
  Prove
    fun input => function input = function

Logical form (Lean):

```lean
theorem ComposeRightIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose function (IdentityFunction Domain) = function
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
theorem ComposeRightIdentity {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) :
    Compose function (IdentityFunction Domain) = function := by
  sorry
/--
`ComposeAssociative` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Later : Type w} {Codomain : Type x} (outer : LRA.Function Later Codomain) (middle : LRA.Function Middle Later) (inner : LRA.Function Domain Middle), outer.Compose (middle.Compose inner) = (outer.Compose middle).Compose inner

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Later, Codomain)
  Objects
    outer : LRA.Function Later Codomain
    middle : LRA.Function Middle Later
    inner : LRA.Function Domain Middle
  Prove
    fun input => outer (middle (inner input)) = funinput => outer (middle (inner input))

Logical form (Lean):

```lean
theorem ComposeAssociative {Domain : Type u} {Middle : Type v}
    {Later : Type w} {Codomain : Type x}
    (outer : LRA.Function Later Codomain)
    (middle : LRA.Function Middle Later)
    (inner : LRA.Function Domain Middle) :
    Compose outer (Compose middle inner) = Compose (Compose outer middle) inner
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
theorem ComposeAssociative {Domain : Type u} {Middle : Type v}
    {Later : Type w} {Codomain : Type x}
    (outer : LRA.Function Later Codomain)
    (middle : LRA.Function Middle Later)
    (inner : LRA.Function Domain Middle) :
    Compose outer (Compose middle inner) = Compose (Compose outer middle) inner := by
  sorry
section CompositionProperties

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}
variable {outer : LRA.Function Middle Codomain}
variable {inner : LRA.Function Domain Middle}

/--
`ComposeInjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle}, (outer.Injective ∧ inner.Injective) → (outer.Compose inner).Injective

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerInjective : Injective outer
    innerInjective : Injective inner
  Prove
    ((∀ (y : Codomain) (x₁ x₂ : Middle), outer x₁ = y → outer x₂ = y → x₁ = x₂) ∧ (∀ (y : Middle) (x₁ x₂ : Domain), inner x₁ = y → inner x₂ = y → x₁ = x₂)) → ∀ (y : Codomain) (x₁ x₂ : Domain), (outer (inner x₁) = y ∧ outer (inner x₂) = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem ComposeInjective
    (outerInjective : Injective outer) (innerInjective : Injective inner) :
    Injective (Compose outer inner)
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
theorem ComposeInjective
    (outerInjective : Injective outer) (innerInjective : Injective inner) :
    Injective (Compose outer inner) := by
  sorry
/--
`ComposeSurjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle}, (outer.Surjective ∧ inner.Surjective) → (outer.Compose inner).Surjective

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerSurjective : Surjective outer
    innerSurjective : Surjective inner
  Prove
    ((∀ (y : Codomain), Exists fun x => outer x = y) ∧ (∀ (y : Middle), Exists fun x => inner x = y)) → ∀ (y : Codomain), Exists fun x => outer (inner x) = y

Logical form (Lean):

```lean
theorem ComposeSurjective
    (outerSurjective : Surjective outer) (innerSurjective : Surjective inner) :
    Surjective (Compose outer inner)
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
theorem ComposeSurjective
    (outerSurjective : Surjective outer) (innerSurjective : Surjective inner) :
    Surjective (Compose outer inner) := by
  sorry
/--
`ComposeBijective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle}, (outer.Bijective ∧ inner.Bijective) → (outer.Compose inner).Bijective

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerBijective : Bijective outer
    innerBijective : Bijective inner
  Prove
    (((∀ (y : Codomain) (x₁ x₂ : Middle), outer x₁ = y → outer x₂ = y → x₁ = x₂) ∧ (∀ (y : Codomain), Exists fun x => outer x = y)) ∧ ((∀ (y : Middle) (x₁ x₂ : Domain), inner x₁ = y → inner x₂ = y → x₁ = x₂) ∧ (∀ (y : Middle), Exists fun x => inner x = y))) → ((∀ (y : Codomain) (x₁ x₂ : Domain), outer (inner x₁) = y → outer (inner x₂) = y → x₁ = x₂) ∧ (∀ (y : Codomain), Exists fun x => outer (inner x) = y))

Logical form (Lean):

```lean
theorem ComposeBijective
    (outerBijective : Bijective outer) (innerBijective : Bijective inner) :
    Bijective (Compose outer inner)
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
theorem ComposeBijective
    (outerBijective : Bijective outer) (innerBijective : Bijective inner) :
    Bijective (Compose outer inner) := by
  sorry
/--
`ComposeInjectiveGivesInnerInjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle}, (outer.Compose inner).Injective → inner.Injective

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    compositeInjective : Injective (Compose outer inner)
  Prove
    (∀ (y : Codomain) (x₁ x₂ : Domain), outer (inner x₁) = y → outer (inner x₂) = y → x₁ = x₂) → ∀ (y : Middle) (x₁ x₂ : Domain), (inner x₁ = y ∧ inner x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem ComposeInjectiveGivesInnerInjective
    (compositeInjective : Injective (Compose outer inner)) :
    Injective inner
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
theorem ComposeInjectiveGivesInnerInjective
    (compositeInjective : Injective (Compose outer inner)) :
    Injective inner := by
  sorry
/--
`ComposeSurjectiveGivesOuterSurjective` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle}, (outer.Compose inner).Surjective → outer.Surjective

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    compositeSurjective : Surjective (Compose outer inner)
  Prove
    (∀ (y : Codomain), Exists fun x => outer (inner x) = y) → ∀ (y : Codomain), Exists fun x => outer x = y

Logical form (Lean):

```lean
theorem ComposeSurjectiveGivesOuterSurjective
    (compositeSurjective : Surjective (Compose outer inner)) :
    Surjective outer
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
theorem ComposeSurjectiveGivesOuterSurjective
    (compositeSurjective : Surjective (Compose outer inner)) :
    Surjective outer := by
  sorry
end CompositionProperties

section CompositionInverses

variable {Domain : Type u} {Middle : Type v} {Codomain : Type w}
variable {outer : LRA.Function Middle Codomain}
variable {inner : LRA.Function Domain Middle}
variable {outerInverse : LRA.Function Codomain Middle}
variable {innerInverse : LRA.Function Middle Domain}

/--
`ComposeLeftInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle} {outerInverse : LRA.Function Codomain Middle} {innerInverse : LRA.Function Middle Domain}, (outer.LeftInverse outerInverse ∧ inner.LeftInverse innerInverse) → (outer.Compose inner).LeftInverse (innerInverse.Compose outerInverse)

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerInverse : LRA.Function Codomain Middle
    innerInverse : LRA.Function Middle Domain
    outerLeftInverse : LeftInverse outer outerInverse
    innerLeftInverse : LeftInverse inner innerInverse
  Prove
    ((∀ (input : Middle), outerInverse (outer input) = input) ∧ (∀ (input : Domain), innerInverse (inner input) = input)) → ∀ (input : Domain), innerInverse (outerInverse (outer (inner input))) = input

Logical form (Lean):

```lean
theorem ComposeLeftInverse
    (outerLeftInverse : LeftInverse outer outerInverse)
    (innerLeftInverse : LeftInverse inner innerInverse) :
    LeftInverse (Compose outer inner) (Compose innerInverse outerInverse)
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
theorem ComposeLeftInverse
    (outerLeftInverse : LeftInverse outer outerInverse)
    (innerLeftInverse : LeftInverse inner innerInverse) :
    LeftInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry
/--
`ComposeRightInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle} {outerInverse : LRA.Function Codomain Middle} {innerInverse : LRA.Function Middle Domain}, (outer.RightInverse outerInverse ∧ inner.RightInverse innerInverse) → (outer.Compose inner).RightInverse (innerInverse.Compose outerInverse)

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerInverse : LRA.Function Codomain Middle
    innerInverse : LRA.Function Middle Domain
    outerRightInverse : RightInverse outer outerInverse
    innerRightInverse : RightInverse inner innerInverse
  Prove
    ((∀ (output : Codomain), outer (outerInverse output) = output) ∧ (∀ (output : Middle), inner (innerInverse output) = output)) → ∀ (output : Codomain), outer (inner (innerInverse (outerInverse output))) = output

Logical form (Lean):

```lean
theorem ComposeRightInverse
    (outerRightInverse : RightInverse outer outerInverse)
    (innerRightInverse : RightInverse inner innerInverse) :
    RightInverse (Compose outer inner) (Compose innerInverse outerInverse)
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
theorem ComposeRightInverse
    (outerRightInverse : RightInverse outer outerInverse)
    (innerRightInverse : RightInverse inner innerInverse) :
    RightInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry
/--
`ComposeTwoSidedInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Middle : Type v} {Codomain : Type w} {outer : LRA.Function Middle Codomain} {inner : LRA.Function Domain Middle} {outerInverse : LRA.Function Codomain Middle} {innerInverse : LRA.Function Middle Domain}, (outer.TwoSidedInverse outerInverse ∧ inner.TwoSidedInverse innerInverse) → (outer.Compose inner).TwoSidedInverse (innerInverse.Compose outerInverse)

Predicate logic (unfolded):

  Ambient
    (Domain, Middle, Codomain)
  Objects
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outer : LRA.Function Middle Codomain
    inner : LRA.Function Domain Middle
    outerInverse : LRA.Function Codomain Middle
    innerInverse : LRA.Function Middle Domain
    outerTwoSided : TwoSidedInverse outer outerInverse
    innerTwoSided : TwoSidedInverse inner innerInverse
  Prove
    (((∀ (input : Middle), outerInverse (outer input) = input) ∧ (∀ (output : Codomain), outer (outerInverse output) = output)) ∧ ((∀ (input : Domain), innerInverse (inner input) = input) ∧ (∀ (output : Middle), inner (innerInverse output) = output))) → ((∀ (input : Domain), innerInverse (outerInverse (outer (inner input))) = input) ∧ (∀ (output : Codomain), outer (inner (innerInverse (outerInverse output))) = output))

Logical form (Lean):

```lean
theorem ComposeTwoSidedInverse
    (outerTwoSided : TwoSidedInverse outer outerInverse)
    (innerTwoSided : TwoSidedInverse inner innerInverse) :
    TwoSidedInverse (Compose outer inner) (Compose innerInverse outerInverse)
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
theorem ComposeTwoSidedInverse
    (outerTwoSided : TwoSidedInverse outer outerInverse)
    (innerTwoSided : TwoSidedInverse inner innerInverse) :
    TwoSidedInverse (Compose outer inner) (Compose innerInverse outerInverse) := by
  sorry
end CompositionInverses

end LRA.Function
