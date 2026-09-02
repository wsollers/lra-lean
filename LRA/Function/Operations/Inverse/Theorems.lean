import LRA.Function.Operations.Inverse.Definition
import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

universe u v

/--
`BijectiveHasTwoSidedInverse` TODO

Predicate logic:

  ∃ inverse ∈ LRA.Function Codomain Domain, TwoSidedInverse function inverse

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ ∀ (y : Codomain), Exists fun x => function x = y) → Exists fun inverse => (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output)

Logical form (Lean):

```lean
theorem BijectiveHasTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (bijective : Bijective function) :
    ∃ inverse : LRA.Function Codomain Domain,
      TwoSidedInverse function inverse
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem BijectiveHasTwoSidedInverse
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (bijective : Bijective function) :
    ∃ inverse : LRA.Function Codomain Domain,
      TwoSidedInverse function inverse := by
  sorry
/--
`TwoSidedInverseGivesBijective` TODO

Predicate logic:

  Bijective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output) → (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ ∀ (y : Codomain), Exists fun x => function x = y)

Logical form (Lean):

```lean
theorem TwoSidedInverseGivesBijective
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (twoSided : TwoSidedInverse function inverse) :
    Bijective function
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
theorem TwoSidedInverseGivesBijective
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (inverse : LRA.Function Codomain Domain)
    (twoSided : TwoSidedInverse function inverse) :
    Bijective function := by
  sorry
/--
`TwoSidedInverseUnique` TODO

Predicate logic:

  ∀ output, first output = second output

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (first second : Codomain → Domain), ((∀ (input : Domain), first (function input) = input ∧ ∀ (output : Codomain), function (first output) = output) ∧ (∀ (input : Domain), second (function input) = input ∧ ∀ (output : Codomain), function (second output) = output)) → ∀ (output : Codomain), first output = second output

Logical form (Lean):

```lean
theorem TwoSidedInverseUnique
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (first second : LRA.Function Codomain Domain)
    (firstIsInverse : TwoSidedInverse function first)
    (secondIsInverse : TwoSidedInverse function second) :
    ∀ output, first output = second output
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
theorem TwoSidedInverseUnique
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (first second : LRA.Function Codomain Domain)
    (firstIsInverse : TwoSidedInverse function first)
    (secondIsInverse : TwoSidedInverse function second) :
    ∀ output, first output = second output := by
  sorry
section SubsetRelativeInverses

open LRA.Set
variable {Domain : Type u} {Codomain : Type v}
variable (function : LRA.Function Domain Codomain)
variable (inverse : LRA.Function Codomain Domain)

/--
`LeftInverseGivesLeftInverseOn` TODO

Predicate logic:

  LeftInverseOn function inverse source

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (input : Domain), inverse (function input) = input) → ∀ (source : Domain → Prop) (input : Domain), source input → inverse (function input) = input

Logical form (Lean):

```lean
theorem LeftInverseGivesLeftInverseOn
    (leftInverse : LeftInverse function inverse) (source : SetClass Domain) :
    LeftInverseOn function inverse source
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
theorem LeftInverseGivesLeftInverseOn
    (leftInverse : LeftInverse function inverse) (source : SetClass Domain) :
    LeftInverseOn function inverse source := by
  sorry
/--
`RightInverseGivesRightInverseOn` TODO

Predicate logic:

  RightInverseOn function inverse target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (output : Codomain), function (inverse output) = output) → ∀ (target : Codomain → Prop) (output : Codomain), target output → function (inverse output) = output

Logical form (Lean):

```lean
theorem RightInverseGivesRightInverseOn
    (rightInverse : RightInverse function inverse) (target : SetClass Codomain) :
    RightInverseOn function inverse target
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
theorem RightInverseGivesRightInverseOn
    (rightInverse : RightInverse function inverse) (target : SetClass Codomain) :
    RightInverseOn function inverse target := by
  sorry
/--
`TwoSidedInverseGivesTwoSidedInverseOn` TODO

Predicate logic:

  TwoSidedInverseOn function inverse source target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output) → ∀ (source : Domain → Prop) (target : Codomain → Prop), (∀ (input : Domain), source input → inverse (function input) = input ∧ ∀ (output : Codomain), target output → function (inverse output) = output)

Logical form (Lean):

```lean
theorem TwoSidedInverseGivesTwoSidedInverseOn
    (twoSided : TwoSidedInverse function inverse)
    (source : SetClass Domain) (target : SetClass Codomain) :
    TwoSidedInverseOn function inverse source target
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
theorem TwoSidedInverseGivesTwoSidedInverseOn
    (twoSided : TwoSidedInverse function inverse)
    (source : SetClass Domain) (target : SetClass Codomain) :
    TwoSidedInverseOn function inverse source target := by
  sorry
/--
`RightInverseOnImageOfLeftInverseOn` TODO

Predicate logic:

  RightInverseOn function inverse (ImageClass function source)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (source : Domain → Prop), (∀ (input : Domain), source input → inverse (function input) = input) → ∀ (output : Codomain), (Exists fun x => (source x ∧ function x = output)) → function (inverse output) = output

Logical form (Lean):

```lean
theorem RightInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    RightInverseOn function inverse (ImageClass function source)
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
theorem RightInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    RightInverseOn function inverse (ImageClass function source) := by
  sorry
/--
`TwoSidedInverseOnImageOfLeftInverseOn` TODO

Predicate logic:

  TwoSidedInverseOn function inverse source (ImageClass function source)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain) (source : Domain → Prop), (∀ (input : Domain), source input → inverse (function input) = input) → (∀ (input : Domain), source input → inverse (function input) = input ∧ ∀ (output : Codomain), (Exists fun x => (source x ∧ function x = output)) → function (inverse output) = output)

Logical form (Lean):

```lean
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    TwoSidedInverseOn function inverse source (ImageClass function source)
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
theorem TwoSidedInverseOnImageOfLeftInverseOn
    (source : SetClass Domain)
    (leftInverse : LeftInverseOn function inverse source) :
    TwoSidedInverseOn function inverse source (ImageClass function source) := by
  sorry
/--
`PreimageClassEqualsImageClassOfInverse` TODO

Predicate logic:

  PreimageClass function target = ImageClass inverse target

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (inverse : Codomain → Domain), (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output) → ∀ (target : Codomain → Prop), fun x => Exists fun y => (target y ∧ function x = y) = funy => Exists fun x => (target x ∧ inverse x = y)

Logical form (Lean):

```lean
theorem PreimageClassEqualsImageClassOfInverse
    (twoSided : TwoSidedInverse function inverse) (target : SetClass Codomain) :
    PreimageClass function target = ImageClass inverse target
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
theorem PreimageClassEqualsImageClassOfInverse
    (twoSided : TwoSidedInverse function inverse) (target : SetClass Codomain) :
    PreimageClass function target = ImageClass inverse target := by
  sorry
end SubsetRelativeInverses

section OneSidedConsequences

variable {Domain : Type u} {Codomain : Type v}
variable {function : LRA.Function Domain Codomain}
variable {inverse : LRA.Function Codomain Domain}

/--
`InjectiveOfLeftInverse` TODO

Predicate logic:

  Injective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {function : Domain → Codomain} {inverse : Codomain → Domain}, (∀ (input : Domain), inverse (function input) = input) → ∀ (y : Codomain) (x₁ x₂ : Domain), (function x₁ = y ∧ function x₂ = y) → x₁ = x₂

Logical form (Lean):

```lean
theorem InjectiveOfLeftInverse
    (leftInverse : LeftInverse function inverse) : Injective function
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
theorem InjectiveOfLeftInverse
    (leftInverse : LeftInverse function inverse) : Injective function := by
  sorry
/--
`SurjectiveOfRightInverse` TODO

Predicate logic:

  Surjective function

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {function : Domain → Codomain} {inverse : Codomain → Domain}, (∀ (output : Codomain), function (inverse output) = output) → ∀ (y : Codomain), Exists fun x => function x = y

Logical form (Lean):

```lean
theorem SurjectiveOfRightInverse
    (rightInverse : RightInverse function inverse) : Surjective function
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
theorem SurjectiveOfRightInverse
    (rightInverse : RightInverse function inverse) : Surjective function := by
  sorry
/--
`TwoSidedInverseIsBijective` TODO

Predicate logic:

  Bijective inverse

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} {function : Domain → Codomain} {inverse : Codomain → Domain}, (∀ (input : Domain), inverse (function input) = input ∧ ∀ (output : Codomain), function (inverse output) = output) → (∀ (y : Domain) (x₁ x₂ : Codomain), inverse x₁ = y → inverse x₂ = y → x₁ = x₂ ∧ ∀ (y : Domain), Exists fun x => inverse x = y)

Logical form (Lean):

```lean
theorem TwoSidedInverseIsBijective
    (twoSided : TwoSidedInverse function inverse) : Bijective inverse
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
theorem TwoSidedInverseIsBijective
    (twoSided : TwoSidedInverse function inverse) : Bijective inverse := by
  sorry
end OneSidedConsequences

end LRA.Function
