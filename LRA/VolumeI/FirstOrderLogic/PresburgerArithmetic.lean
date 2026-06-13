import LRA.VolumeI.FirstOrderLogic.Model

namespace LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic
open Semantics ModelTheory

/-!
  ============================================================
  Presburger Arithmetic as a First-Order Theory
  ============================================================

  Presburger arithmetic is the first-order theory of the natural
  numbers with `zero`, `successor`, and `addition` — but *no*
  multiplication. Its axioms are

    (P1)  ∀ x, ¬ (successor x = zero)
    (P2)  ∀ x y, successor x = successor y → x = y
    (A1)  ∀ x, x + zero = x
    (A2)  ∀ x y, x + successor y = successor (x + y)
    (Ind) the induction schema.

  The contrast with `PeanoSystemModel.lean` is deliberate and
  sharp. Compared to the successor-only system this adds exactly one
  function symbol (`addition`) and two recursion axioms (A1, A2).
  Compared to full Peano arithmetic it *omits* multiplication. That
  single omission is decisive:

    • Presburger arithmetic is complete and DECIDABLE
      (Presburger, 1929).
    • Full PA (with `·`) is incomplete and undecidable
      (Gödel, 1931) — multiplication is what lets arithmetic encode
      its own provability.

  So the three theories form a ladder of expressive power:
    successor-only  ⊂  Presburger (+)  ⊂  Peano (+, ·).
  Commutativity and associativity of `+` are *theorems* here, proved
  from A1/A2 by induction — they are not taken as axioms.
  ============================================================
-/

-- ════════════════════════════════════════════════════════════
-- §1. The Language
-- ════════════════════════════════════════════════════════════

/-- Function symbols: `zero`, `successor`, and a binary `addition`. -/
inductive FunctionSymbol where
  | zero
  | successor
  | addition

/-- No primitive relation symbols; equality is logical. (Order `≤` is
    definable from `+` and could be added as a defined relation later.) -/
inductive RelationSymbol

def language : FirstOrderLanguage where
  FunctionSymbols := FunctionSymbol
  RelationSymbols := RelationSymbol
  arityOfFunctionSymbol := fun
    | FunctionSymbol.zero => 0
    | FunctionSymbol.successor => 1
    | FunctionSymbol.addition => 2
  arityOfRelationSymbol := fun _ => 0

/-- The closed term `0`. -/
def zeroTerm : Term language :=
  Term.functionApplication FunctionSymbol.zero Fin.elim0

/-- The term `successor t`. -/
def successorTerm (argument : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.successor (fun _ => argument)

/-- The term `left + right`. The two arguments are selected by the de Bruijn
    value of the `Fin 2` index (using `Nat` equality, which reduces cleanly). -/
def additionTerm (left right : Term language) : Term language :=
  Term.functionApplication FunctionSymbol.addition
    (fun argumentIndex => if argumentIndex.val = 0 then left else right)

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

/-- (P2) `∀ x y, successor x = successor y → x = y`. -/
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

/-- (A1) `∀ x, x + zero = x`. -/
def additionBaseAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.equation
      (additionTerm (Term.deBruijnVariable 0) zeroTerm)
      (Term.deBruijnVariable 0))

/-- (A2) `∀ x y, x + successor y = successor (x + y)`.
    Outer variable `x` is index 1, inner variable `y` is index 0. -/
def additionStepAxiom : Formula language :=
  Formula.universalQuantification
    (Formula.universalQuantification
      (Formula.equation
        (additionTerm
          (Term.deBruijnVariable 1)
          (successorTerm (Term.deBruijnVariable 0)))
        (successorTerm
          (additionTerm (Term.deBruijnVariable 1) (Term.deBruijnVariable 0)))))

/-- (Ind) The induction axiom for a predicate `P` on the free index 0:
    `(P[0] ∧ ∀ x, P[x] → P[successor x]) → ∀ x, P[x]`. A schema. -/
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

/-- The Presburger theory: P1, P2, A1, A2, and the induction schema. -/
inductive Axiom : Formula language → Prop
  | zeroIsNotASuccessor : Axiom zeroIsNotASuccessorAxiom
  | successorIsInjective : Axiom successorIsInjectiveAxiom
  | additionBase : Axiom additionBaseAxiom
  | additionStep : Axiom additionStepAxiom
  | induction (predicate : Formula language) :
      Axiom (inductionAxiomForFormula predicate)

def theory : FirstOrderTheory language := Axiom

/-- A `PresburgerModel` is precisely a model of the Presburger theory. -/
abbrev PresburgerModel := Model language theory


-- ════════════════════════════════════════════════════════════
-- §3. The Standard Model: ℕ with zero, successor, and addition
-- ════════════════════════════════════════════════════════════

/-- The intended structure: ℕ with `zero ↦ 0`, `successor ↦ Nat.succ`,
    `addition ↦ Nat.add`. -/
abbrev standardNaturalNumberInterpretation : FirstOrderStructure language where
  Domain := Nat
  interpretFunctionSymbol := fun functionSymbol =>
    match functionSymbol with
    | FunctionSymbol.zero => fun _ => 0
    | FunctionSymbol.successor => fun argumentValues => Nat.succ (argumentValues ⟨0, by decide⟩)
    | FunctionSymbol.addition => fun argumentValues => argumentValues ⟨0, by decide⟩ + argumentValues ⟨1, by decide⟩
  interpretRelationSymbol := fun relationSymbol _ => nomatch relationSymbol
  someElementOfDomain := 0

/-- (P1) holds in ℕ. -/
theorem standardModelSatisfiesZeroIsNotASuccessor :
    StructureModelsFormula standardNaturalNumberInterpretation
      zeroIsNotASuccessorAxiom :=
  fun _assignment domainElement equationHypothesis =>
    Nat.succ_ne_zero domainElement equationHypothesis

/-- (P2) holds in ℕ. -/
theorem standardModelSatisfiesSuccessorIsInjective :
    StructureModelsFormula standardNaturalNumberInterpretation
      successorIsInjectiveAxiom :=
  fun _assignment _outer _inner equationHypothesis =>
    Nat.succ.inj equationHypothesis

/-
  Next milestone — the same as for Peano: discharge A1, A2, and the
  induction schema to assemble the full `PresburgerModel`. A1 and A2 follow
  from `Nat.add_zero` and `Nat.add_succ` once the satisfaction conditions are
  unfolded; the schema needs the substitution–evaluation lemma plus `Nat.rec`.
  Left for a compile-checked pass rather than a `sorry`.
-/


-- ════════════════════════════════════════════════════════════
-- §4. Unit Tests — exploring the standard model computationally
-- ════════════════════════════════════════════════════════════

namespace Tests
open Semantics

-- `2 + 3` evaluates to `5` in the standard model.
#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (additionTerm (numeral 2) (numeral 3)) : Nat) == 5

-- `0 + 4` evaluates to `4`.
#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (additionTerm zeroTerm (numeral 4)) : Nat) == 4

-- The right-hand side of the step axiom matches the left, instance
-- `x := 2`, `y := 1`: `2 + successor 1` and `successor (2 + 1)` both give `4`.
#guard
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (additionTerm (numeral 2) (successorTerm (numeral 1))) : Nat) ==
  (evaluateTerm standardNaturalNumberInterpretation (fun _ => (0 : Nat))
    (successorTerm (additionTerm (numeral 2) (numeral 1))) : Nat)

end Tests

end LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic
