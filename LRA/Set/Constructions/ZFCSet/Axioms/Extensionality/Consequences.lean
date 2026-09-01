import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Axiom

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem SetEqualityIffSameMembers (A B : LRA.Set.Constructions.ZFCSet) :
    A = B ↔
      ∀ x : LRA.Set.Constructions.ZFCSet, x ∈ A ↔ x ∈ B := by
  constructor
  . -- mp ->
    intro AEqualsB
    intro element
    constructor
    . -- mp.mp ->
      rw [AEqualsB]
      intro b
      exact b

    . -- mp.mpr
      rw [AEqualsB]
      intro b
      exact b
  . -- mpr <-
    intro hypothesis
    have AEqB := Extensionality A B
    exact AEqB hypothesis


end LRA.Set.Constructions.ZFCSet.Axioms
