/-
Draft module; not yet imported by the active Volume III root.
Source: book-analysis-ii/differentiation/notes/chain-rule/{notes-caratheodory.tex,
notes-chain-rule.tex}.

Full-coverage pass over the `chain-rule` section, including the Faà di
Bruno formula (hand-verified against the general combinatorial formula at
n=2, n=3 during the content audit — both checked out exactly). One Lean
statement per book label, `sorry`-bodied.
-/

import Mathlib.Data.Real.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import LRA.VolumeIII.Analysis.Differentiation.DerivativeDefinition

namespace LRA.VolumeIII.Analysis.Differentiation

-- `thm:caratheodory-characterization-of-differentiability`
/-- `f` is
differentiable at `c` with derivative `D` iff there is a function `φ`,
continuous at `c`, with `φ(c) = D`, such that `f(x) - f(c) = (x-c)·φ(x)`
for all `x` in the domain. -/
theorem CaratheodoryCharacterization (f : ℝ → ℝ) (A : Set ℝ) (c D : ℝ) :
    Derivative D f A c ↔
      ∃ φ : ℝ → ℝ, φ c = D ∧
        LRA.VolumeIII.Analysis.Continuity.ContinuousAtPoint φ A c ∧
        ∀ x ∈ A, f x - f c = (x - c) * φ x := by
  sorry

-- `thm:chain-rule`
/-- proved via the Carathéodory characterization: the
composition of differentiable functions is differentiable, with the
product-of-derivatives formula. -/
theorem ChainRule (f g : ℝ → ℝ) (A B : Set ℝ) (c Df Dg : ℝ)
    (hf : Derivative Df f A c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : Derivative Dg g B (f c)) :
    Derivative (Dg * Df) (fun x => g (f x)) A c := by
  sorry

/-- `NthDerivativeAt f fD n c`: `fD` is a witnessing sequence of iterated
derivatives of `f` at `c` through order `n` (`fD 0 = f` and each
`fD (k+1) c` is the derivative value of `fD k` at `c`, for `k < n`). Local
stand-in for `def:higher-derivatives`, which is defined properly once
`GraphReading.lean` (`graph-reading` section) is ported. -/
def NthDerivativeAt (f : ℝ → ℝ) (fD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ) : Prop :=
  fD 0 = f ∧ ∀ k < n, Derivative (fD (k + 1) c) (fD k) A c

-- `thm:leibniz-rule`
/-- the general Leibniz rule for the `n`-th
derivative of a product, `(fg)^{(n)}(c) = ∑ₖ C(n,k) f^{(k)}(c) g^{(n-k)}(c)`. -/
theorem LeibnizRule (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A : Set ℝ) (n : ℕ) (c : ℝ)
    (hf : NthDerivativeAt f fD A n c) (hg : NthDerivativeAt g gD A n c)
    (hh : NthDerivativeAt (fun x => f x * g x) hD A n c) :
    hD n c = ∑ k ∈ Finset.range (n + 1), (n.choose k : ℝ) * fD k c * gD (n - k) c := by
  sorry

-- `thm:faà-di-bruno`
/-- hand-verified against the general combinatorial
formula at `n = 2` (`(g∘f)'' = g''(f)·(f')² + g'(f)·f''`) and `n = 3`
during the content audit. Stated here for the second-order case, the one
actually exercised elsewhere in this chapter (e.g. `Ch11-Integration`'s
smoothness prerequisites); the general set-partition sum is deferred to
when this file is promoted into active-root status and can cite Mathlib's
own Faà di Bruno development. -/
theorem FaaDiBrunoSecondOrder (f g : ℝ → ℝ) (fD gD hD : ℕ → ℝ → ℝ) (A B : Set ℝ) (c : ℝ)
    (hf : NthDerivativeAt f fD A 2 c) (hfAB : ∀ x ∈ A, f x ∈ B)
    (hg : NthDerivativeAt g gD B 2 (f c))
    (hh : NthDerivativeAt (fun x => g (f x)) hD A 2 c) :
    hD 2 c = gD 2 (f c) * (fD 1 c) ^ 2 + gD 1 (f c) * fD 2 c := by
  sorry

end LRA.VolumeIII.Analysis.Differentiation
