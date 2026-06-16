namespace LRA.VolumeI.FirstOrderLogic

structure FirstOrderLanguage where
  FunctionSymbols : Type
  RelationSymbols : Type
  arityOfFunctionSymbol : FunctionSymbols → Nat
  arityOfRelationSymbol : RelationSymbols → Nat

inductive Term (language : FirstOrderLanguage) where
  | deBruijnVariable (index : Nat) : Term language
  | functionApplication
      (functionSymbol : language.FunctionSymbols)
      (argumentTerms :
        Fin (language.arityOfFunctionSymbol functionSymbol) → Term language) :
      Term language

inductive Formula (language : FirstOrderLanguage) where
  | equation (leftTerm rightTerm : Term language) : Formula language
  | relationApplication
      (relationSymbol : language.RelationSymbols)
      (argumentTerms :
        Fin (language.arityOfRelationSymbol relationSymbol) → Term language) :
      Formula language
  | negation (subFormula : Formula language) : Formula language
  | conjunction (leftFormula rightFormula : Formula language) : Formula language
  | disjunction (leftFormula rightFormula : Formula language) : Formula language
  | implication (hypothesisFormula conclusionFormula : Formula language) : Formula language
  | biconditional (leftFormula rightFormula : Formula language) : Formula language
  | universalQuantification (bodyFormula : Formula language) : Formula language
  | existentialQuantification (bodyFormula : Formula language) : Formula language

def Term.shiftFreeVariablesAbove {language : FirstOrderLanguage}
    (lowerBound : Nat) : Term language → Term language
  | Term.deBruijnVariable index =>
      if index ≥ lowerBound then Term.deBruijnVariable (index + 1)
      else Term.deBruijnVariable index
  | Term.functionApplication functionSymbol argumentTerms =>
      Term.functionApplication functionSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).shiftFreeVariablesAbove lowerBound)

def Term.substituteVariable {language : FirstOrderLanguage}
    (t : Term language) (targetIndex : Nat) (image : Term language) : Term language :=
  match t with
  | Term.deBruijnVariable index =>
      if index = targetIndex then image else Term.deBruijnVariable index
  | Term.functionApplication functionSymbol argumentTerms =>
      Term.functionApplication functionSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).substituteVariable targetIndex image)

def Formula.substituteVariable {language : FirstOrderLanguage}
    (f : Formula language) (targetIndex : Nat) (image : Term language) : Formula language :=
  match f with
  | Formula.equation leftTerm rightTerm =>
      Formula.equation
        (leftTerm.substituteVariable targetIndex image)
        (rightTerm.substituteVariable targetIndex image)
  | Formula.relationApplication relationSymbol argumentTerms =>
      Formula.relationApplication relationSymbol
        (fun argumentIndex =>
          (argumentTerms argumentIndex).substituteVariable targetIndex image)
  | Formula.negation subFormula =>
      Formula.negation (subFormula.substituteVariable targetIndex image)
  | Formula.conjunction leftFormula rightFormula =>
      Formula.conjunction
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.disjunction leftFormula rightFormula =>
      Formula.disjunction
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.implication hypothesisFormula conclusionFormula =>
      Formula.implication
        (hypothesisFormula.substituteVariable targetIndex image)
        (conclusionFormula.substituteVariable targetIndex image)
  | Formula.biconditional leftFormula rightFormula =>
      Formula.biconditional
        (leftFormula.substituteVariable targetIndex image)
        (rightFormula.substituteVariable targetIndex image)
  | Formula.universalQuantification bodyFormula =>
      Formula.universalQuantification
        (bodyFormula.substituteVariable (targetIndex + 1)
          (image.shiftFreeVariablesAbove 0))
  | Formula.existentialQuantification bodyFormula =>
      Formula.existentialQuantification
        (bodyFormula.substituteVariable (targetIndex + 1)
          (image.shiftFreeVariablesAbove 0))

namespace Semantics

structure FirstOrderStructure (language : FirstOrderLanguage) where
  Domain : Type
  interpretFunctionSymbol :
    (functionSymbol : language.FunctionSymbols) →
    (Fin (language.arityOfFunctionSymbol functionSymbol) → Domain) → Domain
  interpretRelationSymbol :
    (relationSymbol : language.RelationSymbols) →
    (Fin (language.arityOfRelationSymbol relationSymbol) → Domain) → Prop
  someElementOfDomain : Domain

abbrev VariableAssignment {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language) : Type :=
  Nat → interpretation.Domain

def extendAssignmentWithValue {language : FirstOrderLanguage}
    {interpretation : FirstOrderStructure language}
    (value : interpretation.Domain)
    (assignment : VariableAssignment interpretation) :
    VariableAssignment interpretation :=
  fun index =>
    match index with
    | 0 => value
    | Nat.succ predecessorIndex => assignment predecessorIndex

def evaluateTerm {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (assignment : VariableAssignment interpretation) :
    Term language → interpretation.Domain
  | Term.deBruijnVariable index => assignment index
  | Term.functionApplication functionSymbol argumentTerms =>
      interpretation.interpretFunctionSymbol functionSymbol
        (fun argumentIndex =>
          evaluateTerm interpretation assignment (argumentTerms argumentIndex))

def StructureSatisfiesFormulaUnderAssignment {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language) :
    VariableAssignment interpretation → Formula language → Prop
  | assignment, Formula.equation leftTerm rightTerm =>
      evaluateTerm interpretation assignment leftTerm =
        evaluateTerm interpretation assignment rightTerm
  | assignment, Formula.relationApplication relationSymbol argumentTerms =>
      interpretation.interpretRelationSymbol relationSymbol
        (fun argumentIndex =>
          evaluateTerm interpretation assignment (argumentTerms argumentIndex))
  | assignment, Formula.negation subFormula =>
      ¬ StructureSatisfiesFormulaUnderAssignment interpretation assignment subFormula
  | assignment, Formula.conjunction leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ∧
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.disjunction leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ∨
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.implication hypothesisFormula conclusionFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment hypothesisFormula →
        StructureSatisfiesFormulaUnderAssignment interpretation assignment conclusionFormula
  | assignment, Formula.biconditional leftFormula rightFormula =>
      StructureSatisfiesFormulaUnderAssignment interpretation assignment leftFormula ↔
        StructureSatisfiesFormulaUnderAssignment interpretation assignment rightFormula
  | assignment, Formula.universalQuantification bodyFormula =>
      ∀ domainElement : interpretation.Domain,
        StructureSatisfiesFormulaUnderAssignment interpretation
          (extendAssignmentWithValue domainElement assignment) bodyFormula
  | assignment, Formula.existentialQuantification bodyFormula =>
      ∃ domainElement : interpretation.Domain,
        StructureSatisfiesFormulaUnderAssignment interpretation
          (extendAssignmentWithValue domainElement assignment) bodyFormula

def StructureModelsFormula {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (formula : Formula language) : Prop :=
  ∀ assignment : VariableAssignment interpretation,
    StructureSatisfiesFormulaUnderAssignment interpretation assignment formula

end Semantics

namespace ModelTheory
open Semantics

abbrev FirstOrderTheory (language : FirstOrderLanguage) : Type :=
  Formula language → Prop

def StructureModelsTheory {language : FirstOrderLanguage}
    (interpretation : FirstOrderStructure language)
    (theory : FirstOrderTheory language) : Prop :=
  ∀ formula, theory formula → StructureModelsFormula interpretation formula

structure Model (language : FirstOrderLanguage)
    (theory : FirstOrderTheory language) where
  interpretation : FirstOrderStructure language
  modelsEveryAxiom :
    ∀ formula, theory formula → StructureModelsFormula interpretation formula

def TheorySemanticallyEntailsFormula {language : FirstOrderLanguage}
    (theory : FirstOrderTheory language) (formula : Formula language) : Prop :=
  ∀ interpretation : FirstOrderStructure language,
    StructureModelsTheory interpretation theory →
      StructureModelsFormula interpretation formula

end ModelTheory

namespace Tests
open Semantics

inductive ToyFunction where
  | point
  | wrap

inductive ToyRelation

def toyLanguage : FirstOrderLanguage where
  FunctionSymbols := ToyFunction
  RelationSymbols := ToyRelation
  arityOfFunctionSymbol := fun
    | ToyFunction.point => 0
    | ToyFunction.wrap => 1
  arityOfRelationSymbol := fun _ => 0

def pointTerm : Term toyLanguage :=
  Term.functionApplication ToyFunction.point Fin.elim0

def wrapTerm (argument : Term toyLanguage) : Term toyLanguage :=
  Term.functionApplication ToyFunction.wrap (fun _ => argument)

abbrev toyStructure : FirstOrderStructure toyLanguage where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | ToyFunction.point => fun _ => 0
    | ToyFunction.wrap => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
  interpretRelationSymbol := fun relationSymbol _ => nomatch relationSymbol
  someElementOfDomain := 0

#guard
  (evaluateTerm toyStructure (fun _ => (0 : Nat))
    (wrapTerm (wrapTerm pointTerm)) : Nat) == 2

def boundEqualsFreeFormula : Formula toyLanguage :=
  Formula.universalQuantification
    (Formula.equation (Term.deBruijnVariable 0) (Term.deBruijnVariable 1))

example :
    boundEqualsFreeFormula.substituteVariable 0 (wrapTerm pointTerm)
      = Formula.universalQuantification
          (Formula.equation (Term.deBruijnVariable 0) (wrapTerm pointTerm)) := by
  dsimp [toyLanguage, boundEqualsFreeFormula, Formula.substituteVariable, Term.substituteVariable, Term.shiftFreeVariablesAbove, wrapTerm, pointTerm]
  congr
  funext x
  congr
  funext x
  cases x with | mk val isLt => omega

example :
    boundEqualsFreeFormula.substituteVariable 0 (Term.deBruijnVariable 5)
      = Formula.universalQuantification
          (Formula.equation (Term.deBruijnVariable 0) (Term.deBruijnVariable 6)) :=
  rfl

end Tests

end LRA.VolumeI.FirstOrderLogic
