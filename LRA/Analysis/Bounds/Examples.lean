
import Mathlib.Tactic
import LRA.Analysis.Bounds.Bounds

namespace LRA.Analysis.Bounds.Examples

/--
`ActiveReal` TODO

Predicate logic:

  abbrev ActiveReal := Real

Predicate logic (unfolded):

  abbrev ActiveReal := Real (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
abbrev ActiveReal := Real
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
abbrev ActiveReal := Real

example : IsUpperBound (3 : ActiveReal) {1, 2, 3} := by
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsMaximum (3 : ActiveReal) {1, 2, 3} := by
  refine ⟨by norm_num, ?_⟩
  intro x membership
  rcases membership with rfl | rfl | rfl <;> norm_num

example : IsSupremum (3 : ActiveReal) {1, 2, 3} :=
  MaximumIsSupremum (by
    refine ⟨by norm_num, ?_⟩
    intro x membership
    rcases membership with rfl | rfl | rfl <;> norm_num)

end LRA.Analysis.Bounds.Examples
