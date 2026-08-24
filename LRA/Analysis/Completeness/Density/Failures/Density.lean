import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Analysis.Completeness.Density.Theorems

namespace LRA.Analysis.Completeness

/--
`IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense` TODO

Predicate logic:

  IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧ IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧ ¬ IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x})

Predicate logic (unfolded):

  (∀ (x y : Real), Real.instPreorder.toLT.1 x y → Exists fun d => (Set.instMembership.1 (fun x => Exists fun y => Real.instRatCast.ratCast y = x)d ∧ ((fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) d y)) ∧ (∀ (x y : Real), Real.instPreorder.toLT.1 x y → Exists fun d => (Set.instMembership.1 (fun x => Set.instMembership.mem (Set.range Rat.cast) x → False) d ∧ ((fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) d y)) ∧ (∀ (x y : Real), Real.instPreorder.toLT.1 x y → Exists fun d => (Set.instMembership.1 (Set.instInter.1 (setOf fun x => Exists fun y => y.cast = x)fun x => ¬ LRA.Analysis.Completeness.IsRational x) d ∧ ((fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.toLT.1 x1 x2) d y))) → False))

Logical form (Lean):

```lean
theorem IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense :
    IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧
      IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧
      ¬ IsOrderDenseSubset
          (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x})
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
theorem IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense :
    IsOrderDenseSubset (Set.range ((↑) : ℚ → ℝ)) ∧
      IsOrderDenseSubset {x : ℝ | ¬ IsRational x} ∧
      ¬ IsOrderDenseSubset
          (Set.range ((↑) : ℚ → ℝ) ∩ {x : ℝ | ¬ IsRational x}) := by
  sorry

end LRA.Analysis.Completeness
