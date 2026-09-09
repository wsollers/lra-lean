import Mathlib.Data.Rat.Cast.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.Analysis.Completeness.Density.Definition
import LRA.Analysis.Completeness.Density.Theorems

namespace LRA.Analysis.Completeness

/--
`IntersectionOfDenseRationalsAndIrrationalsIsNotOrderDense` TODO

Predicate logic:

  (LRA.Analysis.Completeness.IsOrderDenseSubset (Set.range Rat.cast) ∧ (LRA.Analysis.Completeness.IsOrderDenseSubset (setOf fun x => ¬ LRA.Analysis.Completeness.IsRational x) ∧ ¬ LRA.Analysis.Completeness.IsOrderDenseSubset (Set.range Rat.cast ∩ setOf fun x => ¬ LRA.Analysis.Completeness.IsRational x)))

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    (none)
  Prove
    ((∀ (x y : Real), Real.instPreorder.2.lt x y → Exists fun d => (d ∈ fun x => Exists fun y => Real.instRatCast.ratCast y = x ∧ ((fun x1 x2 => Real.instPreorder.2.lt x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.2.lt x1 x2) d y))) ∧ ((∀ (x y : Real), Real.instPreorder.2.lt x y → Exists fun d => ((d ∈ fun x => x ∈ Set.range Rat.cast → False) ∧ ((fun x1 x2 => Real.instPreorder.2.lt x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.2.lt x1 x2) d y))) ∧ ((∀ (x y : Real), Real.instPreorder.2.lt x y → Exists fun d => (d ∈ setOf fun x => Exists fun y => y.cast = x ∩ funx => ¬ LRA.Analysis.Completeness.IsRational x ∧ ((fun x1 x2 => Real.instPreorder.2.lt x1 x2) x d ∧ (fun x1 x2 => Real.instPreorder.2.lt x1 x2) d y))) → False)))

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
