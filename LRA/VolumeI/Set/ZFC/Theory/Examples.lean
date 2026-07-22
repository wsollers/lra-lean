import LRA.VolumeI.Set.ZFC.Syntax.Formula
import LRA.VolumeI.Set.ZFC.Theory.Axioms
import LRA.VolumeI.Set.ZFC.Theory.Schemas
import LRA.VolumeI.Set.ZFC.Theory.SchemaFacts

namespace LRA.VolumeI.Set.ZFC

open LRA.VolumeI.Logic.FirstOrder

/-!
ZFC theory checkpoints.

Well-formedness tests that each named axiom and each schema constructor
produces an honest `ZFCFormula`. These are still syntactic in nature --
they say nothing about satisfaction -- but they belong with the theory
content they exercise rather than with the general vocabulary.
-/

/-- Checkpoint: extensionality is a ZFC formula. -/
example : ZFCFormula :=
  extensionalityAxiom

/-- Checkpoint: the empty-set axiom is a ZFC formula. -/
example : ZFCFormula :=
  emptySetAxiom

/-- Checkpoint: the pairing axiom is a ZFC formula. -/
example : ZFCFormula :=
  pairingAxiom

/-- Checkpoint: the union axiom is a ZFC formula. -/
example : ZFCFormula :=
  unionAxiom

/-- Checkpoint: the power-set axiom is a ZFC formula. -/
example : ZFCFormula :=
  powerSetAxiom

/-- Checkpoint: the foundation axiom is a ZFC formula. -/
example : ZFCFormula :=
  foundationAxiom

/-- Checkpoint: the infinity axiom is a ZFC formula. -/
example : ZFCFormula :=
  infinityAxiom

/-- Checkpoint: the choice axiom is a ZFC formula. -/
example : ZFCFormula :=
  choiceAxiom

/-- Checkpoint: a separation schema instance is a ZFC formula. -/
example : ZFCFormula :=
  separationAxiomFor 0 (isMemberOf 0 1)

/-- Checkpoint: a replacement schema instance is a ZFC formula. -/
example : ZFCFormula :=
  replacementAxiomFor 0 1 (isMemberOf 0 1)

/-!
Capture-regression checkpoint for Replacement.

The predicate below binds variable `4`. Replacement's renamed output
variable must avoid that bound variable too, not merely the predicate's
free variables. This exercises the `allVariables`-based freshness choice
used by `replacementAxiomFor`.
-/

/-- A predicate with an internal binder that a replacement rename must not
capture. -/
def predicateWithBoundVariable : ZFCFormula :=
  forallVariable 4 (isMemberOf 1 4)

/-- The replacement output-prime variable avoids the predicate's bound
variable as well as its free variables. -/
example :
    SchemaFacts.replacementOutputVariablePrime 0 1 predicateWithBoundVariable ≠ 4 := by
  intro h
  have hnot :=
    SchemaFacts.replacementOutputVariablePrime_not_mem_allVariables
      0 1 predicateWithBoundVariable
  apply hnot
  rw [h]
  simp [predicateWithBoundVariable, allVariablesInZFCFormula,
    forallVariable, isMemberOf, variableTerm, allVariables,
    freeVariablesInTerm]

end LRA.VolumeI.Set.ZFC
