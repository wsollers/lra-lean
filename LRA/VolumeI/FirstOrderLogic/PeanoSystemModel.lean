import LRA.VolumeI.FirstOrderLogic.Model

namespace LRA.VolumeI.FirstOrderLogic.PeanoArithmetic
open Semantics ModelTheory

/-!
  ============================================================
  The Peano (Successor) System as a First-Order Theory
  ============================================================

  This is the Dedekind–Peano *successor* system: the language has
  only `zero` and `successor`, and the axioms are

    (P1)  ∀ x, ¬ (successor x = zero)
    (P2)  ∀ x y, successor x = successor y → x = y
    (P3)  the induction schema.

  It is the first-order, syntactic counterpart of the bundled
  `PeanoSystem` structure used in Volume II. A candid note on
  vocabulary: in the model-theory literature, "Peano arithmetic
  (PA)" usually names the *richer* theory that also has `+` and `·`
  with their recursion axioms. Here `+` and `·` are not symbols of
  the language — exactly as in the Landau/Volume II development,
  where they are later *defined* by recursion rather than axiomatised.
  The sibling file `PresburgerArithmetic.lean` takes the intermediate
  step of adding `+` (but not `·`); comparing the two is the point.
  ============================================================
-/

-- ════════════════════════════════════════════════════════════
-- §1. The Language
-- ════════════════════════════════════════════════════════════

/-- Function symbols: a constant `zero` and a unary `successor`. -/
inductive FunctionSymbol where
  | zero
  | successor

/-- No primitive relation symbols; equality is logical. -/
inductive RelationSymbol

def language : FirstOrderLanguage where
  FunctionSymbols := FunctionSymbol
  RelationSymbols := RelationSymbol
  arityOfFunctionSymbol := fun
    | FunctionSymbol.zero => 0
    | FunctionSymbol.successor => 1
  arityOfRelationSymbol := fun _ => 0

/-- The closed term `0`. -/
def zeroTerm : Term language :=
  Term.functionApplication FunctionSymbol.zero Fin.elim0

/-- The term `successor t`. -/
def successorTerm (argument : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.successor (fun _ => argument)

/-- The closed term for a concrete natural number `n`, i.e. `successorⁿ 0`. -/
def numeral : Nat → Term language
  | 0 => zeroTerm
  | Nat.succ predecessor => successorTerm (numeral predecessor)


-- ════════════════════════════════════════════════════════════
-- §2. The Axioms
-- ════════════════════════════════════════════════════════════

/-- (P1) `∀ x, ¬ (successor x = zero)`. -/
def zeroIsNotASuccessorAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.negation
      (Formula.equation
        (successorTerm (Term.deBruijnVariable 0))
        zeroTerm))

/-- (P2) `∀ x y, successor x = successor y → x = y`.
    Under two binders the outer variable is index 1, the inner is index 0. -/
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

/-- (P3) The induction axiom for a predicate `P` whose induction variable is
    the free index 0: `(P[0] ∧ ∀ x, P[x] → P[successor x]) → ∀ x, P[x]`.
    A *schema*: one axiom per formula `P`. Free indices ≥ 1 are parameters,
    universally closed by `StructureModelsFormula`. -/
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

/-- The Peano theory: P1, P2, and one induction instance per predicate. -/
inductive Axiom : Formula language → Prop
  | zeroIsNotASuccessor : Axiom zeroIsNotASuccessorAxiom
  | successorIsInjective : Axiom successorIsInjectiveAxiom
  | induction (predicate : Formula language) :
      Axiom (inductionAxiomForFormula predicate)

def theory : FirstOrderTheory language := Axiom

/-- A `PeanoSystemModel` is precisely a model of the Peano theory. -/
abbrev PeanoSystemModel := Model language theory


-- ════════════════════════════════════════════════════════════
-- §3. The Standard Model: ℕ with zero and successor
-- ════════════════════════════════════════════════════════════

/-- The intended structure: the natural numbers, `zero ↦ 0`,
    `successor ↦ Nat.succ`. -/
abbrev standardNaturalNumberInterpretation : FirstOrderStructure language where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | FunctionSymbol.zero => fun _ => 0
    | FunctionSymbol.successor => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
  interpretRelationSymbol := fun relationSymbol _ => nomatch relationSymbol
  someElementOfDomain := 0

/-- (P1) holds in ℕ: no successor is zero. The satisfaction conditions unfold
    definitionally to `Nat.succ n ≠ 0`, discharged by `Nat.succ_ne_zero`. -/
theorem standardModelSatisfiesZeroIsNotASuccessor :
    StructureModelsFormula standardNaturalNumberInterpretation
      zeroIsNotASuccessorAxiom :=
  fun _assignment domainElement equationHypothesis =>
    Nat.succ_ne_zero domainElement equationHypothesis

/-- (P2) holds in ℕ: `Nat.succ` is injective. The satisfaction conditions
    unfold to `Nat.succ m = Nat.succ n → m = n`, discharged by `Nat.succ.inj`. -/
theorem standardModelSatisfiesSuccessorIsInjective :
    StructureModelsFormula standardNaturalNumberInterpretation
      successorIsInjectiveAxiom :=
  fun _assignment _outer _inner equationHypothesis =>
    Nat.succ.inj equationHypothesis

/-
  Next milestone — assemble the full `PeanoSystemModel`.
  `modelsEveryAxiom` must handle all three `Axiom` constructors. The two
  non-schema cases are exactly the theorems above. The `induction` case
  needs a substitution–evaluation lemma of the shape

    evaluate (P.substituteVariable 0 t) assignment
      = StructureSatisfies (extendAssignmentWithValue (evaluate t assignment) assignment) P

  after which `Nat.rec` closes it. Left for a compile-checked pass rather
  than a `sorry`, so the file stays axiom-clean.
-/


-- ════════════════════════════════════════════════════════════
-- §4. Unit Tests
-- ════════════════════════════════════════════════════════════

namespace Tests
open Semantics

-- `numeral 3` evaluates to `3`.
#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (numeral 3) : Nat) == 3

-- `zero` evaluates to `0`.
#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    zeroTerm : Nat) == 0

end Tests

end LRA.VolumeI.FirstOrderLogic.PeanoArithmetic
