import LRA.VolumeI.Logic.Semantics.Satisfaction

namespace LRA.VolumeI.Logic

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
nullary-relational content), `FirstOrder.Formula`/`Formula.and` (syntax,
including the derived connective), and `Satisfies`/
`satisfiesAndIffSatisfiesBoth` (semantics) -- all connecting for the
first time in this architecture.
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
`Fin.elim0`) and the derived `FirstOrder.Formula.and` connective. Uses
`Nat` as the (unused) variable type, since this formula mentions no
variables at all. -/
def testFOLFormula : FirstOrder.Formula testFOLSignature Nat :=
  FirstOrder.Formula.and
    (FirstOrder.Formula.relation .A Fin.elim0)
    (FirstOrder.Formula.relation .B Fin.elim0)

/-- The checkpoint: `testFOLModel`, under any assignment (none of its
variables are used), satisfies `A ∧ B`. -/
theorem testFOLModel_satisfies_aAndB (assignment : Nat -> testFOLModel.Domain) :
    Satisfies testFOLModel assignment testFOLFormula := by
  show Satisfies testFOLModel assignment
    (FirstOrder.Formula.and
      (FirstOrder.Formula.relation .A Fin.elim0)
      (FirstOrder.Formula.relation .B Fin.elim0))
  rw [satisfiesAndIffSatisfiesBoth]
  refine ⟨?_, ?_⟩
  · trivial
  · trivial

end LRA.VolumeI.Logic
