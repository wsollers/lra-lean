import LRA.VolumeI.Set.WellDefined
import LRA.VolumeI.Set.ZFSet.ZFSet

namespace LRA.VolumeI.Set

/-!
Well-foundedness and well-definedness for `ZFSet`.

Deliberately minimal for now: `ZFSet` is Mathlib's own construction, and
this file avoids guessing at exact Mathlib lemma names (`ZFSet.ext`,
whatever `ZFSet`'s own well-foundedness result is called, if any)
without being able to check them against the actual Mathlib version in
this repo. What's here is stated and left `sorry`'d rather than risking
a wrong citation.
-/

/-- Whether `∈` is well-founded on `ZFSet` -- a meaningful question here,
unlike `LRASet`/`MathlibSet`, since `ZFSet`'s membership relation is
single-sorted (a `ZFSet` can be a member of another `ZFSet`). Mathlib
built `ZFSet` from `PSet` by essentially the same pre-set-tree-then-
quotient construction `ZFCTreeSet` is planned to use, so this is very
likely already proved somewhere in Mathlib's own development. -/
theorem ZFSetWellFounded : IsWellFounded (· ∈ · : ZFSet → ZFSet → Prop) := by
  sorry

end LRA.VolumeI.Set
