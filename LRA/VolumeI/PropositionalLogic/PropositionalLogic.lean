import LRA.Foundation.Logic.Propositional

-- Define the "lemma" command macro for Lean 4 core compatibility.
macro "lemma" id:ident binders:bracketedBinder* ":" type:term ":=" "by" val:tacticSeq : command =>
  `(theorem $id $binders* : $type := by $val)

namespace LRA.VolumeI.PropositionalLogic
open LRA.Foundation.Logic.Propositional

/-!
  ============================================================
  Standard Propositional Logic
  ============================================================

  This file instantiates the generic propositional meta-logic
  with the ordinary Boolean connectives.
  ============================================================
-/

-- 1. Define the specific universe of atoms and connectives.
inductive StandardAtoms where
  | P | Q | R

inductive StandardUnaryConnective where
  | not

inductive StandardBinaryConnective where
  | and
  | or
  | implies
  | iff

-- 2. Instantiate the propositional language with those symbols.
def StandardPropositionalLanguage : PropositionalLanguage := {
  Atoms := StandardAtoms
  UnaryConnectives := StandardUnaryConnective
  BinaryConnectives := StandardBinaryConnective
}

-- 3. Lock in the standard system names.
abbrev StandardPropositionalFormula :=
  PropositionalFormula StandardPropositionalLanguage

abbrev StandardPropositionalStructure :=
  PropositionalStructure StandardPropositionalLanguage

abbrev StandardPropositionalTheory :=
  PropositionalTheory StandardPropositionalLanguage

-- Compatibility names for the current volume prose.
abbrev PropFormula := StandardPropositionalFormula
abbrev PropModel := StandardPropositionalStructure
abbrev PropTheory := StandardPropositionalTheory

-- 4. Formula constructors and notation.
def atom (a : StandardAtoms) : PropFormula :=
  PropositionalFormula.atom a

def standardNot (ϕ : PropFormula) : PropFormula :=
  PropositionalFormula.unary StandardUnaryConnective.not ϕ

def standardAnd (ϕ ψ : PropFormula) : PropFormula :=
  PropositionalFormula.binary StandardBinaryConnective.and ϕ ψ

def standardOr (ϕ ψ : PropFormula) : PropFormula :=
  PropositionalFormula.binary StandardBinaryConnective.or ϕ ψ

def standardImplies (ϕ ψ : PropFormula) : PropFormula :=
  PropositionalFormula.binary StandardBinaryConnective.implies ϕ ψ

def standardIff (ϕ ψ : PropFormula) : PropFormula :=
  PropositionalFormula.binary StandardBinaryConnective.iff ϕ ψ

prefix:max "¬" => standardNot
infixl:65  " ∧ " => standardAnd
infixl:60  " ∨ " => standardOr
infixr:55  " →ₚ " => standardImplies
infixl:50  " ↔ₚ " => standardIff

-- 5. The intended Boolean semantics for the standard connectives.
def StandardBooleanStructure
    (valuation : StandardAtoms → Bool) :
    StandardPropositionalStructure := {
  truthValueOfAtom := valuation
  truthFunctionOfUnaryConnective := fun connective truthValue =>
    match connective with
    | StandardUnaryConnective.not => !truthValue
  truthFunctionOfBinaryConnective := fun connective leftTruthValue rightTruthValue =>
    match connective with
    | StandardBinaryConnective.and => leftTruthValue && rightTruthValue
    | StandardBinaryConnective.or => leftTruthValue || rightTruthValue
    | StandardBinaryConnective.implies => (!leftTruthValue) || rightTruthValue
    | StandardBinaryConnective.iff => leftTruthValue == rightTruthValue
}

def test_formula : PropFormula :=
  (atom StandardAtoms.P) ∧ ¬(atom StandardAtoms.Q)

def test_model : PropModel :=
  StandardBooleanStructure fun a =>
    match a with
    | StandardAtoms.P => true
    | StandardAtoms.Q => false
    | StandardAtoms.R => false

#eval evaluateFormula test_model test_formula  -- Outputs: true


-- ====================================================================
-- Lemma Package: Closure Properties of Formula Formation
-- ====================================================================

namespace FormulaFormation

  lemma closedUnderAtomFormation (a : StandardAtoms) :
      ∃ (ϕ : PropFormula), ϕ = atom a := by
    exact ⟨atom a, rfl⟩

  lemma closedUnderNegationFormation (ϕ : PropFormula) :
      ∃ (ψ : PropFormula), ψ = ¬ϕ := by
    exact ⟨¬ϕ, rfl⟩

  lemma closedUnderConjunctionFormation (ϕ ψ : PropFormula) :
      ∃ (χ : PropFormula), χ = ϕ ∧ ψ := by
    exact ⟨ϕ ∧ ψ, rfl⟩

  lemma closedUnderDisjunctionFormation (ϕ ψ : PropFormula) :
      ∃ (χ : PropFormula), χ = ϕ ∨ ψ := by
    exact ⟨ϕ ∨ ψ, rfl⟩

  lemma closedUnderImplicationFormation (ϕ ψ : PropFormula) :
      ∃ (χ : PropFormula), χ = ϕ →ₚ ψ := by
    exact ⟨ϕ →ₚ ψ, rfl⟩

  lemma closedUnderBiconditionalFormation (ϕ ψ : PropFormula) :
      ∃ (χ : PropFormula), χ = (ϕ ↔ₚ ψ) := by
    exact ⟨ϕ ↔ₚ ψ, rfl⟩

  lemma closedUnderUnaryConnectiveFormation
      (connective : StandardUnaryConnective) (ϕ : PropFormula) :
      ∃ (ψ : PropFormula),
        ψ = PropositionalFormula.unary connective ϕ := by
    exact ⟨PropositionalFormula.unary connective ϕ, rfl⟩

  lemma closedUnderBinaryConnectiveFormation
      (connective : StandardBinaryConnective) (ϕ ψ : PropFormula) :
      ∃ (χ : PropFormula),
        χ = PropositionalFormula.binary connective ϕ ψ := by
    exact ⟨PropositionalFormula.binary connective ϕ ψ, rfl⟩

end FormulaFormation


-- ====================================================================
-- Theorem Package: Minimality of Well-Formed Formulas
-- ====================================================================

namespace WellFormedFormulaMinimality

  theorem minimalityOfWellFormedFormulas
      (S : PropFormula → Prop)
      (containsEveryAtom :
        ∀ atomName : StandardAtoms, S (atom atomName))
      (closedUnderEveryUnaryConnective :
        ∀ (connective : StandardUnaryConnective) (ϕ : PropFormula),
          S ϕ →
          S (PropositionalFormula.unary connective ϕ))
      (closedUnderEveryBinaryConnective :
        ∀ (connective : StandardBinaryConnective) (ϕ ψ : PropFormula),
          S ϕ →
          S ψ →
          S (PropositionalFormula.binary connective ϕ ψ))
      (ϕ : PropFormula) :
      S ϕ := by
    induction ϕ with
    | atom atomName =>
        exact containsEveryAtom atomName
    | unary connective ϕ inductionHypothesis =>
        exact closedUnderEveryUnaryConnective connective ϕ inductionHypothesis
    | binary connective ϕ ψ leftInductionHypothesis rightInductionHypothesis =>
        exact closedUnderEveryBinaryConnective
          connective ϕ ψ leftInductionHypothesis rightInductionHypothesis

end WellFormedFormulaMinimality


-- ====================================================================
-- Lemma Package: Standard Boolean Semantics
-- ====================================================================

namespace StandardBooleanSemantics

  theorem evaluationOfNegation
      (valuation : StandardAtoms → Bool)
      (ϕ : PropFormula) :
      evaluateFormula (StandardBooleanStructure valuation) (¬ϕ) =
        !(evaluateFormula (StandardBooleanStructure valuation) ϕ) := by
    rfl

  theorem evaluationOfConjunction
      (valuation : StandardAtoms → Bool)
      (ϕ ψ : PropFormula) :
      evaluateFormula (StandardBooleanStructure valuation) (ϕ ∧ ψ) =
        (evaluateFormula (StandardBooleanStructure valuation) ϕ &&
         evaluateFormula (StandardBooleanStructure valuation) ψ) := by
    rfl

  theorem evaluationOfDisjunction
      (valuation : StandardAtoms → Bool)
      (ϕ ψ : PropFormula) :
      evaluateFormula (StandardBooleanStructure valuation) (ϕ ∨ ψ) =
        (evaluateFormula (StandardBooleanStructure valuation) ϕ ||
         evaluateFormula (StandardBooleanStructure valuation) ψ) := by
    rfl

  theorem evaluationOfImplication
      (valuation : StandardAtoms → Bool)
      (ϕ ψ : PropFormula) :
      evaluateFormula (StandardBooleanStructure valuation) (ϕ →ₚ ψ) =
        (!(evaluateFormula (StandardBooleanStructure valuation) ϕ) ||
          evaluateFormula (StandardBooleanStructure valuation) ψ) := by
    rfl

  theorem evaluationOfBiconditional
      (valuation : StandardAtoms → Bool)
      (ϕ ψ : PropFormula) :
      evaluateFormula (StandardBooleanStructure valuation) (ϕ ↔ₚ ψ) =
        (evaluateFormula (StandardBooleanStructure valuation) ϕ ==
         evaluateFormula (StandardBooleanStructure valuation) ψ) := by
    rfl

end StandardBooleanSemantics


-- ====================================================================
-- Theorem Package: Standard Connective Completeness by DNF
-- ====================================================================

namespace StandardConnectiveCompleteness

  def valuationForTruthValuesOfPandQ
      (truthValueOfP truthValueOfQ : Bool) :
      StandardAtoms → Bool
    | StandardAtoms.P => truthValueOfP
    | StandardAtoms.Q => truthValueOfQ
    | StandardAtoms.R => false

  def literalFormulaForAtomAndTruthValue
      (atomName : StandardAtoms)
      (truthValue : Bool) :
      PropFormula :=
    if truthValue then
      atom atomName
    else
      ¬(atom atomName)

  def truthTableRowFormula
      (truthValueOfP truthValueOfQ : Bool) :
      PropFormula :=
    literalFormulaForAtomAndTruthValue StandardAtoms.P truthValueOfP ∧
      literalFormulaForAtomAndTruthValue StandardAtoms.Q truthValueOfQ

  def contradictionFormula : PropFormula :=
    atom StandardAtoms.P ∧ ¬(atom StandardAtoms.P)

  def includeRowWhenTruthFunctionIsTrue
      (truthFunctionValue : Bool)
      (rowFormula accumulatedFormula : PropFormula) :
      PropFormula :=
    if truthFunctionValue then
      rowFormula ∨ accumulatedFormula
    else
      accumulatedFormula

  def disjunctiveNormalFormForBinaryTruthFunction
      (truthFunction : Bool → Bool → Bool) :
      PropFormula :=
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
      ∀ expectedTruthValueOfP expectedTruthValueOfQ
        actualTruthValueOfP actualTruthValueOfQ : Bool,
        evaluateFormula
          (StandardBooleanStructure
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
      ∀ truthFunction : Bool → Bool → Bool,
        ∀ truthValueOfP truthValueOfQ : Bool,
          evaluateFormula
            (StandardBooleanStructure
              (valuationForTruthValuesOfPandQ truthValueOfP truthValueOfQ))
            (disjunctiveNormalFormForBinaryTruthFunction truthFunction)
          =
          truthFunction truthValueOfP truthValueOfQ := by
    sorry

  theorem standardConnectivesCanRepresentEveryBinaryTruthFunction :
      ∀ truthFunction : Bool → Bool → Bool,
        ∃ formula : PropFormula,
          ∀ truthValueOfP truthValueOfQ : Bool,
            evaluateFormula
              (StandardBooleanStructure
                (valuationForTruthValuesOfPandQ truthValueOfP truthValueOfQ))
              formula
            =
            truthFunction truthValueOfP truthValueOfQ := by
    sorry

end StandardConnectiveCompleteness


-- ====================================================================
-- Theorem Package: Standard Propositional Language Metatheory
-- ====================================================================

namespace StandardPropositionalLanguageMetatheory

  def StandardLanguageIsClosedUnderFormulaFormation : Prop :=
    And (∀ atomName : StandardAtoms,
      ∃ formula : PropFormula, formula = atom atomName) (
    And (∀ formula : PropFormula,
      ∃ negatedFormula : PropFormula, negatedFormula = ¬formula) (
    And (∀ leftFormula rightFormula : PropFormula,
      ∃ conjunctionFormula : PropFormula,
        conjunctionFormula = (leftFormula ∧ rightFormula)) (
    And (∀ leftFormula rightFormula : PropFormula,
      ∃ disjunctionFormula : PropFormula,
        disjunctionFormula = (leftFormula ∨ rightFormula)) (
    And (∀ leftFormula rightFormula : PropFormula,
      ∃ implicationFormula : PropFormula,
        implicationFormula = (leftFormula →ₚ rightFormula)) (
      ∀ leftFormula rightFormula : PropFormula,
        ∃ biconditionalFormula : PropFormula,
          biconditionalFormula = (leftFormula ↔ₚ rightFormula)
    )))))

  def StandardWellFormedFormulasAreMinimal : Prop :=
    ∀ S : PropFormula → Prop,
      (∀ atomName : StandardAtoms, S (atom atomName)) →
      (∀ (connective : StandardUnaryConnective) (formula : PropFormula),
        S formula →
        S (PropositionalFormula.unary connective formula)) →
      (∀ (connective : StandardBinaryConnective)
        (leftFormula rightFormula : PropFormula),
        S leftFormula →
        S rightFormula →
        S (PropositionalFormula.binary connective leftFormula rightFormula)) →
      ∀ formula : PropFormula, S formula

  def StandardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions : Prop :=
    ∀ truthFunction : Bool → Bool → Bool,
      ∃ formula : PropFormula,
        ∀ truthValueOfP truthValueOfQ : Bool,
          evaluateFormula
            (StandardBooleanStructure
              (StandardConnectiveCompleteness.valuationForTruthValuesOfPandQ
                truthValueOfP
                truthValueOfQ))
            formula
          =
          truthFunction truthValueOfP truthValueOfQ

  structure StandardPropositionalLanguageCertification where
    standardLanguageIsClosedUnderFormulaFormation :
      StandardLanguageIsClosedUnderFormulaFormation
    standardWellFormedFormulasAreMinimal :
      StandardWellFormedFormulasAreMinimal
    standardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions :
      StandardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions

  theorem standardLanguageIsClosedUnderFormulaFormation :
      StandardLanguageIsClosedUnderFormulaFormation := by
    constructor
    · intro atomName
      exact FormulaFormation.closedUnderAtomFormation atomName
    · constructor
      · intro formula
        exact FormulaFormation.closedUnderNegationFormation formula
      · constructor
        · intro leftFormula rightFormula
          exact FormulaFormation.closedUnderConjunctionFormation
            leftFormula
            rightFormula
        · constructor
          · intro leftFormula rightFormula
            exact FormulaFormation.closedUnderDisjunctionFormation
              leftFormula
              rightFormula
          · constructor
            · intro leftFormula rightFormula
              exact FormulaFormation.closedUnderImplicationFormation
                leftFormula
                rightFormula
            · intro leftFormula rightFormula
              exact FormulaFormation.closedUnderBiconditionalFormation
                leftFormula
                rightFormula

  theorem standardWellFormedFormulasAreMinimal :
      StandardWellFormedFormulasAreMinimal := by
    intro S containsEveryAtom closedUnderEveryUnaryConnective
      closedUnderEveryBinaryConnective formula
    exact WellFormedFormulaMinimality.minimalityOfWellFormedFormulas
      S
      containsEveryAtom
      closedUnderEveryUnaryConnective
      closedUnderEveryBinaryConnective
      formula

  theorem standardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions :
      StandardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions := by
    exact StandardConnectiveCompleteness.standardConnectivesCanRepresentEveryBinaryTruthFunction

  theorem standardPropositionalLanguageHasExpectedMetatheory :
      StandardPropositionalLanguageCertification := {
    standardLanguageIsClosedUnderFormulaFormation :=
      standardLanguageIsClosedUnderFormulaFormation
    standardWellFormedFormulasAreMinimal :=
      standardWellFormedFormulasAreMinimal
    standardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions :=
      standardConnectivesAreFunctionallyCompleteForBinaryTruthFunctions
  }

end StandardPropositionalLanguageMetatheory


-- ====================================================================
-- Lemma Package: Model Theory of Propositional Theories
-- ====================================================================

namespace PropositionalModelTheory

  theorem everyFormulaHasDeterminateTruthValue
      (M : PropModel)
      (ϕ : PropFormula) :
      Or (evaluateFormula M ϕ = true) (evaluateFormula M ϕ = false) := by
    sorry

  theorem structureSatisfiesFormulaIffFormulaEvaluatesToTrue
      (M : PropModel)
      (ϕ : PropFormula) :
      StructureSatisfiesFormula M ϕ ↔ evaluateFormula M ϕ = true := by
    sorry

  theorem structureModelsTheoryIffEveryFormulaInTheoryIsSatisfied
      (M : PropModel)
      (T : PropTheory) :
      StructureModelsTheory M T ↔
        ∀ ϕ, ϕ ∈ T → StructureSatisfiesFormula M ϕ := by
    sorry

  theorem structureModelsEmptyTheory
      (M : PropModel) :
      StructureModelsTheory M [] := by
    intro ϕ formulaInEmptyTheory
    cases formulaInEmptyTheory

  theorem structureModelsSingletonTheoryIffItSatisfiesTheOnlyFormula
      (M : PropModel)
      (ϕ : PropFormula) :
      StructureModelsTheory M [ϕ] ↔ StructureSatisfiesFormula M ϕ := by
    constructor
    · intro modelOfSingletonTheory
      exact modelOfSingletonTheory ϕ (List.Mem.head [])
    · intro satisfiesFormula ψ formulaInSingletonTheory
      cases formulaInSingletonTheory with
      | head _ =>
          exact satisfiesFormula
      | tail _ formulaInEmptyTheory =>
          cases formulaInEmptyTheory

  theorem structureModelsConsTheoryIffItSatisfiesHeadAndModelsTail
      (M : PropModel)
      (ϕ : PropFormula)
      (T : PropTheory) :
      StructureModelsTheory M (ϕ :: T) ↔
        And (StructureSatisfiesFormula M ϕ) (StructureModelsTheory M T) := by
    sorry

  def TheoryIsSatisfiable (T : PropTheory) : Prop :=
    ∃ M : PropModel, StructureModelsTheory M T

  theorem emptyTheoryIsSatisfiable :
      TheoryIsSatisfiable [] := by
    sorry

  def TheorySemanticallyEntailsFormula
      (T : PropTheory)
      (ϕ : PropFormula) : Prop :=
    ∀ M : PropModel,
      StructureModelsTheory M T →
      StructureSatisfiesFormula M ϕ

  theorem formulaInTheoryIsSemanticallyEntailedByTheory
      (T : PropTheory)
      (ϕ : PropFormula)
      (formulaIsInTheory : ϕ ∈ T) :
      TheorySemanticallyEntailsFormula T ϕ := by
    sorry

  theorem modelOfStrongerTheoryIsModelOfWeakerTheory
      (M : PropModel)
      (weakerTheory strongerTheory : PropTheory)
      (weakerTheoryIsContainedInStrongerTheory :
        ∀ ϕ, ϕ ∈ weakerTheory → ϕ ∈ strongerTheory)
      (modelOfStrongerTheory :
        StructureModelsTheory M strongerTheory) :
      StructureModelsTheory M weakerTheory := by
    sorry

  theorem extensionallyEqualTheoriesHaveSameModels
      (M : PropModel)
      (firstTheory secondTheory : PropTheory)
      (theoriesHaveTheSameFormulas :
        ∀ ϕ, ϕ ∈ firstTheory ↔ ϕ ∈ secondTheory) :
      StructureModelsTheory M firstTheory ↔
        StructureModelsTheory M secondTheory := by
    sorry

end PropositionalModelTheory

end LRA.VolumeI.PropositionalLogic
