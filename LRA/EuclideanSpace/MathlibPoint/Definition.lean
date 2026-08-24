import Mathlib.Analysis.InnerProductSpace.PiL2
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

/--
`MathlibPoint` TODO

Predicate logic:

  abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n)

Predicate logic (unfolded):

  abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

noncomputable instance : Between (MathlibPoint n) where
  between x y z := ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ y = (1 - t) • x + t • z

noncomputable instance : Congruent (MathlibPoint n) where
  congruent x y z w := dist x y = dist z w

end LRA.EuclideanSpace
