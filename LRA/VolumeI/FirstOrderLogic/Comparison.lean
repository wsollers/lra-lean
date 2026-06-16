import LRA.VolumeI.FirstOrderLogic.PeanoSystemModel
import LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic

namespace LRA.VolumeI.FirstOrderLogic.Comparison
open Semantics

theorem peanoNumeralEvaluatesToItself
    (assignment : VariableAssignment PeanoArithmetic.standardNaturalNumberInterpretation)
    (n : Nat) :
    evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation assignment
      (PeanoArithmetic.numeral n) = n := by
  induction n with
  | zero => rfl
  | succ predecessor inductionHypothesis =>
      show Nat.succ
        (evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation assignment
          (PeanoArithmetic.numeral predecessor)) = Nat.succ predecessor
      rw [inductionHypothesis]

theorem presburgerNumeralEvaluatesToItself
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
      (PresburgerArithmetic.numeral n) = n := by
  induction n with
  | zero => rfl
  | succ predecessor inductionHypothesis =>
      show Nat.succ
        (evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
          (PresburgerArithmetic.numeral predecessor)) = Nat.succ predecessor
      rw [inductionHypothesis]

theorem presburgerAdditionSymbolDenotesNaturalNumberAddition
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (left right : Term PresburgerArithmetic.language) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
        (PresburgerArithmetic.additionTerm left right)
      = evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment left
        + evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment right :=
  rfl

theorem presburgerAdditionMatchesSuccessorNumeral
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (m n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
        (PresburgerArithmetic.additionTerm
          (PresburgerArithmetic.numeral m) (PresburgerArithmetic.numeral n))
      = evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
          (PresburgerArithmetic.numeral (m + n)) := by
  rw [presburgerAdditionSymbolDenotesNaturalNumberAddition]
  simp only [presburgerNumeralEvaluatesToItself]

theorem peanoAndPresburgerAdditionYieldEqualValues
    (peanoAssignment :
      VariableAssignment PeanoArithmetic.standardNaturalNumberInterpretation)
    (presburgerAssignment :
      VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (m n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation presburgerAssignment
        (PresburgerArithmetic.additionTerm
          (PresburgerArithmetic.numeral m) (PresburgerArithmetic.numeral n))
      = evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation peanoAssignment
          (PeanoArithmetic.numeral (m + n)) := by
  rw [presburgerAdditionMatchesSuccessorNumeral,
      presburgerNumeralEvaluatesToItself,
      peanoNumeralEvaluatesToItself]

theorem additionAxiomsForceNaturalNumberAddition
    (candidateAddition : Nat → Nat → Nat)
    (baseEquation : ∀ x, candidateAddition x 0 = x)
    (stepEquation :
      ∀ x y, candidateAddition x (Nat.succ y) = Nat.succ (candidateAddition x y)) :
    ∀ x y, candidateAddition x y = x + y := by
  intro x y
  induction y with
  | zero => rw [baseEquation, Nat.add_zero]
  | succ predecessor inductionHypothesis =>
      rw [stepEquation, inductionHypothesis, Nat.add_succ]

theorem standardModelSatisfiesAdditionBase :
    StructureModelsFormula PresburgerArithmetic.standardNaturalNumberInterpretation
      PresburgerArithmetic.additionBaseAxiom :=
  fun _assignment domainElement => Nat.add_zero domainElement

theorem standardModelSatisfiesAdditionStep :
    StructureModelsFormula PresburgerArithmetic.standardNaturalNumberInterpretation
      PresburgerArithmetic.additionStepAxiom :=
  fun _assignment outerValue innerValue => Nat.add_succ outerValue innerValue

end LRA.VolumeI.FirstOrderLogic.Comparison
