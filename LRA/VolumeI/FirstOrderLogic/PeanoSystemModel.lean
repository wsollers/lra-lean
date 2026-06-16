import LRA.VolumeI.FirstOrderLogic.Model

namespace LRA.VolumeI.FirstOrderLogic.PeanoArithmetic
open Semantics ModelTheory

inductive FunctionSymbol where
  | zero
  | successor

inductive RelationSymbol

def language : FirstOrderLanguage where
  FunctionSymbols := FunctionSymbol
  RelationSymbols := RelationSymbol
  arityOfFunctionSymbol := fun
    | FunctionSymbol.zero => 0
    | FunctionSymbol.successor => 1
  arityOfRelationSymbol := fun _ => 0

def zeroTerm : Term language :=
  Term.functionApplication FunctionSymbol.zero Fin.elim0

def successorTerm (argument : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.successor (fun _ => argument)

def numeral : Nat → Term language
  | 0 => zeroTerm
  | Nat.succ predecessor => successorTerm (numeral predecessor)

def zeroIsNotASuccessorAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.negation
      (Formula.equation
        (successorTerm (Term.deBruijnVariable 0))
        zeroTerm))

def successorIsInjectiveAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.universalQuantification
      (Formula.implication
        (Formula.equation
          (successorTerm (Term.deBruijnVariable 1))
          (successorTerm (Term.deBruijnVariable 0)))
        (Formula.equation
          (Term.deBruijnVariable 1)
          (Term.deBruijnVariable 0))))

def inductionAxiomForFormula (predicate : Formula language) : Formula language :=
  let baseCase :=
    predicate.substituteVariable 0 zeroTerm
  let inductiveStep :=
    Formula.universalQuantification
      (Formula.implication
        predicate
        (predicate.substituteVariable 0 (successorTerm (Term.deBruijnVariable 0))))
  let conclusion :=
    Formula.universalQuantification predicate
  Formula.implication (Formula.conjunction baseCase inductiveStep) conclusion

inductive Axiom : Formula language → Prop
  | zeroIsNotASuccessor : Axiom zeroIsNotASuccessorAxiom
  | successorIsInjective : Axiom successorIsInjectiveAxiom
  | induction (predicate : Formula language) :
      Axiom (inductionAxiomForFormula predicate)

def theory : FirstOrderTheory language := Axiom

abbrev PeanoSystemModel := Model language theory

abbrev standardNaturalNumberInterpretation : FirstOrderStructure language where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | FunctionSymbol.zero => fun _ => 0
    | FunctionSymbol.successor => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
  interpretRelationSymbol := fun relationSymbol _ => nomatch relationSymbol
  someElementOfDomain := 0

theorem standardModelSatisfiesZeroIsNotASuccessor :
    StructureModelsFormula standardNaturalNumberInterpretation
      zeroIsNotASuccessorAxiom :=
  fun _assignment domainElement equationHypothesis =>
    Nat.succ_ne_zero domainElement equationHypothesis

theorem standardModelSatisfiesSuccessorIsInjective :
    StructureModelsFormula standardNaturalNumberInterpretation
      successorIsInjectiveAxiom :=
  fun _assignment _outer _inner equationHypothesis =>
    Nat.succ.inj equationHypothesis

namespace Tests
open Semantics

#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (numeral 3) : Nat) == 3

#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    zeroTerm : Nat) == 0

end Tests

end LRA.VolumeI.FirstOrderLogic.PeanoArithmetic
