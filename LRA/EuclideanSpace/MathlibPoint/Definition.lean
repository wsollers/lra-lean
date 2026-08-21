import Mathlib.Analysis.InnerProductSpace.PiL2
import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

/-!
The pragmatic backend: `MathlibPoint n` is Mathlib's own ready-made
`n`-dimensional Euclidean space, not an in-house construction --
mirroring `LRA.Set.PredicateSet`'s role of a backend built directly from
an existing native type rather than a from-scratch axiomatic universe
(there, native Lean predicates; here, Mathlib's `EuclideanSpace`/`PiLp`
inner-product-space machinery). `abbrev`, not `def`: unlike `Tarski`'s
deliberately opaque `TarskiPoint`, this backend's whole point is to
inherit `EuclideanSpace ℝ (Fin n)`'s existing `dist`/`+`/`•` instances
transparently.
-/

/-- Mathlib's `n`-dimensional Euclidean space, aliased as this subject's
second concrete `Point` realization. -/
abbrev MathlibPoint (n : ℕ) := EuclideanSpace ℝ (Fin n)

variable {n : ℕ}

/-- Betweenness from the affine-combination formula: `y` is between `x`
and `z` when `y = (1 - t) • x + t • z` for some `t ∈ [0, 1]`.

Logical form:

```lean
noncomputable instance : Between (MathlibPoint n) where
  between x y z := ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ y = (1 - t) • x + t • z
```
-/
noncomputable instance : Between (MathlibPoint n) where
  between x y z := ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ y = (1 - t) • x + t • z

/-- Congruence from Mathlib's own distance: `xy ≡ zw` when `dist x y =
dist z w`.

Logical form:

```lean
noncomputable instance : Congruent (MathlibPoint n) where
  congruent x y z w := dist x y = dist z w
```
-/
noncomputable instance : Congruent (MathlibPoint n) where
  congruent x y z w := dist x y = dist z w

end LRA.EuclideanSpace
