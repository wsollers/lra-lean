import LRA.VolumeI.Logic.Semantics.Sentence
import LRA.VolumeI.Set.ZFC.Semantics.Satisfaction
import LRA.VolumeI.Set.ZFC.Theory.ClosedAxioms

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic

/-!
Assignment-independence for closed ZFC axioms.

The named non-schema ZFC axioms are closed formulas. Their satisfaction
therefore does not depend on which variable assignment is used.
-/

/-- Satisfaction of a closed ZFC formula is independent of the assignment. -/
theorem satisfiesZFCFormula_iff_of_isClosedZFCFormula
    (M : ZFCModel)
    {leftAssignment rightAssignment : ZFCVariable -> M.Domain}
    (formula : ZFCFormula)
    (closedFormula : IsClosedZFCFormula formula) :
    satisfiesZFCFormula M leftAssignment formula ↔
      satisfiesZFCFormula M rightAssignment formula := by
  exact
    FirstOrder.satisfies_iff_of_isClosedFormula
      M formula closedFormula

theorem extensionalityAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment extensionalityAxiom ↔
      satisfiesZFCFormula M rightAssignment extensionalityAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M extensionalityAxiom extensionalityAxiom_isClosedFormula

theorem emptySetAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment emptySetAxiom ↔
      satisfiesZFCFormula M rightAssignment emptySetAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M emptySetAxiom emptySetAxiom_isClosedFormula

theorem pairingAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment pairingAxiom ↔
      satisfiesZFCFormula M rightAssignment pairingAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M pairingAxiom pairingAxiom_isClosedFormula

theorem unionAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment unionAxiom ↔
      satisfiesZFCFormula M rightAssignment unionAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M unionAxiom unionAxiom_isClosedFormula

theorem powerSetAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment powerSetAxiom ↔
      satisfiesZFCFormula M rightAssignment powerSetAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M powerSetAxiom powerSetAxiom_isClosedFormula

theorem foundationAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment foundationAxiom ↔
      satisfiesZFCFormula M rightAssignment foundationAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M foundationAxiom foundationAxiom_isClosedFormula

theorem infinityAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment infinityAxiom ↔
      satisfiesZFCFormula M rightAssignment infinityAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M infinityAxiom infinityAxiom_isClosedFormula

theorem choiceAxiom_satisfaction_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    satisfiesZFCFormula M leftAssignment choiceAxiom ↔
      satisfiesZFCFormula M rightAssignment choiceAxiom :=
  satisfiesZFCFormula_iff_of_isClosedZFCFormula
    M choiceAxiom choiceAxiom_isClosedFormula

end LRA.VolumeI.Set.ZFC
