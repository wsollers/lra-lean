import LRA.VolumeI.FirstOrderLogic.PeanoSystemModel
import LRA.VolumeI.FirstOrderLogic.PresburgerArithmetic

namespace LRA.VolumeI.FirstOrderLogic.Comparison
open Semantics

/-!
  ============================================================
  Comparing the Successor and Presburger Models
  ============================================================

  These two standard models share a domain (ℕ) and the symbols
  `zero` and `successor`; Presburger adds `addition`. This file
  pins down, in three increasingly substantive senses, what it
  means to say "Presburger addition and ℕ addition are the same":

    §2  The `addition` SYMBOL *denotes* `Nat.add` in the standard
        model. True essentially by definition of the interpretation
        (a one-line `rfl`).

    §3  The two models AGREE ON VALUES: Presburger's primitive `+`
        on numerals `m, n` equals the value the successor-only model
        reaches as `numeral (m + n)`.

    §4  The addition AXIOMS *force* `Nat.add` on ℕ: any function
        satisfying (A1) and (A2) over ℕ is equal to `Nat.add`. This
        is the non-trivial one — it says the agreement is not a
        coincidence of how we wrote the interpretation, but is
        compelled by the axioms.

  A caveat the formalism makes honest (see notes below): none of
  these say Presburger addition is ℕ addition *in every model* —
  non-standard models exist whose "addition" is not `Nat.add` at all.
  ============================================================
-/

-- ════════════════════════════════════════════════════════════
-- §1. Numerals Evaluate to Themselves
-- ════════════════════════════════════════════════════════════

/-- In the successor (Peano) standard model, the numeral `n` evaluates to `n`. -/
theorem peanoNumeralEvaluatesToItself
    (assignment : VariableAssignment PeanoArithmetic.standardNaturalNumberInterpretation)
    (n : Nat) :
    evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation assignment
      (PeanoArithmetic.numeral n) = n := by
  induction n with
  | zero => rfl
  | succ predecessor inductionHypothesis =>
      show Nat.succ
        (evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation assignment
          (PeanoArithmetic.numeral predecessor)) = Nat.succ predecessor
      rw [inductionHypothesis]

/-- In the Presburger standard model, the numeral `n` evaluates to `n`. -/
theorem presburgerNumeralEvaluatesToItself
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
      (PresburgerArithmetic.numeral n) = n := by
  induction n with
  | zero => rfl
  | succ predecessor inductionHypothesis =>
      show Nat.succ
        (evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
          (PresburgerArithmetic.numeral predecessor)) = Nat.succ predecessor
      rw [inductionHypothesis]


-- ════════════════════════════════════════════════════════════
-- §2. Presburger's `+` Symbol Denotes ℕ Addition (definitionally)
-- ════════════════════════════════════════════════════════════

/-- Evaluating the syntactic sum of two terms in the standard model is the
    `Nat.add` of their evaluations. This holds by `rfl`: the interpretation of
    the `addition` symbol *is* `Nat.add`, so there is nothing to prove beyond
    unfolding. It is the precise sense in which Presburger's `+` "is" ℕ's `+`. -/
theorem presburgerAdditionSymbolDenotesNaturalNumberAddition
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (left right : Term PresburgerArithmetic.language) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
        (PresburgerArithmetic.additionTerm left right)
      = evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment left
        + evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment right :=
  rfl


-- ════════════════════════════════════════════════════════════
-- §3. The Two Models Agree on the Values of Numeral Addition
-- ════════════════════════════════════════════════════════════

/-- Presburger's primitive `+` on the numerals `m` and `n` equals the value of
    the numeral `m + n` in the same model. -/
theorem presburgerAdditionMatchesSuccessorNumeral
    (assignment : VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (m n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
        (PresburgerArithmetic.additionTerm
          (PresburgerArithmetic.numeral m) (PresburgerArithmetic.numeral n))
      = evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation assignment
          (PresburgerArithmetic.numeral (m + n)) := by
  rw [presburgerAdditionSymbolDenotesNaturalNumberAddition]
  simp only [presburgerNumeralEvaluatesToItself]

/-- **The headline.** Presburger's built-in addition on numerals `m` and `n`
    yields the same natural number that the successor-only model assigns to the
    numeral `m + n`. The two systems agree on the value, though only Presburger
    has `+` as a symbol. -/
theorem peanoAndPresburgerAdditionYieldEqualValues
    (peanoAssignment :
      VariableAssignment PeanoArithmetic.standardNaturalNumberInterpretation)
    (presburgerAssignment :
      VariableAssignment PresburgerArithmetic.standardNaturalNumberInterpretation)
    (m n : Nat) :
    evaluateTerm PresburgerArithmetic.standardNaturalNumberInterpretation presburgerAssignment
        (PresburgerArithmetic.additionTerm
          (PresburgerArithmetic.numeral m) (PresburgerArithmetic.numeral n))
      = evaluateTerm PeanoArithmetic.standardNaturalNumberInterpretation peanoAssignment
          (PeanoArithmetic.numeral (m + n)) := by
  rw [presburgerAdditionMatchesSuccessorNumeral,
      presburgerNumeralEvaluatesToItself,
      peanoNumeralEvaluatesToItself]


-- ════════════════════════════════════════════════════════════
-- §4. The Addition Axioms Force ℕ Addition
-- ════════════════════════════════════════════════════════════

/-- **The non-trivial sense of "same thing".** Any binary operation on ℕ that
    satisfies the two Presburger addition equations — the base law `x + 0 = x`
    and the step law `x + S y = S (x + y)` — is *equal* to `Nat.add`. So the
    agreement in §2–§3 is not an artefact of how the interpretation was written:
    the axioms admit exactly one addition on ℕ, namely the standard one.
    Proof: induction on the second argument, mirroring the axioms themselves. -/
theorem additionAxiomsForceNaturalNumberAddition
    (candidateAddition : Nat → Nat → Nat)
    (baseEquation : ∀ x, candidateAddition x 0 = x)
    (stepEquation :
      ∀ x y, candidateAddition x (Nat.succ y) = Nat.succ (candidateAddition x y)) :
    ∀ x y, candidateAddition x y = x + y := by
  intro x y
  induction y with
  | zero => rw [baseEquation, Nat.add_zero]
  | succ predecessor inductionHypothesis =>
      rw [stepEquation, inductionHypothesis, Nat.add_succ]

/-- The standard model satisfies the base axiom (A1): `∀ x, x + 0 = x`.
    Unfolds definitionally to `Nat.add_zero`. -/
theorem standardModelSatisfiesAdditionBase :
    StructureModelsFormula PresburgerArithmetic.standardNaturalNumberInterpretation
      PresburgerArithmetic.additionBaseAxiom :=
  fun _assignment domainElement => Nat.add_zero domainElement

/-- The standard model satisfies the step axiom (A2):
    `∀ x y, x + S y = S (x + y)`. Unfolds definitionally to `Nat.add_succ`. -/
theorem standardModelSatisfiesAdditionStep :
    StructureModelsFormula PresburgerArithmetic.standardNaturalNumberInterpretation
      PresburgerArithmetic.additionStepAxiom :=
  fun _assignment outerValue innerValue => Nat.add_succ outerValue innerValue

/-
  Reading §2 + §4 together: the standard model's addition both *satisfies* the
  axioms (A1, A2 above) and, by `additionAxiomsForceNaturalNumberAddition`, is
  the unique operation on ℕ that does so. That is the strongest honest sense in
  which "Presburger addition = ℕ addition": on the natural numbers, the axioms
  determine `Nat.add` and nothing else.

  What is NOT provable: that Presburger's `+` is `Nat.add` in *every* model.
  Presburger arithmetic has non-standard models whose domain is not ℕ and whose
  `addition` is some other operation entirely; the axioms cannot rule those out,
  which is exactly why the statements above are scoped to the standard model or
  to the ℕ domain.
-/

end LRA.VolumeI.FirstOrderLogic.Comparison
