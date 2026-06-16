import LRA.VolumeI.FirstOrderLogic.Model

namespace LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic
open Semantics ModelTheory

inductive FunctionSymbol where
  | zero
  | successor
  | addition

inductive RelationSymbol

def language : FirstOrderLanguage where
  FunctionSymbols := FunctionSymbol
  RelationSymbols := RelationSymbol
  arityOfFunctionSymbol := fun
    | FunctionSymbol.zero => 0
    | FunctionSymbol.successor => 1
    | FunctionSymbol.addition => 2
  arityOfRelationSymbol := fun _ => 0

def zeroTerm : Term language :=
  Term.functionApplication FunctionSymbol.zero Fin.elim0

def successorTerm (argument : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.successor (fun _ => argument)

def additionTerm (left right : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.addition
    (fun argumentIndex => if argumentIndex.val = 0 then left else right)

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

def additionBaseAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.equation
      (additionTerm (Term.deBruijnVariable 0) zeroTerm)
      (Term.deBruijnVariable 0))

def additionStepAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.universalQuantification
      (Formula.equation
        (additionTerm
          (Term.deBruijnVariable 1)
          (successorTerm (Term.deBruijnVariable 0)))
        (successorTerm
          (additionTerm (Term.deBruijnVariable 1) (Term.deBruijnVariable 0)))))

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
  | additionBase : Axiom additionBaseAxiom
  | additionStep : Axiom additionStepAxiom
  | induction (predicate : Formula language) :
      Axiom (inductionAxiomForFormula predicate)

def theory : FirstOrderTheory language := Axiom

abbrev PresburgerModel := Model language theory

abbrev standardNaturalNumberInterpretation : FirstOrderStructure language where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | FunctionSymbol.zero => fun _ => 0
    | FunctionSymbol.successor => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
    | FunctionSymbol.addition => fun argumentValues => argumentValues ⟨0, by decide⟩ + argumentValues ⟨1, by decide⟩
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
    (additionTerm (numeral 2) (numeral 3)) : Nat) == 5

#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (additionTerm zeroTerm (numeral 4)) : Nat) == 4

#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (additionTerm (numeral 2) (successorTerm (numeral 1))) : Nat) ==
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (successorTerm (additionTerm (numeral 2) (numeral 1))) : Nat)

end Tests

end LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic
