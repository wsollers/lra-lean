import LRA.VolumeI.Logic.Semantics.SecondOrderMonadic.SOSatisfaction

namespace LRA.VolumeI.Logic.SecondOrderMonadic

/-!
The fourth end-to-end checkpoint: Henkin restriction actually restricts.

The formula `∃X. X(t) ∧ ¬X(t')` -- "there is a set containing `t` but not
`t'`" -- over the two-element domain `Bool`, with `t := true`, `t' := false`.
Under full semantics this is witnessed by `{true}` and always holds
whenever the domain has at least two distinct elements. The point of this
checkpoint is to show the *restricted* Henkin domain can exclude exactly
that witness, making the formula genuinely false -- not merely that
`SecondOrderDomain` typechecks, but that it does real semantic work.

Two Henkin models over the same empty signature and the same domain
`Bool`, differing only in `SecondOrderDomain`:

  - `richModel`, whose second-order domain is `{∅, {true}, {true, false}}`
    -- it includes `{true}`, so the formula holds, witnessed by `{true}`.
  - `poorModel`, whose second-order domain is `{∅, {true, false}}` --
    it deliberately excludes both singletons, so the formula *fails*:
    neither `∅` nor `{true, false}` satisfies "contains `true`, not
    `false`", and no other set is available to try.

`poorModel` is the genuinely interesting case. If `SecondOrderDomain` were
inert (say, if `SOSatisfies` had a bug silently quantifying over all of
`Set Bool` regardless of what `SecondOrderDomain` said), this formula would
incorrectly come out true even in `poorModel` -- exactly the "full
semantics smuggled back in" failure mode the whole Henkin apparatus exists
to prevent. Proving it comes out *false* is the actual test that the
restriction is load-bearing.
-/

/-- No non-logical vocabulary is needed for this test: the formula only
uses set membership and the two constants of `Bool` as terms, so an empty
signature suffices, matching the pattern already used for the first-order
nullary-relation checkpoint. -/
def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

/-- The one set variable used in the test formula. -/
def X : Nat := 0

/-- `∃X. X(t) ∧ ¬X(t')`, instantiated with `t := true`, `t' := false` as
literal `Bool` values threaded through a constant assignment (there is no
function/constant symbol for `true`/`false` in `emptySignature`, so they
are supplied via the element assignment instead, using two designated
variables rather than terms built from the signature). -/
def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1))))

/-- The element assignment used by both models: variable `0` denotes
`true`, variable `1` denotes `false`, matching `henkinTestFormula`'s use of
`Term.var 0`/`Term.var 1` for `t`/`t'`. -/
def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false

/-- The rich Henkin model: second-order domain `{∅, {true}, {true, false}}`,
including the singleton `{true}` needed to witness the test formula. -/
def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}}

/-- The poor Henkin model: second-order domain `{∅, {true, false}}`,
deliberately excluding both singletons -- in particular, excluding `{true}`,
the only witness that could satisfy the test formula. -/
def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}}

/-- The checkpoint, positive case: `richModel` satisfies the test formula,
witnessed by `{true} ∈ richModel.SecondOrderDomain`. -/
theorem richModel_satisfies_henkinTestFormula :
    SOSatisfies richModel
      ⟨testElementAssignment, fun _ => ∅⟩
      henkinTestFormula := by
  simp only [henkinTestFormula, SOFormula.existsSet, SOFormula.and, SOSatisfies,
    FirstOrder.evaluateTerm, updateAssignment, richModel, testElementAssignment]
  intro h
  have h' := h {true} (by
    exact Or.inr (Or.inl rfl))
  rw [Classical.not_not] at h'
  have h'' := h' (by
    change true = true
    rfl)
  rw [Classical.not_not] at h''
  change false = true at h''
  cases h''

/-- The checkpoint, negative case: `poorModel` does *not* satisfy the test
formula -- the whole point of this file. Neither `∅` nor `{true, false}`
(the only sets `poorModel.SecondOrderDomain` makes available) contains
`true` without also containing `false`, so no witness exists. -/
theorem poorModel_not_satisfies_henkinTestFormula :
    ¬ SOSatisfies poorModel
        ⟨testElementAssignment, fun _ => ∅⟩
        henkinTestFormula := by
  simp only [henkinTestFormula, SOFormula.existsSet, SOFormula.and, SOSatisfies,
    FirstOrder.evaluateTerm, updateAssignment, poorModel, testElementAssignment]
  rw [Classical.not_not]
  intro Y hY
  rw [Classical.not_not]
  rcases hY with hY | hY
  · subst hY
    intro h0
    exfalso
    exact h0
  · subst hY
    intro _
    rw [Classical.not_not]
    simp only [if_true]
    exact Or.inr rfl

end LRA.VolumeI.Logic.SecondOrderMonadic
