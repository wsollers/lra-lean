
import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Convex.Basic

namespace LRA.Analysis.RealAnalysis

/--
`IsBigOAt` TODO

Predicate logic:

  ∀ (f g : Real → Real) (a : Real), Exists fun C => (GT.gt C 0 ∧ (Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (f x)) (instHMul.hMul C (abs (g x)))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun C => (Real.instLT.lt 0 C ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul C (abs (g x)))))))

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

  ∀ (f g : Real → Real), Exists fun C => (GT.gt C 0 ∧ (Exists fun R => (GT.gt R 0 ∧ (∀ (x : Real), GT.gt x R → Real.instLE.le (abs (f x)) (instHMul.hMul C (abs (g x)))))))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun C => (Real.instLT.lt 0 C ∧ (Exists fun R => (Real.instLT.lt 0 R ∧ (∀ (x : Real), Real.instLT.lt R x → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul C (abs (g x)))))))

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

  ∀ (f g : Real → Real) (a : Real), (∀ (ε : Real), GT.gt ε 0 → Exists fun δ => (GT.gt δ 0 ∧ (∀ (x : Real), Real.instLT.lt 0 (abs (instHSub.hSub x a)) → Real.instLT.lt (abs (instHSub.hSub x a)) δ → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x)))))) → LRA.Analysis.RealAnalysis.IsBigOAt f g a

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
    a : ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))) → Exists fun C => (Real.instLT.lt 0 C ∧ (Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x a)) δ → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul C (abs (g x)))))))

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

  ∀ (f g : Real → Real), (∀ (ε : Real), GT.gt ε 0 → Exists fun R => (GT.gt R 0 ∧ (∀ (x : Real), GT.gt x R → Real.instLE.le (abs (f x)) (instHMul.hMul ε (abs (g x)))))) → LRA.Analysis.RealAnalysis.IsBigOAtTop f g

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    f g : ℝ → ℝ
  Prove
    (∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun R => (Real.instLT.lt 0 R ∧ (∀ (x : Real), Real.instLT.lt R x → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ε (abs (g x)))))) → Exists fun C => (Real.instLT.lt 0 C ∧ (Exists fun R => (Real.instLT.lt 0 R ∧ (∀ (x : Real), Real.instLT.lt R x → Real.instLE.le (abs (f x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul C (abs (g x)))))))

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

  ∀ (a b : Real), (Real.instLE.le 0 a ∧ Real.instLE.le 0 b) → ∀ (p q : Real), (Real.instLT.lt 1 p ∧ (Real.instLT.lt 1 q ∧ instHAdd.hAdd (instHDiv.hDiv 1 p) (instHDiv.hDiv 1 q) = 1)) → Real.instLE.le (instHMul.hMul a b) (instHAdd.hAdd (instHDiv.hDiv (instHPow.hPow a p) p) (instHDiv.hDiv (instHPow.hPow b q) q))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    a b : ℝ
    p q : ℝ
  Prove
    (Real.instLE.le 0 a ∧ Real.instLE.le 0 b) → ∀ (p q : Real), (Real.instLT.lt 1 p ∧ (Real.instLT.lt 1 q ∧ { hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 p) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv 1 q) = 1)) → Real.instLE.le ({ hMul := fun a b => Real.instMul.mul a b }.hMul a b) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (instHPow.1 a p) p) ({ hDiv := fun a b => Real.instDivInvMonoid.3.div a b }.hDiv (instHPow.1 b q) q))

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

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    (Real.instLE.le 0 lam ∧ Real.instLE.le lam 1) → Real.instLE.le (φ ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 lam) y))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam (φ x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 lam) (φ y)))

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

  ∀ (φ : Real → Real), LRA.Analysis.RealAnalysis.IsConvexOnR φ → ∀ (n : Nat), instLTNat.lt 0 n → ∀ (x lam : Fin n → Real), ((∀ (i : Fin n), Real.instLE.le 0 (lam i)) ∧ Finset.univ.sum lam = 1) → Real.instLE.le (φ (Finset.univ.sum fun i => instHMul.hMul (lam i) (x i))) (Finset.univ.sum fun i => instHMul.hMul (lam i) (φ (x i)))

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    φ : ℝ → ℝ
    n : ℕ
    x lam : Fin n → ℝ
  Prove
    (∀ (x y lam : Real), Real.instLE.le 0 lam → Real.instLE.le lam 1 → Real.instLE.le (φ ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam x) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 lam) y))) ({ hAdd := fun a b => Real.instAdd.add a b }.hAdd ({ hMul := fun a b => Real.instMul.mul a b }.hMul lam (φ x)) ({ hMul := fun a b => Real.instMul.mul a b }.hMul ({ hSub := fun a b => Real.instSub.sub a b }.hSub 1 lam) (φ y)))) → ∀ (n : Nat), instLTNat.lt 0 n → ∀ (x lam : Fin n → Real), ((∀ (i : Fin n), Real.instLE.le 0 (lam i)) ∧ Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map lam l)) ⋯ Finset.univ.val) = 1) → Real.instLE.le (φ (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (lam i) (x i)) l)) ⋯ Finset.univ.val))) (Quot.lift (fun l => List.foldr (fun x1 x2 => { hAdd := fun a b => Real.instAddCommMonoid.toAddZeroClass.toAddZero.2.add a b }.hAdd x1 x2) 0 l) ⋯ (Quot.lift (fun l => Multiset.ofList (List.map (fun i => instHMul.hMul (lam i) (φ (x i))) l)) ⋯ Finset.univ.val))

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
