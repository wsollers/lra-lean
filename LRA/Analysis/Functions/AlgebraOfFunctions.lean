
import Mathlib.Logic.Function.Basic
import Mathlib.Data.Set.Basic

namespace LRA.Analysis.Functions

variable {A B C : Type*}

/--
`IsInjectiveOn` TODO

Predicate logic:

  ∀ {A : Type u_1} {B : Type u_2} (f : A → B) (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    f a₁ = f a₂ → a₁ = a₂

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun a => f a = b

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂) ∧ (∀ (b : B), Exists fun a => f a = b))

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

  ∀ {A : Type u_1} {B : Type u_2} (g : B → A) (f : A → B), ((∀ (a : A), g (f a) = a) ∧ (∀ (b : B), f (g b) = b))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (a : A), g (f a) = a) ∧ (∀ (b : B), f (g b) = b))

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

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, (LRA.Analysis.Functions.IsInjectiveOn f ∧ LRA.Analysis.Functions.IsInjectiveOn g) → LRA.Analysis.Functions.IsInjectiveOn (Function.comp g f)

Predicate logic (unfolded):

  Ambient
    (A, B, C)
  Objects
    f : A → B
    g : B → C
  Prove
    ((∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂) ∧ (∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂)) → ∀ (a₁ a₂ : A), g (f a₁) = g (f a₂) → a₁ = a₂

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

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, (LRA.Analysis.Functions.IsSurjectiveOn f ∧ LRA.Analysis.Functions.IsSurjectiveOn g) → LRA.Analysis.Functions.IsSurjectiveOn (Function.comp g f)

Predicate logic (unfolded):

  Ambient
    (A, B, C)
  Objects
    f : A → B
    g : B → C
  Prove
    ((∀ (b : B), Exists fun a => f a = b) ∧ (∀ (b : C), Exists fun a => g a = b)) → ∀ (b : C), Exists fun a => g (f a) = b

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

  ∀ {A : Type u_1} {B : Type u_2} {C : Type u_3} {f : A → B} {g : B → C}, (LRA.Analysis.Functions.IsBijectiveOn f ∧ LRA.Analysis.Functions.IsBijectiveOn g) → LRA.Analysis.Functions.IsBijectiveOn (Function.comp g f)

Predicate logic (unfolded):

  Ambient
    (A, B, C)
  Objects
    f : A → B
    g : B → C
  Prove
    (((∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂) ∧ (∀ (b : B), Exists fun a => f a = b)) ∧ ((∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂) ∧ (∀ (b : C), Exists fun a => g a = b))) → ((∀ (a₁ a₂ : A), g (f a₁) = g (f a₂) → a₁ = a₂) ∧ (∀ (b : C), Exists fun a => g (f a) = b))

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

  ∀ {A : Type u_1} {B : Type u_2} {f : A → B}, LRA.Analysis.Functions.IsBijectiveOn f → Exists fun g => (LRA.Analysis.Functions.IsInverseFunctionOf g f ∧ LRA.Analysis.Functions.IsBijectiveOn g)

Predicate logic (unfolded):

  Ambient
    (A, B, C)
  Objects
    f : A → B
  Prove
    ((∀ (a₁ a₂ : A), f a₁ = f a₂ → a₁ = a₂) ∧ (∀ (b : B), Exists fun a => f a = b)) → Exists fun g => (((∀ (a : A), g (f a) = a) ∧ (∀ (b : B), f (g b) = b)) ∧ ((∀ (a₁ a₂ : B), g a₁ = g a₂ → a₁ = a₂) ∧ (∀ (b : A), Exists fun a => g a = b)))

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

  ∀ {A : Type u_1} {B : Type u_2} {f : A → B} (S T : Set B), (Set.preimage f (S ∪ T) = Set.preimage f S ∪ Set.preimage f T ∧ (Set.preimage f (S ∩ T) = Set.preimage f S ∩ Set.preimage f T ∧ Set.preimage f (Set.instCompl.compl S) = Set.instCompl.compl (Set.preimage f S)))

Predicate logic (unfolded):

  Ambient
    (A, B, C)
  Objects
    f : A → B
    S T : Set B
  Prove
    (fun x => f x ∈ S ∪ T = fun x => f x ∈ S ∪ funx => f x ∈ T ∧ (fun x => f x ∈ S ∩ T = fun x => f x ∈ S ∩ funx => f x ∈ T ∧ fun x => f x ∈ Set.instCompl.1 S = Set.instCompl.1 fun x => f x ∈ S))

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
