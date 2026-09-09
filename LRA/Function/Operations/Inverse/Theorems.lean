import LRA.Function.Operations.Inverse.Definition
import LRA.Function.Calculus.Classes.Definition

namespace LRA.Function

universe u v

/--
`BijectiveHasTwoSidedInverse` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), function.Bijective → Exists fun inverse => function.TwoSidedInverse inverse

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    bijective : Bijective function
  Prove
    ((∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) ∧ (∀ (y : Codomain), Exists fun x => function x = y)) → Exists fun inverse => ((∀ (input : Domain), inverse (function input) = input) ∧ (∀ (output : Codomain), function (inverse output) = output))

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), function.TwoSidedInverse inverse → function.Bijective

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    twoSided : TwoSidedInverse function inverse
  Prove
    ((∀ (input : Domain), inverse (function input) = input) ∧ (∀ (output : Codomain), function (inverse output) = output)) → ((∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂) ∧ (∀ (y : Codomain), Exists fun x => function x = y))

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (first second : LRA.Function Codomain Domain), (function.TwoSidedInverse first ∧ function.TwoSidedInverse second) → ∀ (output : Codomain), first output = second output

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    first second : LRA.Function Codomain Domain
    firstIsInverse : TwoSidedInverse function first
    secondIsInverse : TwoSidedInverse function second
  Prove
    (((∀ (input : Domain), first (function input) = input) ∧ (∀ (output : Codomain), function (first output) = output)) ∧ ((∀ (input : Domain), second (function input) = input) ∧ (∀ (output : Codomain), function (second output) = output))) → ∀ (output : Codomain), first output = second output

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), function.LeftInverse inverse → ∀ (source : LRA.Set.SetClass Domain), function.LeftInverseOn inverse source

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    leftInverse : LeftInverse function inverse
    source : SetClass Domain
  Prove
    (∀ (input : Domain), inverse (function input) = input) → ∀ (source : Domain → Prop) (input : Domain), source input → inverse (function input) = input

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), function.RightInverse inverse → ∀ (target : LRA.Set.SetClass Codomain), function.RightInverseOn inverse target

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    rightInverse : RightInverse function inverse
    target : SetClass Codomain
  Prove
    (∀ (output : Codomain), function (inverse output) = output) → ∀ (target : Codomain → Prop) (output : Codomain), target output → function (inverse output) = output

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), function.TwoSidedInverse inverse → ∀ (source : LRA.Set.SetClass Domain) (target : LRA.Set.SetClass Codomain), function.TwoSidedInverseOn inverse source target

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    twoSided : TwoSidedInverse function inverse
    source : SetClass Domain
    target : SetClass Codomain
  Prove
    ((∀ (input : Domain), inverse (function input) = input) ∧ (∀ (output : Codomain), function (inverse output) = output)) → ∀ (source : Domain → Prop) (target : Codomain → Prop), ((∀ (input : Domain), source input → inverse (function input) = input) ∧ (∀ (output : Codomain), target output → function (inverse output) = output))

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (source : LRA.Set.SetClass Domain), function.LeftInverseOn inverse source → function.RightInverseOn inverse (function.ImageClass source)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    source : SetClass Domain
    leftInverse : LeftInverseOn function inverse source
  Prove
    (∀ (input : Domain), source input → inverse (function input) = input) → ∀ (output : Codomain), (Exists fun x => (source x ∧ function x = output)) → function (inverse output) = output

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain) (source : LRA.Set.SetClass Domain), function.LeftInverseOn inverse source → function.TwoSidedInverseOn inverse source (function.ImageClass source)

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    source : SetClass Domain
    leftInverse : LeftInverseOn function inverse source
  Prove
    (∀ (input : Domain), source input → inverse (function input) = input) → ((∀ (input : Domain), source input → inverse (function input) = input) ∧ (∀ (output : Codomain), (Exists fun x => (source x ∧ function x = output)) → function (inverse output) = output))

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

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (inverse : LRA.Function Codomain Domain), function.TwoSidedInverse inverse → ∀ (target : LRA.Set.SetClass Codomain), function.PreimageClass target = inverse.ImageClass target

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    twoSided : TwoSidedInverse function inverse
    target : SetClass Codomain
  Prove
    ((∀ (input : Domain), inverse (function input) = input) ∧ (∀ (output : Codomain), function (inverse output) = output)) → ∀ (target : Codomain → Prop), fun x => Exists fun y => (target y ∧ function x = y) = funy => Exists fun x => (target x ∧ inverse x = y)

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

  ∀ {Domain : Type u} {Codomain : Type v} {function : LRA.Function Domain Codomain} {inverse : LRA.Function Codomain Domain}, function.LeftInverse inverse → function.Injective

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    leftInverse : LeftInverse function inverse
  Prove
    (∀ (input : Domain), inverse (function input) = input) → ∀ (y : Codomain) (x₁ x₂ : Domain), (function x₁ = y ∧ function x₂ = y) → x₁ = x₂

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

  ∀ {Domain : Type u} {Codomain : Type v} {function : LRA.Function Domain Codomain} {inverse : LRA.Function Codomain Domain}, function.RightInverse inverse → function.Surjective

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    rightInverse : RightInverse function inverse
  Prove
    (∀ (output : Codomain), function (inverse output) = output) → ∀ (y : Codomain), Exists fun x => function x = y

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

  ∀ {Domain : Type u} {Codomain : Type v} {function : LRA.Function Domain Codomain} {inverse : LRA.Function Codomain Domain}, function.TwoSidedInverse inverse → inverse.Bijective

Predicate logic (unfolded):

  Ambient
    (Domain, Codomain)
  Objects
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    function : LRA.Function Domain Codomain
    inverse : LRA.Function Codomain Domain
    twoSided : TwoSidedInverse function inverse
  Prove
    ((∀ (input : Domain), inverse (function input) = input) ∧ (∀ (output : Codomain), function (inverse output) = output)) → ((∀ (y : Domain) (x₁ x₂ : Codomain), inverse x₁ = y → inverse x₂ = y → x₁ = x₂) ∧ (∀ (y : Domain), Exists fun x => inverse x = y))

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
