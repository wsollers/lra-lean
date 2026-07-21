import LRA.VolumeI.Logic.Core

namespace LRA.VolumeI.Logic.PropositionalLogic

open LRA.VolumeI.Logic
open LRA.VolumeI.Logic.Notation

/-!
Volume I propositional logic.

This module models regular modern propositional logic by specializing the shared
`Logical*` interface to Boolean connectives.

None of this is the proof engine for later set theory. Ordinary mathematical
proofs should use Lean's native `Prop` unless we explicitly decide to reason
about formalized object-language formulas. Alternate learning and verification
developments, such as Bourbaki-style proof theory and NAND-only propositional
logic, live in sibling modules.
-/


/-!
Propositional language and truth-table semantics.
-/

inductive Atom where
  | P | Q | R

inductive UnaryConnective where
  | not

inductive BinaryConnective where
  | and
  | or
  | implies
  | iff

def language : LogicalLanguage := {
  Atoms := Atom
  UnaryConnectives := UnaryConnective
  BinaryConnectives := BinaryConnective
}

instance : HasLogicalNot language where
  notConnective := UnaryConnective.not

instance : HasLogicalAnd language where
  andConnective := BinaryConnective.and

instance : HasLogicalOr language where
  orConnective := BinaryConnective.or

instance : HasLogicalImplies language where
  impliesConnective := BinaryConnective.implies

instance : HasLogicalIff language where
  iffConnective := BinaryConnective.iff

abbrev Formula :=
  LogicalFormula language

abbrev Structure :=
  LogicalStructure language

abbrev Theory :=
  LogicalTheory language

def booleanStructure
    (valuation : Atom -> Bool) :
    Structure := {
  truthValueOfAtom := valuation
  truthFunctionOfUnaryConnective := fun connective truthValue =>
    match connective with
    | UnaryConnective.not => !truthValue
  truthFunctionOfBinaryConnective := fun connective leftTruthValue rightTruthValue =>
    match connective with
    | BinaryConnective.and => leftTruthValue && rightTruthValue
    | BinaryConnective.or => leftTruthValue || rightTruthValue
    | BinaryConnective.implies => (!leftTruthValue) || rightTruthValue
    | BinaryConnective.iff => leftTruthValue == rightTruthValue
}

def satisfies (M : Structure) (formula : Formula) : Prop :=
  StructureSatisfiesFormula M formula

def models (M : Structure) (T : Theory) : Prop :=
  StructureModelsTheory M T

def propositionalLogic : Logic := {
  Formula := Formula
  Theory := Theory
  Structure := Structure
  satisfies := satisfies
  models := models
}

instance : Logic.HasTruthValue propositionalLogic where
  TruthValue := Bool
  evaluate := evaluateFormula

instance : Logic.HasBooleanEvaluation propositionalLogic where
  evaluate := evaluateFormula

instance : Logic.HasNegation propositionalLogic where
  neg := logicalNot

instance : Logic.HasConjunction propositionalLogic where
  conj := logicalAnd

instance : Logic.HasDisjunction propositionalLogic where
  disj := logicalOr

instance : Logic.HasImplication propositionalLogic where
  impl := logicalImplies

instance : Logic.HasBiconditional propositionalLogic where
  iff := logicalIff

namespace Examples

def test_formula : Formula :=
  (LogicalFormula.atom Atom.P) ∧ₗ ¬ₗ(LogicalFormula.atom Atom.Q)

def test_model : Structure :=
  booleanStructure fun atomName =>
    match atomName with
    | Atom.P => true
    | Atom.Q => false
    | Atom.R => false

#guard evaluateFormula test_model test_formula == true

def mixin_test_formula : propositionalLogic.Formula :=
  Logic.conjunction
    (Λ := propositionalLogic)
    (LogicalFormula.atom Atom.P)
    (Logic.negation (Λ := propositionalLogic) (LogicalFormula.atom Atom.Q))

#guard
  Logic.booleanEvaluate
    (Λ := propositionalLogic)
    test_model
    mixin_test_formula == true

end Examples

namespace BooleanSemantics

open EvaluationUnfolding

/-!
Connective-specific evaluation facts.

Each theorem here reduces to the generic `evaluationOf{Unary,Binary}Connective`
unfolding lemma from `Core.lean`, instantiated at this language's specific
connective symbol (`UnaryConnective.not`, `BinaryConnective.and`, etc.) and
its truth-function match arm. Only the connective-specific unfolding is new
work; the constructor-level unfolding is inherited, not re-derived.
-/

theorem evaluationOfNegation
    (valuation : Atom -> Bool)
    (formula : Formula) :
    evaluateFormula (booleanStructure valuation) (¬ₗ formula) =
      !(evaluateFormula (booleanStructure valuation) formula) := by
  exact evaluationOfUnaryConnective (booleanStructure valuation) UnaryConnective.not formula

theorem evaluationOfConjunction
    (valuation : Atom -> Bool)
    (leftFormula rightFormula : Formula) :
    evaluateFormula
      (booleanStructure valuation)
      (leftFormula ∧ₗ rightFormula)
      =
      (evaluateFormula (booleanStructure valuation) leftFormula &&
        evaluateFormula (booleanStructure valuation) rightFormula) := by
  exact evaluationOfBinaryConnective
    (booleanStructure valuation) BinaryConnective.and leftFormula rightFormula

theorem evaluationOfDisjunction
    (valuation : Atom -> Bool)
    (leftFormula rightFormula : Formula) :
    evaluateFormula
      (booleanStructure valuation)
      (leftFormula ∨ₗ rightFormula)
      =
      (evaluateFormula (booleanStructure valuation) leftFormula ||
        evaluateFormula (booleanStructure valuation) rightFormula) := by
  exact evaluationOfBinaryConnective
    (booleanStructure valuation) BinaryConnective.or leftFormula rightFormula

theorem evaluationOfImplication
    (valuation : Atom -> Bool)
    (hypothesis conclusion : Formula) :
    evaluateFormula
      (booleanStructure valuation)
      (hypothesis →ₗ conclusion)
      =
      (!(evaluateFormula (booleanStructure valuation) hypothesis) ||
        evaluateFormula (booleanStructure valuation) conclusion) := by
  exact evaluationOfBinaryConnective
    (booleanStructure valuation) BinaryConnective.implies hypothesis conclusion

theorem evaluationOfBiconditional
    (valuation : Atom -> Bool)
    (leftFormula rightFormula : Formula) :
    evaluateFormula
      (booleanStructure valuation)
      (leftFormula ↔ₗ rightFormula)
      =
      (evaluateFormula (booleanStructure valuation) leftFormula ==
        evaluateFormula (booleanStructure valuation) rightFormula) := by
  exact evaluationOfBinaryConnective
    (booleanStructure valuation) BinaryConnective.iff leftFormula rightFormula

end BooleanSemantics

namespace ConnectiveCompleteness

def valuationForTruthValuesOfPandQ
    (truthValueOfP truthValueOfQ : Bool) :
    Atom -> Bool
  | Atom.P => truthValueOfP
  | Atom.Q => truthValueOfQ
  | Atom.R => false

def literalFormulaForAtomAndTruthValue
    (atomName : Atom)
    (truthValue : Bool) :
    Formula :=
  if truthValue then
    LogicalFormula.atom atomName
  else
    ¬ₗ(LogicalFormula.atom atomName)

def truthTableRowFormula
    (truthValueOfP truthValueOfQ : Bool) :
    Formula :=
  literalFormulaForAtomAndTruthValue Atom.P truthValueOfP ∧ₗ
    literalFormulaForAtomAndTruthValue Atom.Q truthValueOfQ

def contradictionFormula : Formula :=
  LogicalFormula.atom Atom.P ∧ₗ ¬ₗ(LogicalFormula.atom Atom.P)

def includeRowWhenTruthFunctionIsTrue
    (truthFunctionValue : Bool)
    (rowFormula accumulatedFormula : Formula) :
    Formula :=
  if truthFunctionValue then
    rowFormula ∨ₗ accumulatedFormula
  else
    accumulatedFormula

def disjunctiveNormalFormForBinaryTruthFunction
    (truthFunction : Bool -> Bool -> Bool) :
    Formula :=
  includeRowWhenTruthFunctionIsTrue
    (truthFunction false false)
    (truthTableRowFormula false false)
    (includeRowWhenTruthFunctionIsTrue
      (truthFunction false true)
      (truthTableRowFormula false true)
      (includeRowWhenTruthFunctionIsTrue
        (truthFunction true false)
        (truthTableRowFormula true false)
        (includeRowWhenTruthFunctionIsTrue
          (truthFunction true true)
          (truthTableRowFormula true true)
          contradictionFormula)))

theorem truthTableRowFormulaIsTrueExactlyOnItsRow :
    forall expectedTruthValueOfP expectedTruthValueOfQ
      actualTruthValueOfP actualTruthValueOfQ : Bool,
      evaluateFormula
        (booleanStructure
          (valuationForTruthValuesOfPandQ
            actualTruthValueOfP
            actualTruthValueOfQ))
        (truthTableRowFormula
          expectedTruthValueOfP
          expectedTruthValueOfQ)
      =
      ((actualTruthValueOfP == expectedTruthValueOfP) &&
        (actualTruthValueOfQ == expectedTruthValueOfQ)) := by
  sorry

theorem disjunctiveNormalFormRepresentsBinaryTruthFunction :
    forall truthFunction : Bool -> Bool -> Bool,
      forall truthValueOfP truthValueOfQ : Bool,
        evaluateFormula
          (booleanStructure
            (valuationForTruthValuesOfPandQ truthValueOfP truthValueOfQ))
          (disjunctiveNormalFormForBinaryTruthFunction truthFunction)
        =
        truthFunction truthValueOfP truthValueOfQ := by
  sorry

theorem connectivesCanRepresentEveryBinaryTruthFunction :
    forall truthFunction : Bool -> Bool -> Bool,
      exists formula : Formula,
        forall truthValueOfP truthValueOfQ : Bool,
          evaluateFormula
            (booleanStructure
              (valuationForTruthValuesOfPandQ truthValueOfP truthValueOfQ))
            formula
          =
          truthFunction truthValueOfP truthValueOfQ := by
  sorry

end ConnectiveCompleteness

namespace Metatheory

def ConnectivesAreFunctionallyCompleteForBinaryTruthFunctions : Prop :=
  forall truthFunction : Bool -> Bool -> Bool,
    exists formula : Formula,
      forall truthValueOfP truthValueOfQ : Bool,
        evaluateFormula
          (booleanStructure
            (ConnectiveCompleteness.valuationForTruthValuesOfPandQ
              truthValueOfP
              truthValueOfQ))
          formula
        =
        truthFunction truthValueOfP truthValueOfQ

structure Certification where
  connectivesAreFunctionallyCompleteForBinaryTruthFunctions :
    ConnectivesAreFunctionallyCompleteForBinaryTruthFunctions

theorem connectivesAreFunctionallyCompleteForBinaryTruthFunctions :
    ConnectivesAreFunctionallyCompleteForBinaryTruthFunctions := by
  exact ConnectiveCompleteness.connectivesCanRepresentEveryBinaryTruthFunction

theorem languageHasExpectedMetatheory :
    Certification := {
  connectivesAreFunctionallyCompleteForBinaryTruthFunctions :=
    connectivesAreFunctionallyCompleteForBinaryTruthFunctions
}

end Metatheory

end LRA.VolumeI.Logic.PropositionalLogic
