
import Mathlib.Logic.Function.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Functions

variable {A B C : Type*}

/--
`IsInjectiveOn` TODO

Predicate logic:

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B) (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B) (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂

Logical form (Lean):

```lean
def IsInjectiveOn (f : A → B) : Prop := ∀ a₁ a₂ : A, f a₁ = f a₂ → a₁ = a₂
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
def IsInjectiveOn (f : A → B) : Prop := ∀ a₁ a₂ : A, f a₁ = f a₂ → a₁ = a₂

/--
`IsSurjectiveOn` TODO

Predicate logic:

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B) (b : B), Exists fun a => f a = b

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B) (b : B), Exists fun a => f a = b

Logical form (Lean):

```lean
def IsSurjectiveOn (f : A → B) : Prop := ∀ b : B, ∃ a : A, f a = b
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
def IsSurjectiveOn (f : A → B) : Prop := ∀ b : B, ∃ a : A, f a = b

/--
`IsBijectiveOn` TODO

Predicate logic:

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B), (LRA.Analysis.Functions.IsInjectiveOn f ∧ LRA.Analysis.Functions.IsSurjectiveOn f)

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B), (∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂ ∧ ∀ (b : B), Exists fun a => f a = b)

Logical form (Lean):

```lean
def IsBijectiveOn (f : A → B) : Prop := IsInjectiveOn f ∧ IsSurjectiveOn f
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsBijectiveOn (f : A → B) : Prop := IsInjectiveOn f ∧ IsSurjectiveOn f

/--
`IsInverseFunctionOf` TODO

Predicate logic:

  ∀ {A : Type u_1} {B : Type u_2} (g : B → A) (f : A → B), (∀ (a : A), g (f a) = a ∧ ∀ (b : B), f (g b) = b)

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} (g : B → A) (f : A → B), (∀ (a : A), g (f a) = a ∧ ∀ (b : B), f (g b) = b)

Logical form (Lean):

```lean
def IsInverseFunctionOf (g : B → A) (f : A → B) : Prop :=
  (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def IsInverseFunctionOf (g : B → A) (f : A → B) : Prop :=
  (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)

/--
`CompositionInjective` TODO

Predicate logic:

  (IsInjectiveOn f ∧ IsInjectiveOn g) → IsInjectiveOn (g ∘ f)

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, (∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂ ∧ ∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂) → ∀ (a₁ a₂ : A), g (f a₁) = g (f a₂) → a₁ = a₂

Logical form (Lean):

```lean
theorem CompositionInjective {f : A → B} {g : B → C}
    (hf : IsInjectiveOn f) (hg : IsInjectiveOn g) : IsInjectiveOn (g ∘ f)
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
theorem CompositionInjective {f : A → B} {g : B → C}
    (hf : IsInjectiveOn f) (hg : IsInjectiveOn g) : IsInjectiveOn (g ∘ f) := by
  sorry

/--
`CompositionSurjective` TODO

Predicate logic:

  (IsSurjectiveOn f ∧ IsSurjectiveOn g) → IsSurjectiveOn (g ∘ f)

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, (∀ (b : B), Exists fun a => f a = b ∧ ∀ (b : C), Exists fun a => g a = b) → ∀ (b : C), Exists fun a => g (f a) = b

Logical form (Lean):

```lean
theorem CompositionSurjective {f : A → B} {g : B → C}
    (hf : IsSurjectiveOn f) (hg : IsSurjectiveOn g) :
    IsSurjectiveOn (g ∘ f)
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
theorem CompositionSurjective {f : A → B} {g : B → C}
    (hf : IsSurjectiveOn f) (hg : IsSurjectiveOn g) :
    IsSurjectiveOn (g ∘ f) := by
  sorry

/--
`CompositionBijective` TODO

Predicate logic:

  (IsBijectiveOn f ∧ IsBijectiveOn g) → IsBijectiveOn (g ∘ f)

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, ((∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂ ∧ ∀ (b : B), Exists fun a => f a = b) ∧ (∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂ ∧ ∀ (b : C), Exists fun a => g a = b)) → (∀ (a₁ a₂ : A), g (f a₁) = g (f a₂) → a₁ = a₂ ∧ ∀ (b : C), Exists fun a => g (f a) = b)

Logical form (Lean):

```lean
theorem CompositionBijective {f : A → B} {g : B → C}
    (hf : IsBijectiveOn f) (hg : IsBijectiveOn g) : IsBijectiveOn (g ∘ f)
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
theorem CompositionBijective {f : A → B} {g : B → C}
    (hf : IsBijectiveOn f) (hg : IsBijectiveOn g) : IsBijectiveOn (g ∘ f) := by
  sorry

/--
`InverseBijection` TODO

Predicate logic:

  (IsBijectiveOn f) → ∃ g ∈ B → A, IsInverseFunctionOf g f ∧ IsBijectiveOn g

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} {f : A → B}, (∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂ ∧ ∀ (b : B), Exists fun a => f a = b) → Exists fun g => ((∀ (a : A), g (f a) = a ∧ ∀ (b : B), f (g b) = b) ∧ (∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂ ∧ ∀ (b : A), Exists fun a => g a = b))

Logical form (Lean):

```lean
theorem InverseBijection {f : A → B} (hf : IsBijectiveOn f) :
    ∃ g : B → A, IsInverseFunctionOf g f ∧ IsBijectiveOn g
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem InverseBijection {f : A → B} (hf : IsBijectiveOn f) :
    ∃ g : B → A, IsInverseFunctionOf g f ∧ IsBijectiveOn g := by
  sorry

/--
`PreimageUnionIntersection` TODO

Predicate logic:

  f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T ∧ f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T ∧ f ⁻¹' Sᶜ = (f ⁻¹' S)ᶜ

Predicate logic (unfolded):

  ∀ {A : Type u_1} {B : Type u_2} {f : A → B} (S T : B → Prop), (fun x => Set.instMembership.1 (Set.instUnion.1 S T) (f x) = Set.instUnion.1 (fun x => Set.instMembership.1 S (f x)) fun x => Set.instMembership.1 T (f x) ∧ (fun x => Set.instMembership.1 (Set.instInter.1 S T) (f x) = Set.instInter.1 (fun x => Set.instMembership.1 S (f x)) fun x => Set.instMembership.1 T (f x) ∧ fun x => Set.instMembership.1 (Set.instCompl.1 S) (f x) = Set.instCompl.1 fun x => Set.instMembership.1 S (f x)))

Logical form (Lean):

```lean
theorem PreimageUnionIntersection {f : A → B} (S T : Set B) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T ∧
      f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T ∧
      f ⁻¹' Sᶜ = (f ⁻¹' S)ᶜ
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases

-/
theorem PreimageUnionIntersection {f : A → B} (S T : Set B) :
    f ⁻¹' (S ∪ T) = f ⁻¹' S ∪ f ⁻¹' T ∧
      f ⁻¹' (S ∩ T) = f ⁻¹' S ∩ f ⁻¹' T ∧
      f ⁻¹' Sᶜ = (f ⁻¹' S)ᶜ := by
  sorry

end LRA.Analysis.Functions
