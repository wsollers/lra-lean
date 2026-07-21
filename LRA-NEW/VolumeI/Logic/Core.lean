namespace LRA.VolumeI.Logic

/-!
Shared abstract logic interface for Volume I.

This file contains a thin `Logic` interface, optional mixins, and a small
Boolean connective syntax helper. Concrete logics can instantiate the interface
without being forced to pretend they have identical internal syntax.
-/

structure Logic where
  Formula : Type
  Theory : Type
  Structure : Type
  satisfies : Structure -> Formula -> Prop
  models : Structure -> Theory -> Prop

namespace Logic

/-!
Optional capabilities for concrete object logics.

These are mixins: propositional logic, first-order logic, proof theory, and
model theory can provide whichever operations make mathematical sense for their
own formulas and structures.
-/

class HasTruthValue (Λ : Logic) where
  TruthValue : Type
  evaluate : Λ.Structure -> Λ.Formula -> TruthValue

class HasBooleanEvaluation (Λ : Logic) where
  evaluate : Λ.Structure -> Λ.Formula -> Bool

class HasNegation (Λ : Logic) where
  neg : Λ.Formula -> Λ.Formula

class HasConjunction (Λ : Logic) where
  conj : Λ.Formula -> Λ.Formula -> Λ.Formula

class HasDisjunction (Λ : Logic) where
  disj : Λ.Formula -> Λ.Formula -> Λ.Formula

class HasImplication (Λ : Logic) where
  impl : Λ.Formula -> Λ.Formula -> Λ.Formula

class HasBiconditional (Λ : Logic) where
  iff : Λ.Formula -> Λ.Formula -> Λ.Formula

class HasQuantifiers (Λ : Logic) where
  Variable : Type
  forallQ : Variable -> Λ.Formula -> Λ.Formula
  existsQ : Variable -> Λ.Formula -> Λ.Formula

class HasTheoremhood (Λ : Logic) where
  theoremhood : Λ.Formula -> Prop

class HasSemanticEntailment (Λ : Logic) where
  entails : Λ.Theory -> Λ.Formula -> Prop

def evaluate {Λ : Logic} [HasTruthValue Λ] :
    Λ.Structure -> Λ.Formula -> (HasTruthValue.TruthValue (Λ := Λ)) :=
  HasTruthValue.evaluate

def booleanEvaluate {Λ : Logic} [HasBooleanEvaluation Λ] :
    Λ.Structure -> Λ.Formula -> Bool :=
  HasBooleanEvaluation.evaluate

def negation {Λ : Logic} [HasNegation Λ] :
    Λ.Formula -> Λ.Formula :=
  HasNegation.neg

def conjunction {Λ : Logic} [HasConjunction Λ] :
    Λ.Formula -> Λ.Formula -> Λ.Formula :=
  HasConjunction.conj

def disjunction {Λ : Logic} [HasDisjunction Λ] :
    Λ.Formula -> Λ.Formula -> Λ.Formula :=
  HasDisjunction.disj

def implication {Λ : Logic} [HasImplication Λ] :
    Λ.Formula -> Λ.Formula -> Λ.Formula :=
  HasImplication.impl

def biconditional {Λ : Logic} [HasBiconditional Λ] :
    Λ.Formula -> Λ.Formula -> Λ.Formula :=
  HasBiconditional.iff

def forallQ {Λ : Logic} [HasQuantifiers Λ] :
    HasQuantifiers.Variable (Λ := Λ) -> Λ.Formula -> Λ.Formula :=
  HasQuantifiers.forallQ

def existsQ {Λ : Logic} [HasQuantifiers Λ] :
    HasQuantifiers.Variable (Λ := Λ) -> Λ.Formula -> Λ.Formula :=
  HasQuantifiers.existsQ

end Logic

structure LogicalLanguage where
  Atoms : Type
  UnaryConnectives : Type := Empty
  BinaryConnectives : Type := Empty

inductive LogicalFormula (L : LogicalLanguage) where
  | atom : L.Atoms -> LogicalFormula L
  | unary :
      L.UnaryConnectives ->
      LogicalFormula L ->
      LogicalFormula L
  | binary :
      L.BinaryConnectives ->
      LogicalFormula L ->
      LogicalFormula L ->
      LogicalFormula L

structure LogicalStructure (L : LogicalLanguage) where
  truthValueOfAtom : L.Atoms -> Bool
  truthFunctionOfUnaryConnective :
    L.UnaryConnectives -> Bool -> Bool
  truthFunctionOfBinaryConnective :
    L.BinaryConnectives -> Bool -> Bool -> Bool

def evaluateFormula {L : LogicalLanguage}
    (M : LogicalStructure L) :
    LogicalFormula L -> Bool
  | LogicalFormula.atom a =>
      M.truthValueOfAtom a
  | LogicalFormula.unary connective formula =>
      M.truthFunctionOfUnaryConnective connective (evaluateFormula M formula)
  | LogicalFormula.binary connective leftFormula rightFormula =>
      M.truthFunctionOfBinaryConnective connective
        (evaluateFormula M leftFormula)
        (evaluateFormula M rightFormula)

namespace EvaluationUnfolding

/-!
Generic one-step unfolding facts for `evaluateFormula`.

Every concrete `LogicalLanguage` proves its own connective-specific evaluation
theorems (e.g. "evaluating a conjunction is the boolean and of the operands")
by unfolding `evaluateFormula` at a `unary`/`binary` node and then unfolding
the language's truth-function match arm for the specific connective. The
first unfolding step is entirely generic -- it holds for any `LogicalLanguage`
and any `LogicalStructure` on it, before any particular connective is chosen.
Naming it here means each concrete language states only the second,
connective-specific step instead of re-deriving both steps from scratch.
-/

theorem evaluationOfUnaryConnective
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (connective : L.UnaryConnectives)
    (formula : LogicalFormula L) :
    evaluateFormula M (LogicalFormula.unary connective formula) =
      M.truthFunctionOfUnaryConnective connective (evaluateFormula M formula) := by
  rfl

theorem evaluationOfBinaryConnective
    {L : LogicalLanguage}
    (M : LogicalStructure L)
    (connective : L.BinaryConnectives)
    (leftFormula rightFormula : LogicalFormula L) :
    evaluateFormula M (LogicalFormula.binary connective leftFormula rightFormula) =
      M.truthFunctionOfBinaryConnective connective
        (evaluateFormula M leftFormula)
        (evaluateFormula M rightFormula) := by
  rfl

end EvaluationUnfolding

def StructureSatisfiesFormula {L : LogicalLanguage}
    (M : LogicalStructure L)
    (formula : LogicalFormula L) : Prop :=
  evaluateFormula M formula = true

abbrev LogicalTheory (L : LogicalLanguage) :=
  List (LogicalFormula L)

def StructureModelsTheory {L : LogicalLanguage}
    (M : LogicalStructure L)
    (T : LogicalTheory L) : Prop :=
  forall formula, formula ∈ T -> StructureSatisfiesFormula M formula

namespace Notation

/-!
Shared object-language notation.

These classes name the intended logical connectives for a concrete language.
Not every logic has every connective primitively, so each notation is available
only when the language provides the corresponding connective.
-/

class HasLogicalNot (L : LogicalLanguage) where
  notConnective : L.UnaryConnectives

class HasLogicalAnd (L : LogicalLanguage) where
  andConnective : L.BinaryConnectives

class HasLogicalOr (L : LogicalLanguage) where
  orConnective : L.BinaryConnectives

class HasLogicalImplies (L : LogicalLanguage) where
  impliesConnective : L.BinaryConnectives

class HasLogicalIff (L : LogicalLanguage) where
  iffConnective : L.BinaryConnectives

def logicalNot {L : LogicalLanguage} [HasLogicalNot L]
    (formula : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.unary (HasLogicalNot.notConnective (L := L)) formula

def logicalAnd {L : LogicalLanguage} [HasLogicalAnd L]
    (leftFormula rightFormula : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.binary
    (HasLogicalAnd.andConnective (L := L))
    leftFormula
    rightFormula

def logicalOr {L : LogicalLanguage} [HasLogicalOr L]
    (leftFormula rightFormula : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.binary
    (HasLogicalOr.orConnective (L := L))
    leftFormula
    rightFormula

def logicalImplies {L : LogicalLanguage} [HasLogicalImplies L]
    (hypothesis conclusion : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.binary
    (HasLogicalImplies.impliesConnective (L := L))
    hypothesis
    conclusion

def logicalIff {L : LogicalLanguage} [HasLogicalIff L]
    (leftFormula rightFormula : LogicalFormula L) : LogicalFormula L :=
  LogicalFormula.binary
    (HasLogicalIff.iffConnective (L := L))
    leftFormula
    rightFormula

prefix:max "¬ₗ" => logicalNot
infixl:65  " ∧ₗ " => logicalAnd
infixl:60  " ∨ₗ " => logicalOr
infixr:55  " →ₗ " => logicalImplies
infixl:50  " ↔ₗ " => logicalIff

end Notation

namespace ClosureRules

open Notation

/-!
Generic formula-formation closure rules.

These are deliberately tautological: they expose the formation rules of
`LogicalFormula` as named proof targets for reading and learning.
-/

theorem closedUnderAtomFormation
    {L : LogicalLanguage}
    (atomName : L.Atoms) :
    exists formula : LogicalFormula L,
      formula = LogicalFormula.atom atomName := by
  exact ⟨LogicalFormula.atom atomName, rfl⟩

theorem closedUnderUnaryConnectiveFormation
    {L : LogicalLanguage}
    (connective : L.UnaryConnectives)
    (formula : LogicalFormula L) :
    exists newFormula : LogicalFormula L,
      newFormula = LogicalFormula.unary connective formula := by
  exact ⟨LogicalFormula.unary connective formula, rfl⟩

theorem closedUnderBinaryConnectiveFormation
    {L : LogicalLanguage}
    (connective : L.BinaryConnectives)
    (leftFormula rightFormula : LogicalFormula L) :
    exists newFormula : LogicalFormula L,
      newFormula =
        LogicalFormula.binary connective leftFormula rightFormula := by
  exact ⟨LogicalFormula.binary connective leftFormula rightFormula, rfl⟩

theorem closedUnderNegationFormation
    {L : LogicalLanguage} [HasLogicalNot L]
    (formula : LogicalFormula L) :
    exists negatedFormula : LogicalFormula L,
      negatedFormula = ¬ₗ formula := by
  exact ⟨¬ₗ formula, rfl⟩

theorem closedUnderConjunctionFormation
    {L : LogicalLanguage} [HasLogicalAnd L]
    (leftFormula rightFormula : LogicalFormula L) :
    exists conjunctionFormula : LogicalFormula L,
      conjunctionFormula = leftFormula ∧ₗ rightFormula := by
  exact ⟨leftFormula ∧ₗ rightFormula, rfl⟩

theorem closedUnderDisjunctionFormation
    {L : LogicalLanguage} [HasLogicalOr L]
    (leftFormula rightFormula : LogicalFormula L) :
    exists disjunctionFormula : LogicalFormula L,
      disjunctionFormula = leftFormula ∨ₗ rightFormula := by
  exact ⟨leftFormula ∨ₗ rightFormula, rfl⟩

theorem closedUnderImplicationFormation
    {L : LogicalLanguage} [HasLogicalImplies L]
    (hypothesis conclusion : LogicalFormula L) :
    exists implicationFormula : LogicalFormula L,
      implicationFormula = hypothesis →ₗ conclusion := by
  exact ⟨hypothesis →ₗ conclusion, rfl⟩

theorem closedUnderBiconditionalFormation
    {L : LogicalLanguage} [HasLogicalIff L]
    (leftFormula rightFormula : LogicalFormula L) :
    exists biconditionalFormula : LogicalFormula L,
      biconditionalFormula = (leftFormula ↔ₗ rightFormula) := by
  exact ⟨leftFormula ↔ₗ rightFormula, rfl⟩

end ClosureRules

namespace FormulaMinimality

/-!
The generic induction/minimality principle for object-language formulas.

If a predicate contains every atom and is closed under every primitive unary
and binary connective, then it contains every formula of the language.
-/

theorem minimalityOfWellFormedFormulas
    {L : LogicalLanguage}
    (S : LogicalFormula L -> Prop)
    (containsEveryAtom :
      forall atomName : L.Atoms, S (LogicalFormula.atom atomName))
    (closedUnderEveryUnaryConnective :
      forall (connective : L.UnaryConnectives) (formula : LogicalFormula L),
        S formula ->
        S (LogicalFormula.unary connective formula))
    (closedUnderEveryBinaryConnective :
      forall (connective : L.BinaryConnectives)
        (leftFormula rightFormula : LogicalFormula L),
        S leftFormula ->
        S rightFormula ->
        S (LogicalFormula.binary connective leftFormula rightFormula))
    (formula : LogicalFormula L) :
    S formula := by
  induction formula with
  | atom atomName =>
      exact containsEveryAtom atomName
  | unary connective formula inductionHypothesis =>
      exact closedUnderEveryUnaryConnective connective formula inductionHypothesis
  | binary connective leftFormula rightFormula leftIH rightIH =>
      exact closedUnderEveryBinaryConnective
        connective leftFormula rightFormula leftIH rightIH

end FormulaMinimality

end LRA.VolumeI.Logic
