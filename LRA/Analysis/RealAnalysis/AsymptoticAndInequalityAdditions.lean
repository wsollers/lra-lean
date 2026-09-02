
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convex.Basic

namespace LRA.Analysis.RealAnalysis

/--
`IsBigOAt` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a : Real), Exists fun C => (GT.gt C 0 ∧ Exists fun δ => (GT.gt δ 0 ∧ ∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (f x)) (instHMul.hMul C (abs (g x)))))

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a : Real), Exists fun C => (Real.instLT.1 Zero.toOfNat0.1 C ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 C (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))))

Logical form (Lean):

```lean
def IsBigOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∃ C > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ C * |g x|
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
def IsBigOAt (f g : ℝ → ℝ) (a : ℝ) : Prop :=
  ∃ C > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ C * |g x|

/--
`IsBigOAtTop` TODO

Predicate logic:

  ∀ (f g : Real → Real), Exists fun C => (GT.gt C 0 ∧ Exists fun R => (GT.gt R 0 ∧ ∀ (x : Real), GT.gt x R → Real.instLE.le (abs (f x)) (instHMul.hMul C (abs (g x)))))

Predicate logic (unfolded):

  ∀ (f g : Real → Real), Exists fun C => (Real.instLT.1 Zero.toOfNat0.1 C ∧ Exists fun R => (Real.instLT.1 Zero.toOfNat0.1 R ∧ ∀ (x : Real), Real.instLT.1 R x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 C (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))))

Logical form (Lean):

```lean
def IsBigOAtTop (f g : ℝ → ℝ) : Prop :=
  ∃ C > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ C * |g x|
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
def IsBigOAtTop (f g : ℝ → ℝ) : Prop :=
  ∃ C > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ C * |g x|

/--
`LittleOImpliesBigOAt` TODO

Predicate logic:

  (∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) → IsBigOAt f g a

Predicate logic (unfolded):

  ∀ (f g : Real → Real) (a : Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))) → Exists fun C => (Real.instLT.1 Zero.toOfNat0.1 C ∧ Exists fun δ => (Real.instLT.1 Zero.toOfNat0.1 δ ∧ ∀ (x : Real), Real.instLT.1 Zero.toOfNat0.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) → Real.instLT.1 (SemilatticeSup.toMax.1 (instHSub.1 x a) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (instHSub.1 x a))) δ → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 C (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))))

Logical form (Lean):

```lean
theorem LittleOImpliesBigOAt
    (f g : ℝ → ℝ) (a : ℝ)
    (ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) :
    IsBigOAt f g a
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
theorem LittleOImpliesBigOAt
    (f g : ℝ → ℝ) (a : ℝ)
    (ho : ∀ ε > 0, ∃ δ > 0, ∀ x, 0 < |x - a| → |x - a| < δ → |f x| ≤ ε * |g x|) :
    IsBigOAt f g a := by
  sorry
/--
`LittleOImpliesBigOAtTop` TODO

Predicate logic:

  (∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) → IsBigOAtTop f g

Predicate logic (unfolded):

  ∀ (f g : Real → Real), (∀ (ε : Real), Real.instLT.1 Zero.toOfNat0.1 ε → Exists fun R => (Real.instLT.1 Zero.toOfNat0.1 R ∧ ∀ (x : Real), Real.instLT.1 R x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 ε (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x)))))) → Exists fun C => (Real.instLT.1 Zero.toOfNat0.1 C ∧ Exists fun R => (Real.instLT.1 Zero.toOfNat0.1 R ∧ ∀ (x : Real), Real.instLT.1 R x → Real.instLE.1 (SemilatticeSup.toMax.1 (f x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (f x))) (instHMul.1 C (SemilatticeSup.toMax.1 (g x) (SubtractionMonoid.toSubNegZeroMonoid.toNegZeroClass.toNeg.1 (g x))))))

Logical form (Lean):

```lean
theorem LittleOImpliesBigOAtTop
    (f g : ℝ → ℝ)
    (ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) :
    IsBigOAtTop f g
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
theorem LittleOImpliesBigOAtTop
    (f g : ℝ → ℝ)
    (ho : ∀ ε > 0, ∃ R > 0, ∀ x, x > R → |f x| ≤ ε * |g x|) :
    IsBigOAtTop f g := by
  sorry
/--
`YoungsInequality` TODO

Predicate logic:

  (0 ≤ a ∧ 0 ≤ b ∧ 1 < p ∧ 1 < q ∧ 1 / p + 1 / q = 1) → a * b ≤ a ^ p / p + b ^ q / q

Predicate logic (unfolded):

  ∀ (a b : Real), (Real.instLE.1 Zero.toOfNat0.1 a ∧ Real.instLE.1 Zero.toOfNat0.1 b) → ∀ (p q : Real), (Real.instLT.1 One.toOfNat1.1 p ∧ (Real.instLT.1 One.toOfNat1.1 q ∧ instHAdd.1 (instHDiv.1 One.toOfNat1.1 p) (instHDiv.1 One.toOfNat1.1 q) = One.toOfNat1.1)) → Real.instLE.1 (instHMul.1 a b) (instHAdd.1 (instHDiv.1 (instHPow.1 a p) p) (instHDiv.1 (instHPow.1 b q) q))

Logical form (Lean):

```lean
theorem YoungsInequality
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (p q : ℝ) (hp : 1 < p) (hq : 1 < q) (hpq : 1 / p + 1 / q = 1) :
    a * b ≤ a ^ p / p + b ^ q / q
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
theorem YoungsInequality
    (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (p q : ℝ) (hp : 1 < p) (hq : 1 < q) (hpq : 1 / p + 1 / q = 1) :
    a * b ≤ a ^ p / p + b ^ q / q := by
  sorry
/--
`IsConvexOnR` TODO

Predicate logic:

  ∀ (φ : Real → Real) (x y lam : Real), (Real.instLE.le 0 lam ∧ Real.instLE.le lam 1) → Real.instLE.le (φ (instHAdd.hAdd (instHMul.hMul lam x) (instHMul.hMul (instHSub.hSub 1 lam) y))) (instHAdd.hAdd (instHMul.hMul lam (φ x)) (instHMul.hMul (instHSub.hSub 1 lam) (φ y)))

Predicate logic (unfolded):

  ∀ (φ : Real → Real) (x y lam : Real), (Real.instLE.1 Zero.toOfNat0.1 lam ∧ Real.instLE.1 lam One.toOfNat1.1) → Real.instLE.1 (φ (instHAdd.1 (instHMul.1 lam x) (instHMul.1 (instHSub.1 One.toOfNat1.1 lam) y))) (instHAdd.1 (instHMul.1 lam (φ x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 lam) (φ y)))

Logical form (Lean):

```lean
def IsConvexOnR (φ : ℝ → ℝ) : Prop :=
  ∀ x y : ℝ, ∀ lam : ℝ, 0 ≤ lam → lam ≤ 1 →
    φ (lam * x + (1 - lam) * y) ≤ lam * φ x + (1 - lam) * φ y
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
def IsConvexOnR (φ : ℝ → ℝ) : Prop :=
  ∀ x y : ℝ, ∀ lam : ℝ, 0 ≤ lam → lam ≤ 1 →
    φ (lam * x + (1 - lam) * y) ≤ lam * φ x + (1 - lam) * φ y

/--
`JensensInequalityFinite` TODO

Predicate logic:

  (ℝ → ℝ ∧ IsConvexOnR φ ∧ 0 < n ∧ ∀ i, 0 ≤ lam i ∧ (Finset.univ.sum lam) = 1) → φ (Finset.univ.sum (fun i => lam i * x i)) ≤ Finset.univ.sum (fun i => lam i * φ (x i))

Predicate logic (unfolded):

  ∀ (φ : Real → Real), (∀ (x y lam : Real), Real.instLE.1 Zero.toOfNat0.1 lam → Real.instLE.1 lam One.toOfNat1.1 → Real.instLE.1 (φ (instHAdd.1 (instHMul.1 lam x) (instHMul.1 (instHSub.1 One.toOfNat1.1 lam) y))) (instHAdd.1 (instHMul.1 lam (φ x)) (instHMul.1 (instHSub.1 One.toOfNat1.1 lam) (φ y)))) → ∀ (n : Nat), instLTNat.1 (instOfNatNat 0).1 n → ∀ (x lam : Fin n → Real), (∀ (i : Fin n), Real.instLE.1 Zero.toOfNat0.1 (lam i) ∧ Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map lam l)) ⋯ Finset.univ.val) = One.toOfNat1.1) → Real.instLE.1 (φ (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (lam i) (x i)) l)) ⋯))) (Quot.lift (fun l => List.foldr (fun x1 x2 => instHAdd.1 x1 x2) Zero.toOfNat0.1 l) ⋯ (Quot.liftOn Finset.univ.val (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (lam i) (φ (x i))) l)) ⋯))

Logical form (Lean):

```lean
theorem JensensInequalityFinite
    (φ : ℝ → ℝ) (hφ : IsConvexOnR φ)
    (n : ℕ) (hn : 0 < n) (x lam : Fin n → ℝ)
    (hlam_nonneg : ∀ i, 0 ≤ lam i)
    (hlam_sum : (Finset.univ.sum lam) = 1) :
    φ (Finset.univ.sum (fun i => lam i * x i))
      ≤ Finset.univ.sum (fun i => lam i * φ (x i))
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
theorem JensensInequalityFinite
    (φ : ℝ → ℝ) (hφ : IsConvexOnR φ)
    (n : ℕ) (hn : 0 < n) (x lam : Fin n → ℝ)
    (hlam_nonneg : ∀ i, 0 ≤ lam i)
    (hlam_sum : (Finset.univ.sum lam) = 1) :
    φ (Finset.univ.sum (fun i => lam i * x i))
      ≤ Finset.univ.sum (fun i => lam i * φ (x i)) := by
  sorry
end LRA.Analysis.RealAnalysis
