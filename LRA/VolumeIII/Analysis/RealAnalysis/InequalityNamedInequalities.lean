/-
Draft module; not yet imported by the active Volume III root.
Source: real-analysis/notes/inequality/notes-inequality.tex, third block —
the "named inequalities" section (`thm:ineq-am-gm-two` through
`thm:ineq-bernoulli`). Companion to `AsymptoticAndInequalityAdditions.lean`
(ADDITIONS.md items 26-27, Young's and Jensen's Inequalities), which are
the two named inequalities the book itself does NOT contain despite this
section otherwise being remarkably complete.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Pow.Real

namespace LRA.VolumeIII.Analysis.RealAnalysis

-- `thm:ineq-am-gm-two`
/-- Let `a b : ℝ`. If `ha : a ≥ 0` and `hb : b ≥ 0`. Then `Real.sqrt (a * b) ≤ (a + b) / 2`. -/
theorem IneqAmGmTwo (a b : ℝ) (ha : a ≥ 0) (hb : b ≥ 0) :
    Real.sqrt (a * b) ≤ (a + b) / 2 := by sorry

/-- `def:classical-means`: arithmetic, geometric, and harmonic means of a
finite positive list. -/
noncomputable def ArithmeticMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.sum a) / n

/-- `def:classical-means`, geometric mean. -/
noncomputable def GeometricMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  (Finset.univ.prod a) ^ ((1 : ℝ) / n)

/-- `def:classical-means`, harmonic mean. -/
noncomputable def HarmonicMean (n : ℕ) (a : Fin n → ℝ) : ℝ :=
  n / Finset.univ.sum (fun i => 1 / a i)

-- `thm:ineq-am-gm`
/-- Let `n : ℕ`. If `hn : 0 < n`, `a : Fin n → ℝ`, and `ha : ∀ i, a i > 0`. Then `GeometricMean n a
≤ ArithmeticMean n a`. -/
theorem IneqAmGm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    GeometricMean n a ≤ ArithmeticMean n a := by sorry

-- `thm:ineq-am-gm-hm`
/-- Let `n : ℕ`. If `hn : 0 < n`, `a : Fin n → ℝ`, and `ha : ∀ i, a i > 0`. Then `HarmonicMean n a ≤
GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a`. -/
theorem IneqAmGmHm (n : ℕ) (hn : 0 < n) (a : Fin n → ℝ) (ha : ∀ i, a i > 0) :
    HarmonicMean n a ≤ GeometricMean n a ∧ GeometricMean n a ≤ ArithmeticMean n a := by
  sorry

-- `thm:ineq-cauchy-schwarz`
/-- Let `n : ℕ`. If `a b : Fin n → ℝ`. Then `|Finset.univ.sum (fun j => a j * b j)| ≤ Real.sqrt
(Finset.univ.sum (fun j => a j ^ 2)) * Real.sqrt (Finset.univ.sum (fun j => b j ^ 2))`. -/
theorem IneqCauchySchwarz (n : ℕ) (a b : Fin n → ℝ) :
    |Finset.univ.sum (fun j => a j * b j)| ≤
      Real.sqrt (Finset.univ.sum (fun j => a j ^ 2)) *
        Real.sqrt (Finset.univ.sum (fun j => b j ^ 2)) := by sorry

-- `thm:ineq-chebyshev-sum`
/-- Let `n : ℕ`. If `hn : 0 < n`, `a b : Fin n → ℝ`, `ha : Monotone a`, and `hb : Monotone b`. Then
`(ArithmeticMean n a) * (ArithmeticMean n b) ≤ ArithmeticMean n (fun j => a j * b j)`. -/
theorem IneqChebyshevSum (n : ℕ) (hn : 0 < n) (a b : Fin n → ℝ)
    (ha : Monotone a) (hb : Monotone b) :
    (ArithmeticMean n a) * (ArithmeticMean n b) ≤
      ArithmeticMean n (fun j => a j * b j) := by sorry

-- `thm:ineq-rearrangement`
/-- Let `n : ℕ` and `σ : Equiv.Perm (Fin n)`. If `a b : Fin n → ℝ`, `ha : Monotone a`, and `hb :
Monotone b`. Then `Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤ Finset.univ.sum (fun j => a
j * b (σ j)) ∧ Finset.univ.sum (fun j => a j * b (σ j)) ≤ Finset.univ.sum (fun j => a j * b j)`. -/
theorem IneqRearrangement (n : ℕ) (a b : Fin n → ℝ) (ha : Monotone a) (hb : Monotone b)
    (σ : Equiv.Perm (Fin n)) :
    Finset.univ.sum (fun j => a j * b (Fin.rev j)) ≤
      Finset.univ.sum (fun j => a j * b (σ j)) ∧
    Finset.univ.sum (fun j => a j * b (σ j)) ≤
      Finset.univ.sum (fun j => a j * b j) := by sorry

-- `thm:ineq-holder`
/-- Let `n : ℕ` and `p q : ℝ`. If `hp : p > 1`, `hq : q > 1`, `hpq : 1 / p + 1 / q = 1`, and `a b :
Fin n → ℝ`. Then `Finset.univ.sum (fun j => |a j * b j|) ≤ (Finset.univ.sum (fun j => |a j| ^
p)) ^ (1 / p) * (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q)`. -/
theorem IneqHolder (n : ℕ) (p q : ℝ) (hp : p > 1) (hq : q > 1)
    (hpq : 1 / p + 1 / q = 1) (a b : Fin n → ℝ) :
    Finset.univ.sum (fun j => |a j * b j|) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) *
        (Finset.univ.sum (fun j => |b j| ^ q)) ^ (1 / q) := by sorry

-- `thm:ineq-minkowski`
/-- Let `n : ℕ` and `p : ℝ`. If `hp : p ≥ 1` and `a b : Fin n → ℝ`. Then `(Finset.univ.sum (fun j =>
|a j + b j| ^ p)) ^ (1 / p) ≤ (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) +
(Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p)`. -/
theorem IneqMinkowski (n : ℕ) (p : ℝ) (hp : p ≥ 1) (a b : Fin n → ℝ) :
    (Finset.univ.sum (fun j => |a j + b j| ^ p)) ^ (1 / p) ≤
      (Finset.univ.sum (fun j => |a j| ^ p)) ^ (1 / p) +
        (Finset.univ.sum (fun j => |b j| ^ p)) ^ (1 / p) := by sorry

-- `thm:ineq-bernoulli`
/-- Let `x : ℝ` and `n : ℕ`. If `hx : x ≥ -1`. Then `(1 + x) ^ n ≥ 1 + n * x`. -/
theorem IneqBernoulli (x : ℝ) (n : ℕ) (hx : x ≥ -1) :
    (1 + x) ^ n ≥ 1 + n * x := by sorry

end LRA.VolumeIII.Analysis.RealAnalysis
