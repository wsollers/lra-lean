namespace LRA.VolumeI.Logic

/-!
Updating an assignment.

Satisfying a universally quantified formula `∀v. φ` needs a way to say
"the assignment, but with `v` now bound to some chosen domain element `a`,
everything else unchanged" -- this is exactly what quantification *means*
semantically: `M` satisfies `∀v. φ` when, for every possible value `a` of
`v`, the *updated* assignment satisfies `φ`.

Deciding whether a given variable `v'` is the one being rebound (`v`) or
some other, untouched variable needs `DecidableEq Variable` -- there is no
way to compute "is `v' = v`" without it. This is a new, mild constraint on
`Variable`, not needed anywhere in `Term` or `Formula` themselves (which
are generic over any `Variable : Type`), but genuinely unavoidable once
quantifier satisfaction needs to rebind one variable while leaving every
other one alone. It is satisfied automatically for `Nat` (the canonical
variable supply, `Vbl := {vn | n ∈ N0}`) and for any other reasonable
variable-naming scheme.
-/

/-- The assignment `assignment`, updated so that `v` now denotes `a`,
leaving every other variable's value unchanged. -/
def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v'

/-- Reading off the updated assignment at the rebound variable itself gives
back the new value. -/
theorem updatedVariableTakesNewValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    updateAssignment assignment v a v = a := by
  simp [updateAssignment]

/-- Reading off the updated assignment at any variable other than the
rebound one gives back the original assignment's value, unchanged. -/
theorem differentVariableKeepsOldValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type}
    (assignment : Variable -> Domain) (v v' : Variable) (a : Domain)
    (hv : v' ≠ v) :
    updateAssignment assignment v a v' = assignment v' := by
  simp [updateAssignment, hv]

end LRA.VolumeI.Logic
