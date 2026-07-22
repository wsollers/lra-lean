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

/-- The one-assignment view of the basic named ZFC axioms is independent
of the assignment chosen. -/
theorem satisfiesZFCBasicAxiomsAt_assignment_independent
    (M : ZFCModel)
    (leftAssignment rightAssignment : ZFCVariable -> M.Domain) :
    SatisfiesZFCBasicAxiomsAt M leftAssignment ↔
      SatisfiesZFCBasicAxiomsAt M rightAssignment := by
  constructor
  · intro leftSatisfaction
    rcases leftSatisfaction with
      ⟨hExtensionality, hEmptySet, hPairing, hUnion, hPowerSet,
        hFoundation, hInfinity⟩
    exact
      ⟨(extensionalityAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hExtensionality,
        (emptySetAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hEmptySet,
        (pairingAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hPairing,
        (unionAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hUnion,
        (powerSetAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hPowerSet,
        (foundationAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hFoundation,
        (infinityAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mp hInfinity⟩
  · intro rightSatisfaction
    rcases rightSatisfaction with
      ⟨hExtensionality, hEmptySet, hPairing, hUnion, hPowerSet,
        hFoundation, hInfinity⟩
    exact
      ⟨(extensionalityAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hExtensionality,
        (emptySetAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hEmptySet,
        (pairingAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hPairing,
        (unionAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hUnion,
        (powerSetAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hPowerSet,
        (foundationAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hFoundation,
        (infinityAxiom_satisfaction_assignment_independent
          M leftAssignment rightAssignment).mpr hInfinity⟩

/-- Since the named basic ZFC axioms are closed, satisfying them under one
chosen assignment is equivalent to satisfying them under every assignment. -/
theorem satisfiesZFCBasicAxioms_iff_at
    (M : ZFCModel)
    (assignment : ZFCVariable -> M.Domain) :
    SatisfiesZFCBasicAxioms M ↔
      SatisfiesZFCBasicAxiomsAt M assignment := by
  constructor
  · intro allAssignments
    exact allAssignments assignment
  · intro oneAssignment
    intro otherAssignment
    exact
      (satisfiesZFCBasicAxiomsAt_assignment_independent
        M assignment otherAssignment).mp oneAssignment

/-- Equivalently, for the named basic ZFC axioms, it is enough to satisfy
them under some assignment. The model's nonempty domain supplies an
assignment in the forward direction. -/
theorem satisfiesZFCBasicAxioms_iff_exists_assignment
    (M : ZFCModel) :
    SatisfiesZFCBasicAxioms M ↔
      ∃ assignment : ZFCVariable -> M.Domain,
        SatisfiesZFCBasicAxiomsAt M assignment := by
  constructor
  · intro allAssignments
    rcases M.domainNonempty with ⟨defaultElement⟩
    exact ⟨fun _ => defaultElement, allAssignments (fun _ => defaultElement)⟩
  · intro someAssignment
    rcases someAssignment with ⟨assignment, oneAssignment⟩
    exact
      (satisfiesZFCBasicAxioms_iff_at M assignment).mpr oneAssignment

end LRA.VolumeI.Set.ZFC
