namespace LRA.VolumeI.Set.ZFC

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
def freshVariable (used : List Nat) : Nat :=
  (used.foldr max 0) + 1

/-- Every variable in `used` is strictly less than `freshVariable used` --
in particular, distinct from it. -/
theorem freshVariable_gt_of_mem {used : List Nat} {v : Nat} (hv : v ∈ used) :
    v < freshVariable used := by
  unfold freshVariable
  have hmax : v ≤ used.foldr max 0 := by
    induction used with
    | nil => cases hv
    | cons a rest ih =>
        rcases List.mem_cons.mp hv with heq | hmem
        · subst heq
          exact le_max_left _ _
        · exact le_trans (ih hmem) (le_max_right _ _)
  omega

/-- `freshVariable used` is never equal to any variable in `used`. -/
theorem freshVariable_ne_of_mem {used : List Nat} {v : Nat} (hv : v ∈ used) :
    freshVariable used ≠ v := by
  have h := freshVariable_gt_of_mem hv
  omega

end LRA.VolumeI.Set.ZFC
