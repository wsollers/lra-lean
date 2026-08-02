import Mathlib.Tactic.Tauto
import LRA.VolumeI.Set.ZFC.Semantics.Satisfaction

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Reusable satisfaction lemmas for ZFC formulas.

The generic first-order semantic engine is exposed here through ZFC-facing
names. Downstream ZFC semantic readings should prefer `satisfiesZFCFormula`
unless they are proving one of these bridge lemmas.
-/

@[simp]
theorem satisfiesZFCFormula_iff_firstOrder
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ : ZFCFormula) :
    satisfiesZFCFormula M assignment φ ↔
      FirstOrder.Satisfies M assignment φ := by
  rfl

/-- The semantic membership relation expressed by the ZFC atom `x ∈ y`
under an assignment. -/
def zfcMembershipHolds
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (x y : ZFCVariable) : Prop :=
  satisfiesZFCFormula M assignment (isMemberOf x y)

theorem satisfies_andFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    satisfiesZFCFormula M assignment (andFormula φ ψ) ↔
      satisfiesZFCFormula M assignment φ ∧
        satisfiesZFCFormula M assignment ψ := by
  exact FirstOrder.satisfiesAndIffSatisfiesBoth M assignment φ ψ

theorem firstOrder_satisfies_andFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (andFormula φ ψ) ↔
      FirstOrder.Satisfies M assignment φ ∧
        FirstOrder.Satisfies M assignment ψ := by
  exact FirstOrder.satisfiesAndIffSatisfiesBoth M assignment φ ψ

theorem satisfies_existsVariable_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (v : ZFCVariable)
    (φ : ZFCFormula) :
    satisfiesZFCFormula M assignment (existsVariable v φ) ↔
      ∃ witness : M.Domain,
        satisfiesZFCFormula M
          (updateAssignment assignment v witness)
          φ := by
  exact FirstOrder.satisfiesExistsIffSomeWitness M assignment v φ

theorem firstOrder_satisfies_existsVariable_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (v : ZFCVariable)
    (φ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (existsVariable v φ) ↔
      ∃ witness : M.Domain,
        FirstOrder.Satisfies M
          (updateAssignment assignment v witness)
          φ := by
  exact FirstOrder.satisfiesExistsIffSomeWitness M assignment v φ

theorem satisfies_iffFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    satisfiesZFCFormula M assignment (iffFormula φ ψ) ↔
      (satisfiesZFCFormula M assignment φ ↔
        satisfiesZFCFormula M assignment ψ) := by
  change FirstOrder.Satisfies M assignment (iffFormula φ ψ) ↔
    (FirstOrder.Satisfies M assignment φ ↔
      FirstOrder.Satisfies M assignment ψ)
  rw [show iffFormula φ ψ = andFormula (impliesFormula φ ψ) (impliesFormula ψ φ) by rfl]
  rw [firstOrder_satisfies_andFormula_iff]
  simp only [impliesFormula, FirstOrder.Satisfies]
  tauto

theorem firstOrder_satisfies_iffFormula_iff
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain)
    (φ ψ : ZFCFormula) :
    FirstOrder.Satisfies M assignment (iffFormula φ ψ) ↔
      (FirstOrder.Satisfies M assignment φ ↔
        FirstOrder.Satisfies M assignment ψ) := by
  exact satisfies_iffFormula_iff M assignment φ ψ

end LRA.VolumeI.Set.ZFC
