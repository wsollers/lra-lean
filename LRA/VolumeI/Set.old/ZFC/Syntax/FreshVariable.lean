import Mathlib.Data.Nat.Basic
import Mathlib.Data.Finset.Fold

namespace LRA.VolumeI.Set.ZFC

/-!
ZFC formula builders use natural-number variables.

First-order syntax remains generic in its variable type, but the concrete
ZFC layer fixes a countably infinite variable supply so derived formula
constructors can compute fresh variables directly.
-/

/-- The concrete variable type used by ZFC formula builders. -/
abbrev ZFCVariable := Nat

/-!
Fresh variables.

Building a formula that introduces its own bound variable -- as
`isSubsetOf`, and later most of ZFC's axioms, will need to -- requires a
variable guaranteed not to collide with whichever variables the caller
already has in play. Hardcoding a fixed literal (e.g. always using
variable `999` as "the" fresh variable) is a landmine: it silently
produces a wrong (capturing) formula the moment a caller happens to use
that same number for one of their own variables, with nothing in the type
system to catch the mistake.

`freshVariable` computes a variable genuinely guaranteed to differ from a
given list of variables already in use, rather than relying on convention:
one more than the largest variable in the list. `freshVariable_ne_of_mem`
is the proof that this guarantee actually holds, so every formula-building
helper that needs a fresh variable can cite it once instead of re-deriving
safety by hand.
-/

/-- A variable guaranteed not to occur in `used` -- one more than the
largest variable in `used` (or `0`, if `used` is empty). -/
def freshVariable (used : List ZFCVariable) : ZFCVariable :=
  (used.foldr max 0) + 1

/-- Every variable in `used` is strictly less than `freshVariable used` --
in particular, distinct from it. -/
theorem freshVariable_gt_of_mem {used : List ZFCVariable} {v : ZFCVariable} (hv : v ∈ used) :
    v < freshVariable used := by
  unfold freshVariable
  have hmax : v ≤ used.foldr max 0 := by
    induction used with
    | nil => cases hv
    | cons a rest ih =>
        rcases List.mem_cons.mp hv with heq | hmem
        · subst heq
          exact Nat.le_max_left _ _
        · exact Nat.le_trans (ih hmem) (Nat.le_max_right _ _)
  exact Nat.lt_succ_of_le hmax

/-- `freshVariable used` is never equal to any variable in `used`. -/
theorem freshVariable_ne_of_mem {used : List ZFCVariable} {v : ZFCVariable} (hv : v ∈ used) :
    freshVariable used ≠ v := by
  exact Nat.ne_of_gt (freshVariable_gt_of_mem hv)

/-!
Fresh variables over a `Finset`.

The formula-building layer more often has its variables-in-use as a
`Finset` (the codomain of `freeVariables`/`allVariables`) than as a
`List`. `freshVariableForFinset` computes the maximum directly with
`Finset.fold max 0 id`, avoiding both arbitrary quotient representatives
and list linearization. This keeps every downstream formula constructor a
plain computable `def` and makes the fresh-variable choice deterministic.
-/

/-- A variable guaranteed not to occur in the finite set `used` -- one
more than the largest variable in `used` (or `1`, if `used` is empty). -/
def freshVariableForFinset (used : Finset ZFCVariable) : ZFCVariable :=
  used.fold max 0 id + 1

/-- `freshVariableForFinset used` is never equal to any variable in
`used`. -/
theorem freshVariableForFinset_ne_of_mem
    {used : Finset ZFCVariable} {v : ZFCVariable} (hv : v ∈ used) :
    freshVariableForFinset used ≠ v := by
  unfold freshVariableForFinset
  exact Nat.ne_of_gt (by
    have hle : v ≤ used.fold max 0 id := by
      rw [Finset.le_fold_max]
      exact Or.inr ⟨v, hv, le_rfl⟩
    exact Nat.lt_succ_of_le hle)

end LRA.VolumeI.Set.ZFC
