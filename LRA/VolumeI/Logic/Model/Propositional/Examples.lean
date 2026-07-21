import LRA.VolumeI.Logic.Model.Propositional.PropositionalModel

namespace LRA.VolumeI.Logic.Propositional

/-!
The first end-to-end checkpoint: A ∧ B, with A and B both true.

This is the smallest possible test that every layer built so far actually
connects: a language (two atoms), a formula built from those atoms and a
derived connective, a model (a valuation), and a proof that the model
satisfies the formula -- checked by the kernel, not merely typechecked.

Simple to state, not simple to reach: it exercises `PropositionalLanguage`
(vocabulary), `Formula`/`Formula.and` (syntax, including a *derived*
connective, not a primitive constructor), `evaluate` and
`Formula.and_evaluatesToConjunction` (semantics), and `PropositionalModel`/
`PropositionalModel.satisfies` (the model layer), all in one proof.
-/

/-- The two-atom test language: `A` and `B`, nothing else. -/
inductive TestAtom where
  | A
  | B

def testLanguage : PropositionalLanguage where
  Atoms := TestAtom

/-- The formula `A ∧ B`, built from the derived `Formula.and` connective,
not a primitive constructor. -/
def testFormula : Formula testLanguage :=
  Formula.and (Formula.atom .A) (Formula.atom .B)

/-- The valuation making both `A` and `B` true. -/
def testModel : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

/-- The checkpoint: `testModel` satisfies `A ∧ B`. -/
theorem testModel_satisfies_aAndB :
    testModel.satisfies testFormula := by
  show evaluate testModel.valuation (Formula.and (Formula.atom .A) (Formula.atom .B)) = true
  rw [Formula.and_evaluatesToConjunction]
  rfl

end LRA.VolumeI.Logic.Propositional
