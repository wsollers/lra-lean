import Mathlib.Data.Real.Basic
import LRA.Analysis.Limits.Definition

namespace LRA.Analysis.Limits

/--
`PointwiseStrictOrderNeedNotPersistInTheLimit` TODO

Predicate logic:

  Exists fun f => Exists fun g => Exists fun A => Exists fun c => Exists fun Lf => Exists fun Lg => ((∀ (x : Real), x ∈ A → Real.instLT.lt (f x) (g x)) ∧ (LRA.Analysis.Limits.TendsTo f A c Lf ∧ (LRA.Analysis.Limits.TendsTo g A c Lg ∧ Lf = Lg)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    Exists fun f => Exists fun g => Exists fun A => Exists fun c => Exists fun Lf => Exists fun Lg => ((∀ (x : Real), x ∈ A → Real.instLT.lt (f x) (g x)) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (f x) Lf)) ε))) ∧ ((∀ (ε : Real), Real.instLT.lt 0 ε → Exists fun δ => (Real.instLT.lt 0 δ ∧ (∀ (x : Real), x ∈ A → Real.instLT.lt 0 (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub x c)) δ → Real.instLT.lt (abs ({ hSub := fun a b => Real.instSub.sub a b }.hSub (g x) Lg)) ε))) ∧ Lf = Lg)))

Logical form (Lean):

```lean
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg
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
theorem PointwiseStrictOrderNeedNotPersistInTheLimit :
    ∃ (f g : ℝ → ℝ) (A : Set ℝ) (c Lf Lg : ℝ),
      (∀ x ∈ A, f x < g x) ∧ TendsTo f A c Lf ∧ TendsTo g A c Lg ∧ Lf = Lg := by
  sorry
end LRA.Analysis.Limits
