
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Real.Sqrt
import LRA.Analysis.Continuity.GlobalTheorems

namespace LRA.Analysis.Continuity

/--
`IsUniformlyContinuous` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → ∀ (y : Real), Set.instMembership.mem A y → Real.instLT.lt (abs (instHSub.hSub x y)) δ → Real.instLT.lt (abs (instHSub.hSub (f x) (f y))) ε)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε)

Logical form (Lean):

```lean
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε
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
def IsUniformlyContinuous (f : ℝ → ℝ) (A : Set ℝ) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x ∈ A, ∀ y ∈ A, |x - y| < δ → |f x - f y| < ε

/--
`UcAdd` TODO

Predicate logic:

  (IsUniformlyContinuous f A ∧ IsUniformlyContinuous g A) → IsUniformlyContinuous (fun x => f x + g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) (g y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) (g y)))) ε)) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHAdd.1 (f x) (g x)) x) ((fun x => instHAdd.1 (f x) (g x)) y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHAdd.hAdd (f x) (g x)) x) ((fun x => instHAdd.hAdd (f x) (g x)) y)))) ε)

Logical form (Lean):

```lean
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A
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
theorem UcAdd (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A) :
    IsUniformlyContinuous (fun x => f x + g x) A := by
  sorry

/--
`UcMulOfBounded` TODO

Predicate logic:

  (IsUniformlyContinuous f A ∧ IsUniformlyContinuous g A) → IsUniformlyContinuous (fun x => f x * g x) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A : Real → Prop), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε) ∧ (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) (g y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) (g y)))) ε) ∧ (Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) M) ∧ Exists fun M => (Real.instLT.1 Zero.toOfNat0.1 M ∧ ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))) M)))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => instHMul.1 (f x) (g x)) x) ((fun x => instHMul.1 (f x) (g x)) y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => instHMul.hMul (f x) (g x)) x) ((fun x => instHMul.hMul (f x) (g x)) y)))) ε)

Logical form (Lean):

```lean
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A
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
theorem UcMulOfBounded (f g : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hg : IsUniformlyContinuous g A)
    (hfB : BoundedOnSet f A) (hgB : BoundedOnSet g A) :
    IsUniformlyContinuous (fun x => f x * g x) A := by
  sorry

/--
`UcComp` TODO

Predicate logic:

  (IsUniformlyContinuous f A ∧ ∀ x ∈ A, f x ∈ B ∧ IsUniformlyContinuous g B) → IsUniformlyContinuous (fun x => g (f x)) A

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (A B : Real → Prop), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε) ∧ (∀ (x : Real), Set.instMembership.1 A x → Set.instMembership.1 B (f x) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 B x → ∀ (y : Real), Set.instMembership.1 B y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (g x) (g y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (g x) (g y)))) ε))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 ((fun x => g (f x)) x) ((fun x => g (f x)) y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 ((fun x => g (f x)) x) ((fun x => g (f x)) y)))) ε)

Logical form (Lean):

```lean
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A
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
theorem UcComp (f g : ℝ → ℝ) (A B : Set ℝ)
    (hf : IsUniformlyContinuous f A) (hfA : ∀ x ∈ A, f x ∈ B)
    (hg : IsUniformlyContinuous g B) :
    IsUniformlyContinuous (fun x => g (f x)) A := by
  sorry

/--
`UcIffSequential` TODO

Predicate logic:

  (ℝ → ℝ) → IsUniformlyContinuous f A ↔ ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, |xs n - ys n| < ε → ∀ ε > 0, ∃ N ∈ ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε) ↔ ∀ (xs ys : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n)) → (∀ (n : Nat), Set.instMembership.1 A (ys n)) → (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs n) (ys n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs n) (ys n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs n)) (f (ys n))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs n)) (f (ys n))))) ε

Logical form (Lean):

```lean
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, use, rcases

-/
theorem UcIffSequential (f : ℝ → ℝ) (A : Set ℝ) :
    IsUniformlyContinuous f A ↔
      ∀ xs ys : ℕ → ℝ, (∀ n, xs n ∈ A) → (∀ n, ys n ∈ A) →
        (∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |xs n - ys n| < ε) →
        ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f (xs n) - f (ys n)| < ε := by
  sorry

/--
`UcMapsCauchyToCauchy` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsUniformlyContinuous f A ∧ ℕ → ℝ ∧ ∀ n, xs n ∈ A ∧ ∀ ε > 0, ∃ N ∈ ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) → ∀ ε > 0, ∃ N ∈ ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε)) → ∀ (xs : Nat → Real), (∀ (n : Nat), Set.instMembership.1 A (xs n) ∧ ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (xs m) (xs n)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (xs m) (xs n)))) ε) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun N => ∀ (m : Nat), instLENat.1 N m → ∀ (n : Nat), instLENat.1 N n → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f (xs m)) (f (xs n))) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f (xs m)) (f (xs n))))) ε

Logical form (Lean):

```lean
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem UcMapsCauchyToCauchy (f : ℝ → ℝ) (A : Set ℝ)
    (hf : IsUniformlyContinuous f A) (xs : ℕ → ℝ) (hxs : ∀ n, xs n ∈ A)
    (hCauchy : ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |xs m - xs n| < ε) :
    ∀ ε > 0, ∃ N : ℕ, ∀ m ≥ N, ∀ n ≥ N, |f (xs m) - f (xs n)| < ε := by
  sorry

/--
`IsLipschitzOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (K : Real), (GE.ge K 0 ∧ ∀ (x : Real), Set.instMembership.mem A x → ∀ (y : Real), Set.instMembership.mem A y → Real.instLE.le (abs (instHSub.hSub (f x) (f y))) (instHMul.hMul K (abs (instHSub.hSub x y))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (K : Real), (Real.instLE.1 Zero.toOfNat0.1 K ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) (instHMul.1 K (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y)))))

Logical form (Lean):

```lean
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|
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
def IsLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ) : Prop :=
  K ≥ 0 ∧ ∀ x ∈ A, ∀ y ∈ A, |f x - f y| ≤ K * |x - y|

/--
`LipschitzImpliesUc` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsLipschitzOn f A K) → IsUniformlyContinuous f A

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (K : Real), (Real.instLE.1 Zero.toOfNat0.1 K ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) (instHMul.1 K (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))))) → ∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ε)

Logical form (Lean):

```lean
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A
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
theorem LipschitzImpliesUc (f : ℝ → ℝ) (A : Set ℝ) (K : ℝ)
    (hf : IsLipschitzOn f A K) : IsUniformlyContinuous f A := by
  sorry

/--
`IsBiLipschitzOn` TODO

Predicate logic:

  ∀ (f : Real → Real) (A : Set Real) (α K : Real), (Real.instLT.lt 0 α ∧ (Real.instLE.le α K ∧ ∀ (x : Real), Set.instMembership.mem A x → ∀ (y : Real), Set.instMembership.mem A y → (Real.instLE.le (instHMul.hMul α (abs (instHSub.hSub x y))) (abs (instHSub.hSub (f x) (f y))) ∧ Real.instLE.le (abs (instHSub.hSub (f x) (f y))) (instHMul.hMul K (abs (instHSub.hSub x y))))))

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (α K : Real), (Real.instLT.1 Zero.toOfNat0.1 α ∧ (Real.instLE.1 α K ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → (Real.instLE.1 (instHMul.1 α (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y)))) (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ∧ Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) (instHMul.1 K (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y)))))))

Logical form (Lean):

```lean
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|
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
def IsBiLipschitzOn (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ) : Prop :=
  0 < α ∧ α ≤ K ∧ ∀ x ∈ A, ∀ y ∈ A,
    α * |x - y| ≤ |f x - f y| ∧ |f x - f y| ≤ K * |x - y|

/--
`BiLipschitzInverseIsLipschitz` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsBiLipschitzOn f A α K ∧ ℝ → ℝ ∧ ∀ x ∈ A, finv (f x) = x) → IsLipschitzOn finv (f '' A) (1 / α)

Predicate logic (unfolded):

  ∀ (f : Real → Real) (A : Real → Prop) (α K : Real), (Real.instLT.1 Zero.toOfNat0.1 α ∧ (Real.instLE.1 α K ∧ ∀ (x : Real), Set.instMembership.1 A x → ∀ (y : Real), Set.instMembership.1 A y → (Real.instLE.1 (instHMul.1 α (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y)))) (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) ∧ Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (f x) (f y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (f x) (f y)))) (instHMul.1 K (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y))))))) → ∀ (finv : Real → Real), (∀ (x : Real), Set.instMembership.1 A x → finv (f x) = x) → (Real.instLE.1 Zero.toOfNat0.1 (instHDiv.1 One.toOfNat1.1 α) ∧ ∀ (x : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) x → ∀ (y : Real), Set.instMembership.1 (fun x => Exists fun a => (Set.instMembership.1 A a ∧ f a = x)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 (finv x) (finv y)) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 (finv x) (finv y)))) (instHMul.1 (instHDiv.1 One.toOfNat1.1 α) (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x y)))))

Logical form (Lean):

```lean
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α)
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
theorem BiLipschitzInverseIsLipschitz (f : ℝ → ℝ) (A : Set ℝ) (α K : ℝ)
    (hf : IsBiLipschitzOn f A α K) (finv : ℝ → ℝ)
    (hfinv : ∀ x ∈ A, finv (f x) = x) :
    IsLipschitzOn finv (f '' A) (1 / α) := by
  sorry

/--
`SqrtUcNotLipschitz` TODO

Predicate logic:

  IsUniformlyContinuous Real.sqrt (Set.Icc 0 ∈ ℝ 1) ∧ ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc 0 ∈ ℝ 1) K

Predicate logic (unfolded):

  (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 Zero.toOfNat0.1 x ∧ Real.instPreorder.toLE.1 x One.toOfNat1.1)) y → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x y))) δ → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x.sqrt y.sqrt) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x.sqrt y.sqrt))) ε) ∧ (Exists fun K => (Real.instLE.1 Zero.toOfNat0.1 K ∧ ∀ (x : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 0 x ∧ Real.instPreorder.toLE.1 x 1)) x → ∀ (y : Real), Set.instMembership.1 (fun x => (Real.instPreorder.toLE.1 0 x ∧ Real.instPreorder.toLE.1 x 1)) y → Real.instLE.1 (SemilatticeSup.toMax.1 (instHSub.1 x.sqrt y.sqrt) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.hSub x.sqrt y.sqrt))) (instHMul.1 K (SemilatticeSup.toMax.1 (instHSub.hSub x y) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.neg (instHSub.hSub x y)))))) → False)

Logical form (Lean):

```lean
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem SqrtUcNotLipschitz :
    IsUniformlyContinuous Real.sqrt (Set.Icc (0:ℝ) 1) ∧
    ¬ ∃ K, IsLipschitzOn Real.sqrt (Set.Icc (0:ℝ) 1) K := by
  sorry

end LRA.Analysis.Continuity
