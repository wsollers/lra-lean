import LRA.VolumeI.Logic.PropositionalLogic.PropositionalLogic

namespace LRA.VolumeI.Logic.PropositionalLogic.Alternate.NandBased

/-!
NAND-based propositional logic.

This module is a coherent verification artifact for the standard
propositional syntax and Boolean semantics. It rebuilds the usual connectives
from NAND alone and proves that translation from the main propositional
language preserves Boolean evaluation.
-/

open LRA.VolumeI.Logic.PropositionalLogic
open LRA.VolumeI.Logic

inductive NandOnlyAtoms where
  | p | q | r

inductive NandOnlyBinaryConnective where
  | nand

def NandOnlyLanguage : LogicalLanguage := {
  Atoms := NandOnlyAtoms
  BinaryConnectives := NandOnlyBinaryConnective
}

abbrev NandOnlyFormula :=
  LogicalFormula NandOnlyLanguage

abbrev NandOnlyStructure :=
  LogicalStructure NandOnlyLanguage

def atom (a : NandOnlyAtoms) : NandOnlyFormula :=
  LogicalFormula.atom a

def nand (leftFormula rightFormula : NandOnlyFormula) : NandOnlyFormula :=
  LogicalFormula.binary NandOnlyBinaryConnective.nand leftFormula rightFormula

def NandOnlyBooleanStructure
    (valuation : NandOnlyAtoms -> Bool) :
    NandOnlyStructure := {
  truthValueOfAtom := valuation
  truthFunctionOfUnaryConnective := fun emptyConnective =>
    Empty.elim emptyConnective
  truthFunctionOfBinaryConnective := fun connective leftTruthValue rightTruthValue =>
    match connective with
    | NandOnlyBinaryConnective.nand =>
        !(leftTruthValue && rightTruthValue)
}

def buildNot (formula : NandOnlyFormula) : NandOnlyFormula :=
  nand formula formula

def buildAnd (leftFormula rightFormula : NandOnlyFormula) : NandOnlyFormula :=
  buildNot (nand leftFormula rightFormula)

def buildOr (leftFormula rightFormula : NandOnlyFormula) : NandOnlyFormula :=
  nand (buildNot leftFormula) (buildNot rightFormula)

def buildImplies (hypothesis conclusion : NandOnlyFormula) : NandOnlyFormula :=
  nand hypothesis (buildNot conclusion)

def buildIff (leftFormula rightFormula : NandOnlyFormula) : NandOnlyFormula :=
  buildAnd (buildImplies leftFormula rightFormula) (buildImplies rightFormula leftFormula)

theorem nandOnlyLogicCanDefineNegation
    (valuation : NandOnlyAtoms -> Bool)
    (formula : NandOnlyFormula) :
    evaluateFormula (NandOnlyBooleanStructure valuation) (buildNot formula) =
      !(evaluateFormula (NandOnlyBooleanStructure valuation) formula) := by
  dsimp [buildNot, nand, evaluateFormula]
  generalize hFormula :
    evaluateFormula (NandOnlyBooleanStructure valuation) formula = formulaTruthValue
  dsimp [NandOnlyBooleanStructure]
  cases formulaTruthValue <;> rfl

theorem nandOnlyLogicCanDefineConjunction
    (valuation : NandOnlyAtoms -> Bool)
    (leftFormula rightFormula : NandOnlyFormula) :
    evaluateFormula
      (NandOnlyBooleanStructure valuation)
      (buildAnd leftFormula rightFormula)
      =
      (evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula &&
        evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula) := by
  dsimp [buildAnd, buildNot, nand, evaluateFormula]
  generalize hLeft :
    evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula = leftTruthValue
  generalize hRight :
    evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula = rightTruthValue
  dsimp [NandOnlyBooleanStructure]
  cases leftTruthValue <;> cases rightTruthValue <;> rfl

namespace ConnectiveCompleteness

def atomAsNandOnlyAtom : Atom -> NandOnlyAtoms
  | Atom.P => NandOnlyAtoms.p
  | Atom.Q => NandOnlyAtoms.q
  | Atom.R => NandOnlyAtoms.r

def valuationAsNandOnlyValuation
    (valuation : Atom -> Bool) :
    NandOnlyAtoms -> Bool
  | NandOnlyAtoms.p => valuation Atom.P
  | NandOnlyAtoms.q => valuation Atom.Q
  | NandOnlyAtoms.r => valuation Atom.R

def translateFormulaToNandOnlyFormula :
    Formula -> NandOnlyFormula
  | LogicalFormula.atom atomName =>
      atom (atomAsNandOnlyAtom atomName)
  | LogicalFormula.unary connective formula =>
      match connective with
      | UnaryConnective.not =>
          buildNot (translateFormulaToNandOnlyFormula formula)
  | LogicalFormula.binary connective leftFormula rightFormula =>
      match connective with
      | BinaryConnective.and =>
          buildAnd
            (translateFormulaToNandOnlyFormula leftFormula)
            (translateFormulaToNandOnlyFormula rightFormula)
      | BinaryConnective.or =>
          buildOr
            (translateFormulaToNandOnlyFormula leftFormula)
            (translateFormulaToNandOnlyFormula rightFormula)
      | BinaryConnective.implies =>
          buildImplies
            (translateFormulaToNandOnlyFormula leftFormula)
            (translateFormulaToNandOnlyFormula rightFormula)
      | BinaryConnective.iff =>
          buildIff
            (translateFormulaToNandOnlyFormula leftFormula)
            (translateFormulaToNandOnlyFormula rightFormula)

theorem nandDefinesNegation :
    forall (valuation : NandOnlyAtoms -> Bool) (formula : NandOnlyFormula),
      evaluateFormula (NandOnlyBooleanStructure valuation) (buildNot formula) =
        !(evaluateFormula (NandOnlyBooleanStructure valuation) formula) := by
  intro valuation formula
  exact nandOnlyLogicCanDefineNegation valuation formula

theorem nandDefinesConjunction :
    forall (valuation : NandOnlyAtoms -> Bool)
      (leftFormula rightFormula : NandOnlyFormula),
      evaluateFormula
        (NandOnlyBooleanStructure valuation)
        (buildAnd leftFormula rightFormula)
        =
        (evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula &&
          evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula) := by
  intro valuation leftFormula rightFormula
  exact nandOnlyLogicCanDefineConjunction valuation leftFormula rightFormula

theorem nandDefinesDisjunction :
    forall (valuation : NandOnlyAtoms -> Bool)
      (leftFormula rightFormula : NandOnlyFormula),
      evaluateFormula
        (NandOnlyBooleanStructure valuation)
        (buildOr leftFormula rightFormula)
        =
        (evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula ||
          evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula) := by
  intro valuation leftFormula rightFormula
  dsimp [buildOr, buildNot, nand, evaluateFormula]
  generalize hLeft :
    evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula = leftTruthValue
  generalize hRight :
    evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula = rightTruthValue
  dsimp [NandOnlyBooleanStructure]
  cases leftTruthValue <;> cases rightTruthValue <;> rfl

theorem nandDefinesImplication :
    forall (valuation : NandOnlyAtoms -> Bool)
      (hypothesis conclusion : NandOnlyFormula),
      evaluateFormula
        (NandOnlyBooleanStructure valuation)
        (buildImplies hypothesis conclusion)
        =
        (!(evaluateFormula (NandOnlyBooleanStructure valuation) hypothesis) ||
          evaluateFormula (NandOnlyBooleanStructure valuation) conclusion) := by
  intro valuation hypothesis conclusion
  dsimp [buildImplies, buildNot, nand, evaluateFormula]
  generalize hHypothesis :
    evaluateFormula (NandOnlyBooleanStructure valuation) hypothesis = hypothesisTruthValue
  generalize hConclusion :
    evaluateFormula (NandOnlyBooleanStructure valuation) conclusion = conclusionTruthValue
  dsimp [NandOnlyBooleanStructure]
  cases hypothesisTruthValue <;> cases conclusionTruthValue <;> rfl

theorem nandDefinesBiconditional :
    forall (valuation : NandOnlyAtoms -> Bool)
      (leftFormula rightFormula : NandOnlyFormula),
      evaluateFormula
        (NandOnlyBooleanStructure valuation)
        (buildIff leftFormula rightFormula)
        =
        (evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula ==
          evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula) := by
  intro valuation leftFormula rightFormula
  dsimp [buildIff, buildAnd, buildImplies, buildNot, nand, evaluateFormula]
  generalize hLeft :
    evaluateFormula (NandOnlyBooleanStructure valuation) leftFormula = leftTruthValue
  generalize hRight :
    evaluateFormula (NandOnlyBooleanStructure valuation) rightFormula = rightTruthValue
  dsimp [NandOnlyBooleanStructure]
  cases leftTruthValue <;> cases rightTruthValue <;> rfl

theorem nandOnlyLanguageIsFunctionallyCompleteForPropositionalLogic :
    forall (valuation : Atom -> Bool) (formula : Formula),
      evaluateFormula
        (NandOnlyBooleanStructure
          (valuationAsNandOnlyValuation valuation))
        (translateFormulaToNandOnlyFormula formula)
      =
      evaluateFormula
        (booleanStructure valuation)
        formula := by
  intro valuation formula
  induction formula with
  | atom atomName =>
      cases atomName <;> rfl
  | unary connective formula inductionHypothesis =>
      cases connective
      dsimp [translateFormulaToNandOnlyFormula]
      rw [nandDefinesNegation]
      rw [inductionHypothesis]
      rfl
  | binary connective leftFormula rightFormula leftIH rightIH =>
      cases connective with
      | and =>
          dsimp [translateFormulaToNandOnlyFormula]
          rw [nandDefinesConjunction]
          rw [leftIH, rightIH]
          rfl
      | or =>
          dsimp [translateFormulaToNandOnlyFormula]
          rw [nandDefinesDisjunction]
          rw [leftIH, rightIH]
          rfl
      | implies =>
          dsimp [translateFormulaToNandOnlyFormula]
          rw [nandDefinesImplication]
          rw [leftIH, rightIH]
          rfl
      | iff =>
          dsimp [translateFormulaToNandOnlyFormula]
          rw [nandDefinesBiconditional]
          rw [leftIH, rightIH]
          rfl

end ConnectiveCompleteness

def testValuationAllTrue : NandOnlyAtoms -> Bool
  | NandOnlyAtoms.p => true
  | NandOnlyAtoms.q => true
  | NandOnlyAtoms.r => true

def testFormulaPandQ : NandOnlyFormula :=
  nand (atom NandOnlyAtoms.p) (atom NandOnlyAtoms.q)

#guard
  evaluateFormula
    (NandOnlyBooleanStructure testValuationAllTrue)
    testFormulaPandQ == false

example :
    evaluateFormula
      (NandOnlyBooleanStructure testValuationAllTrue)
      testFormulaPandQ = false := by
  rfl

end LRA.VolumeI.Logic.PropositionalLogic.Alternate.NandBased
