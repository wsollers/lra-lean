import LRA.VolumeI.Logic.Semantics.Sentence

namespace LRA.VolumeI.Logic.FirstOrder

/-!
The second end-to-end checkpoint: A ∧ B, with A and B both true -- now for
first-order logic, via the "propositional atoms as nullary relation
symbols" correspondence (per the source documents reviewed for
`Model.Propositional`): a propositional atom `p` corresponds to a zero-ary
relation symbol `R_p`, whose interpretation in a structure is a truth
value with the domain playing no role.

This mirrors `Model.Propositional.Examples.testModel_satisfies_aAndB`
exactly, one layer up: same shape of test, now exercising `Signature`
(two nullary relation symbols, no functions, no constants), `Model`
(a trivial one-element domain, since the domain is irrelevant to purely
nullary-relational content), `Formula`/`Formula.and` (syntax, including
the derived connective), and `Satisfies`/`satisfiesAndIffSatisfiesBoth`
(semantics) -- all connecting for the first time in this architecture.
-/

/-- The two nullary relation symbols of the test signature: `A` and `B`,
nothing else. -/
inductive TestRelationSymbol where
  | A
  | B

/-- The test signature: no function symbols, no constants, and the two
nullary relation symbols `A`/`B`. -/
def testFOLSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨TestRelationSymbol, fun _ => 0⟩
  Constants := Empty

/-- The test model: a trivial one-element domain (irrelevant here, since
every relation symbol is nullary), interpreting both `A` and `B` as always
true. -/
def testFOLModel : Model testFOLSignature where
  Domain := Unit
  domainNonempty := ⟨()⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

/-- The formula `A ∧ B`, built from two nullary relation applications
(each applied to the unique `Fin 0 -> Term` argument tuple, via
`Fin.elim0`) and the derived `Formula.and` connective. Uses `Nat` as the
(unused) variable type, since this formula mentions no variables at all. -/
def testFOLFormula : Formula testFOLSignature Nat :=
  Formula.and
    (Formula.relation .A Fin.elim0)
    (Formula.relation .B Fin.elim0)

/-- `A ∧ B` is a sentence: it has no free variables. -/
def testFOLSentence : Sentence testFOLSignature Nat :=
  ⟨testFOLFormula, by rfl⟩

/-- The checkpoint: `testFOLModel`, under any assignment (none of its
variables are used), satisfies `A ∧ B`. -/
theorem testFOLModel_satisfies_aAndB (assignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel assignment testFOLFormula := by
  show Satisfies testFOLModel assignment
    (Formula.and
      (Formula.relation .A Fin.elim0)
      (Formula.relation .B Fin.elim0))
  rw [satisfiesAndIffSatisfiesBoth]
  refine ⟨?_, ?_⟩
  · trivial
  · trivial

/-- Sentence checkpoint: satisfaction of `A ∧ B` is assignment-independent. -/
example
    (leftAssignment rightAssignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel leftAssignment testFOLSentence.val ↔
      Satisfies testFOLModel rightAssignment testFOLSentence.val :=
  satisfies_sentence_iff testFOLModel testFOLSentence

/-!
The third checkpoint: `∀`/`∃`.

One unary relation symbol `R`, over the domain `Bool` -- small and
concrete enough to reason about exhaustively. Two models:

  - `alwaysTrueModel`, interpreting `R` as always true: `∀x. R(x)` should
    hold, and so should `∃x. R(x)`.
  - `sometimesFalseModel`, interpreting `R(x)` as `x = true`: `∀x. R(x)`
    should *fail* (witnessed by `x := false`), while `∃x. R(x)` should
    still hold (witnessed by `x := true`).

The failing direction is the genuinely interesting one: proving a `∀`
fails means exhibiting a counterexample and showing the body does not
hold there, exercising negation of a universally quantified statement,
not just the easy "produce a witness for every input" direction.
-/

/-- The one unary relation symbol of the quantifier test signature. -/
inductive QuantifierRelationSymbol where
  | R

/-- The quantifier test signature: no function symbols, no constants, and
the one unary relation symbol `R`. -/
def quantifierSignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨QuantifierRelationSymbol, fun _ => 1⟩
  Constants := Empty

/-- `R` interpreted as always true, over the two-element domain `Bool`. -/
def alwaysTrueModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun _ _ => True
  interpretConstant := Empty.elim

/-- `R` interpreted as "the argument is `true`" -- true of `true`, false
of `false`. -/
def sometimesFalseModel : Model quantifierSignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation
    | .R, args => args ⟨0, by decide⟩ = true
  interpretConstant := Empty.elim

/-- The variable `x` used in the quantifier test formulas, as a bare
`Nat`-indexed variable (matching the canonical `Vbl := {vn | n ∈ N0}`
supply). -/
def x : Nat := 0

/-- The formula `∀x. R(x)`. -/
def forallRFormula : Formula quantifierSignature Nat :=
  Formula.forallQ x (Formula.relation .R (fun _ => Term.var x))

/-- The formula `∃x. R(x)`. -/
def existsRFormula : Formula quantifierSignature Nat :=
  Formula.existsQ x (Formula.relation .R (fun _ => Term.var x))

/-- `∀x. R(x)` holds in `alwaysTrueModel`. -/
theorem alwaysTrueModel_satisfies_forallR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment forallRFormula := by
  show ∀ a : Bool, Satisfies alwaysTrueModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro a
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x a) (Term.var x))
  trivial

/-- `∃x. R(x)` holds in `alwaysTrueModel`. -/
theorem alwaysTrueModel_satisfies_existsR (assignment : Nat -> alwaysTrueModel.Domain) :
    Satisfies alwaysTrueModel assignment existsRFormula := by
  show Satisfies alwaysTrueModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show alwaysTrueModel.interpretRelation .R
    (fun i => evaluateTerm alwaysTrueModel (updateAssignment assignment x true) (Term.var x))
  trivial

/-- `∀x. R(x)` fails in `sometimesFalseModel`, witnessed by `x := false`. -/
theorem sometimesFalseModel_not_satisfies_forallR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    ¬ Satisfies sometimesFalseModel assignment forallRFormula := by
  show ¬ ∀ a : Bool, Satisfies sometimesFalseModel (updateAssignment assignment x a)
    (Formula.relation .R (fun _ => Term.var x))
  intro h
  have hfalse : sometimesFalseModel.interpretRelation .R
      (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x false) (Term.var x)) :=
    h false
  simp [sometimesFalseModel, evaluateTerm, updateAssignment] at hfalse

/-- `∃x. R(x)` still holds in `sometimesFalseModel`, witnessed by
`x := true`. -/
theorem sometimesFalseModel_satisfies_existsR
    (assignment : Nat -> sometimesFalseModel.Domain) :
    Satisfies sometimesFalseModel assignment existsRFormula := by
  show Satisfies sometimesFalseModel assignment
    (Formula.existsQ x (Formula.relation .R (fun _ => Term.var x)))
  rw [satisfiesExistsIffSomeWitness]
  refine ⟨true, ?_⟩
  show sometimesFalseModel.interpretRelation .R
    (fun i => evaluateTerm sometimesFalseModel (updateAssignment assignment x true) (Term.var x))
  simp [sometimesFalseModel, evaluateTerm, updateAssignment]

end LRA.VolumeI.Logic.FirstOrder
