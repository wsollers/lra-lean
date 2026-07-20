import LRA.VolumeI.PropositionalLogic.PropositionalLogic

namespace LRA.VolumeI.PropositionalLogic.SimpleLogic
open LRA.Foundation.Logic.Propositional
open LRA.VolumeI.PropositionalLogic

/-!
  ============================================================
  Minimal Propositional Logic: NAND-Only Language
  ============================================================

  This file instantiates the same propositional meta-logic with
  a smaller connective vocabulary: NAND as the only primitive
  connective.
  ============================================================
-/

-- 0. Define atoms, the NAND connective, and the language.
inductive NandOnlyAtoms where
  | p | q | r

inductive NandOnlyBinaryConnective where
  | nand

def NandOnlyLanguage : PropositionalLanguage := {
  Atoms := NandOnlyAtoms
  BinaryConnectives := NandOnlyBinaryConnective
}

abbrev NandOnlyFormula :=
  PropositionalFormula NandOnlyLanguage

abbrev NandOnlyStructure :=
  PropositionalStructure NandOnlyLanguage

def atom (a : NandOnlyAtoms) : NandOnlyFormula :=
  PropositionalFormula.atom a

def nand (ϕ ψ : NandOnlyFormula) : NandOnlyFormula :=
  PropositionalFormula.binary NandOnlyBinaryConnective.nand ϕ ψ

def NandOnlyBooleanStructure
    (valuation : NandOnlyAtoms → Bool) :
    NandOnlyStructure := {
  truthValueOfAtom := valuation
  truthFunctionOfUnaryConnective := fun emptyConnective =>
    Empty.elim emptyConnective
  truthFunctionOfBinaryConnective := fun connective leftTruthValue rightTruthValue =>
    match connective with
    | NandOnlyBinaryConnective.nand =>
        !(leftTruthValue && rightTruthValue)
}

-- 1. Construct NOT out of pure NAND.
-- In logic, ¬P is equivalent to P NAND P.
def buildNot (ϕ : NandOnlyFormula) : NandOnlyFormula :=
  nand ϕ ϕ

-- 2. Construct AND out of pure NAND.
-- In logic, P ∧ Q is equivalent to (P NAND Q) NAND (P NAND Q).
def buildAnd (ϕ ψ : NandOnlyFormula) : NandOnlyFormula :=
  buildNot (nand ϕ ψ)

-- 3. Construct the remaining standard connectives out of pure NAND.
def buildOr (ϕ ψ : NandOnlyFormula) : NandOnlyFormula :=
  nand (buildNot ϕ) (buildNot ψ)

def buildImplies (ϕ ψ : NandOnlyFormula) : NandOnlyFormula :=
  nand ϕ (buildNot ψ)

def buildIff (ϕ ψ : NandOnlyFormula) : NandOnlyFormula :=
  buildAnd (buildImplies ϕ ψ) (buildImplies ψ ϕ)

-- 4. The first definability theorem: NAND defines NOT.
theorem nandOnlyLogicCanDefineNegation
    (valuation : NandOnlyAtoms → Bool)
    (ϕ : NandOnlyFormula) :
    evaluateFormula (NandOnlyBooleanStructure valuation) (buildNot ϕ) =
      !(evaluateFormula (NandOnlyBooleanStructure valuation) ϕ) := by
  dsimp [buildNot, nand, evaluateFormula]
  generalize hϕ : evaluateFormula (NandOnlyBooleanStructure valuation) ϕ = bϕ
  dsimp [NandOnlyBooleanStructure]
  cases bϕ <;> rfl

-- 5. The second definability theorem: NAND defines AND.
theorem nandOnlyLogicCanDefineConjunction
    (valuation : NandOnlyAtoms → Bool)
    (ϕ ψ : NandOnlyFormula) :
    evaluateFormula (NandOnlyBooleanStructure valuation) (buildAnd ϕ ψ) =
      (evaluateFormula (NandOnlyBooleanStructure valuation) ϕ &&
        evaluateFormula (NandOnlyBooleanStructure valuation) ψ) := by
  dsimp [buildAnd, buildNot, nand, evaluateFormula]
  generalize hϕ : evaluateFormula (NandOnlyBooleanStructure valuation) ϕ = bϕ
  generalize hψ : evaluateFormula (NandOnlyBooleanStructure valuation) ψ = bψ
  dsimp [NandOnlyBooleanStructure]
  cases bϕ <;> cases bψ <;> rfl

-- 6. Connective completeness package.

namespace ConnectiveCompleteness

  def standardAtomAsNandOnlyAtom : StandardAtoms → NandOnlyAtoms
    | StandardAtoms.P => NandOnlyAtoms.p
    | StandardAtoms.Q => NandOnlyAtoms.q
    | StandardAtoms.R => NandOnlyAtoms.r

  def standardValuationAsNandOnlyValuation
      (valuation : StandardAtoms → Bool) :
      NandOnlyAtoms → Bool
    | NandOnlyAtoms.p => valuation StandardAtoms.P
    | NandOnlyAtoms.q => valuation StandardAtoms.Q
    | NandOnlyAtoms.r => valuation StandardAtoms.R

  def translateStandardFormulaToNandOnlyFormula :
      PropFormula → NandOnlyFormula
    | PropositionalFormula.atom atomName =>
        atom (standardAtomAsNandOnlyAtom atomName)
    | PropositionalFormula.unary connective ϕ =>
        match connective with
        | StandardUnaryConnective.not =>
            buildNot (translateStandardFormulaToNandOnlyFormula ϕ)
    | PropositionalFormula.binary connective ϕ ψ =>
        match connective with
        | StandardBinaryConnective.and =>
            buildAnd
              (translateStandardFormulaToNandOnlyFormula ϕ)
              (translateStandardFormulaToNandOnlyFormula ψ)
        | StandardBinaryConnective.or =>
            buildOr
              (translateStandardFormulaToNandOnlyFormula ϕ)
              (translateStandardFormulaToNandOnlyFormula ψ)
        | StandardBinaryConnective.implies =>
            buildImplies
              (translateStandardFormulaToNandOnlyFormula ϕ)
              (translateStandardFormulaToNandOnlyFormula ψ)
        | StandardBinaryConnective.iff =>
            buildIff
              (translateStandardFormulaToNandOnlyFormula ϕ)
              (translateStandardFormulaToNandOnlyFormula ψ)

  theorem nandDefinesNegation :
      ∀ (valuation : NandOnlyAtoms → Bool) (ϕ : NandOnlyFormula),
        evaluateFormula (NandOnlyBooleanStructure valuation) (buildNot ϕ) =
          !(evaluateFormula (NandOnlyBooleanStructure valuation) ϕ) := by
    intro valuation ϕ
    exact nandOnlyLogicCanDefineNegation valuation ϕ

  theorem nandDefinesConjunction :
      ∀ (valuation : NandOnlyAtoms → Bool) (ϕ ψ : NandOnlyFormula),
        evaluateFormula (NandOnlyBooleanStructure valuation) (buildAnd ϕ ψ) =
          (evaluateFormula (NandOnlyBooleanStructure valuation) ϕ &&
            evaluateFormula (NandOnlyBooleanStructure valuation) ψ) := by
    intro valuation ϕ ψ
    exact nandOnlyLogicCanDefineConjunction valuation ϕ ψ

  theorem nandDefinesDisjunction :
      ∀ (valuation : NandOnlyAtoms → Bool) (ϕ ψ : NandOnlyFormula),
        evaluateFormula (NandOnlyBooleanStructure valuation) (buildOr ϕ ψ) =
          (evaluateFormula (NandOnlyBooleanStructure valuation) ϕ ||
            evaluateFormula (NandOnlyBooleanStructure valuation) ψ) := by
    intro valuation ϕ ψ
    dsimp [buildOr, buildNot, nand, evaluateFormula]
    generalize hϕ : evaluateFormula (NandOnlyBooleanStructure valuation) ϕ = bϕ
    generalize hψ : evaluateFormula (NandOnlyBooleanStructure valuation) ψ = bψ
    dsimp [NandOnlyBooleanStructure]
    cases bϕ <;> cases bψ <;> rfl

  theorem nandDefinesImplication :
      ∀ (valuation : NandOnlyAtoms → Bool) (ϕ ψ : NandOnlyFormula),
        evaluateFormula (NandOnlyBooleanStructure valuation) (buildImplies ϕ ψ) =
          (!(evaluateFormula (NandOnlyBooleanStructure valuation) ϕ) ||
            evaluateFormula (NandOnlyBooleanStructure valuation) ψ) := by
    intro valuation ϕ ψ
    dsimp [buildImplies, buildNot, nand, evaluateFormula]
    generalize hϕ : evaluateFormula (NandOnlyBooleanStructure valuation) ϕ = bϕ
    generalize hψ : evaluateFormula (NandOnlyBooleanStructure valuation) ψ = bψ
    dsimp [NandOnlyBooleanStructure]
    cases bϕ <;> cases bψ <;> rfl

  theorem nandDefinesBiconditional :
      ∀ (valuation : NandOnlyAtoms → Bool) (ϕ ψ : NandOnlyFormula),
        evaluateFormula (NandOnlyBooleanStructure valuation) (buildIff ϕ ψ) =
          (evaluateFormula (NandOnlyBooleanStructure valuation) ϕ ==
            evaluateFormula (NandOnlyBooleanStructure valuation) ψ) := by
    intro valuation ϕ ψ
    dsimp [buildIff, buildAnd, buildImplies, buildNot, nand, evaluateFormula]
    generalize hϕ : evaluateFormula (NandOnlyBooleanStructure valuation) ϕ = bϕ
    generalize hψ : evaluateFormula (NandOnlyBooleanStructure valuation) ψ = bψ
    dsimp [NandOnlyBooleanStructure]
    cases bϕ <;> cases bψ <;> rfl

  theorem nandOnlyLanguageIsFunctionallyCompleteForStandardPropositionalLogic :
      ∀ (valuation : StandardAtoms → Bool) (ϕ : PropFormula),
        evaluateFormula
          (NandOnlyBooleanStructure
            (standardValuationAsNandOnlyValuation valuation))
          (translateStandardFormulaToNandOnlyFormula ϕ) =
        evaluateFormula
          (StandardBooleanStructure valuation)
          ϕ := by
    intro valuation ϕ
    induction ϕ with
    | atom a =>
        cases a <;> rfl
    | unary connective ϕ ih =>
        cases connective
        dsimp [translateStandardFormulaToNandOnlyFormula]
        rw [nandDefinesNegation]
        rw [ih]
        rfl
    | binary connective ϕ ψ ih_ϕ ih_ψ =>
        cases connective with
        | and =>
            dsimp [translateStandardFormulaToNandOnlyFormula]
            rw [nandDefinesConjunction]
            rw [ih_ϕ, ih_ψ]
            rfl
        | or =>
            dsimp [translateStandardFormulaToNandOnlyFormula]
            rw [nandDefinesDisjunction]
            rw [ih_ϕ, ih_ψ]
            rfl
        | implies =>
            dsimp [translateStandardFormulaToNandOnlyFormula]
            rw [nandDefinesImplication]
            rw [ih_ϕ, ih_ψ]
            rfl
        | iff =>
            dsimp [translateStandardFormulaToNandOnlyFormula]
            rw [nandDefinesBiconditional]
            rw [ih_ϕ, ih_ψ]
            rfl

end ConnectiveCompleteness

-- 7. Unit tests and negative cases.

def testValuationAllTrue : NandOnlyAtoms → Bool
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

end LRA.VolumeI.PropositionalLogic.SimpleLogic
