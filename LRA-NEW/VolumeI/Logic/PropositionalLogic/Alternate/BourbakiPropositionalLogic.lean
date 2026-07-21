namespace LRA.VolumeI.Logic.PropositionalLogic.Alternate.Bourbaki

/-!
Bourbaki-style propositional proof theory.

This module is an alternate learning artifact, not the core propositional logic
direction for the restart. The main propositional file models regular modern
propositional syntax and truth-table semantics.
-/

inductive Formula where
  | atom : Nat -> Formula
  | neg : Formula -> Formula
  | or : Formula -> Formula -> Formula
  deriving DecidableEq

namespace Formula

def implies (hypothesis conclusion : Formula) : Formula :=
  Formula.or (Formula.neg hypothesis) conclusion

end Formula

inductive IsAxiom : Formula -> Prop where
  | S1 (A : Formula) :
      IsAxiom (Formula.implies (Formula.or A A) A)
  | S2 (A B : Formula) :
      IsAxiom (Formula.implies A (Formula.or A B))
  | S3 (A B : Formula) :
      IsAxiom (Formula.implies (Formula.or A B) (Formula.or B A))
  | S4 (A B C : Formula) :
      IsAxiom
        (Formula.implies
          (Formula.implies A B)
          (Formula.implies (Formula.or C A) (Formula.or C B)))

inductive Theorem : Formula -> Prop where
  | axiom {A : Formula} :
      IsAxiom A -> Theorem A
  | modusPonens {A B : Formula} :
      Theorem (Formula.implies A B) -> Theorem A -> Theorem B

theorem wiring_test : True := by
  trivial

theorem S1_is_theorem (A : Formula) :
    Theorem (Formula.implies (Formula.or A A) A) := by
  exact Theorem.axiom (IsAxiom.S1 A)

theorem S2_is_theorem (A B : Formula) :
    Theorem (Formula.implies A (Formula.or A B)) := by
  exact Theorem.axiom (IsAxiom.S2 A B)

theorem S3_is_theorem (A B : Formula) :
    Theorem (Formula.implies (Formula.or A B) (Formula.or B A)) := by
  exact Theorem.axiom (IsAxiom.S3 A B)

theorem S4_is_theorem (A B C : Formula) :
    Theorem
      (Formula.implies
        (Formula.implies A B)
        (Formula.implies (Formula.or C A) (Formula.or C B))) := by
  exact Theorem.axiom (IsAxiom.S4 A B C)

theorem C1_modus_ponens {A B : Formula}
    (implicationTheorem : Theorem (Formula.implies A B))
    (hypothesisTheorem : Theorem A) :
    Theorem B := by
  exact Theorem.modusPonens implicationTheorem hypothesisTheorem

theorem C8_identity (A : Formula) :
    Theorem (Formula.implies A A) := by
  sorry

end LRA.VolumeI.Logic.PropositionalLogic.Alternate.Bourbaki
