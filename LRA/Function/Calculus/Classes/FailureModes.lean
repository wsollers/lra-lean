import LRA.Function.Calculus.Classes.Definition
import LRA.Function.Properties.Definition
import LRA.Set.SetClass.Operations

namespace LRA.Function

open LRA.Set
universe u v

/--
`UnitProper` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (source : LRA.Set.SetClass Domain), (source.Included (function.PreimageClass (function.ImageClass source)) ∧ Ne (function.PreimageClass (function.ImageClass source)) source)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (source : Domain → Prop), (∀ (element : Domain), source element → Exists fun y => (Exists fun x => (source x ∧ function x = y) ∧ function element = y) ∧ fun x => Exists fun y => (Exists fun x => (source x ∧ LRA.Function.Graph function x y) ∧ function x = y) = source → False)

Logical form (Lean):

```lean
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def UnitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (source : SetClass Domain) : Prop :=
  SetClass.Included source
      (PreimageClass function (ImageClass function source)) ∧
    PreimageClass function (ImageClass function source) ≠ source

/--
`CounitProper` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain) (target : LRA.Set.SetClass Codomain), ((function.ImageClass (function.PreimageClass target)).Included target ∧ Ne (function.ImageClass (function.PreimageClass target)) target)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain) (target : Codomain → Prop), (∀ (element : Codomain), (Exists fun x => (Exists fun y => (target y ∧ function x = y) ∧ function x = element)) → target element ∧ fun y => Exists fun x => (Exists fun y => (target y ∧ LRA.Function.Graph function x y) ∧ function x = y) = target → False)

Logical form (Lean):

```lean
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def CounitProper {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain)
    (target : SetClass Codomain) : Prop :=
  SetClass.Included
      (ImageClass function (PreimageClass function target)) target ∧
    ImageClass function (PreimageClass function target) ≠ target

/--
`EmptyIndexedIntersectionImageFailure` TODO

Predicate logic:

  ∀ {Domain : Type u} {Codomain : Type v} (function : LRA.Function Domain Codomain), (function.Injective ∧ Ne (function.ImageClass LRA.Set.SetClass.Universal) LRA.Set.SetClass.Universal)

Predicate logic (unfolded):

  ∀ {Domain : Type u} {Codomain : Type v} (function : Domain → Codomain), (∀ (y : Codomain) (x₁ x₂ : Domain), function x₁ = y → function x₂ = y → x₁ = x₂ ∧ (fun y => Exists fun x => (True ∧ function x = y) = funx => True) → False)

Logical form (Lean):

```lean
def EmptyIndexedIntersectionImageFailure
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧
    ImageClass function (SetClass.Universal : SetClass Domain) ≠
      (SetClass.Universal : SetClass Codomain)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def EmptyIndexedIntersectionImageFailure
    {Domain : Type u} {Codomain : Type v}
    (function : LRA.Function Domain Codomain) : Prop :=
  Injective function ∧
    ImageClass function (SetClass.Universal : SetClass Domain) ≠
      (SetClass.Universal : SetClass Codomain)

/--
`SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure` TODO

Predicate logic:

  EmptyIndexedIntersectionImageFailure fun n ∈ Nat => some n

Predicate logic (unfolded):

  (∀ (y : Option Nat) (x₁ x₂ : Nat), (fun n => Option.some n) x₁ = y → (fun n => Option.some n) x₂ = y → x₁ = x₂ ∧ (fun y => Exists fun x => (True ∧ (fun n => Option.some n) x = y) = funx => True) → False)

Logical form (Lean):

```lean
theorem SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure :
    EmptyIndexedIntersectionImageFailure (fun n : Nat => some n)
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
theorem SomeEmbeddingRealizesEmptyIndexedIntersectionImageFailure :
    EmptyIndexedIntersectionImageFailure (fun n : Nat => some n) := by
  sorry

end LRA.Function
