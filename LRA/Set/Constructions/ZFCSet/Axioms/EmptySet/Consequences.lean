import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Canonical

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EveryEmptySetEqualsTheEmptySet
    {A : Set}
    (AIsEmpty : IsEmptySet A) :
    A = TheEmptySet := by
  have aIsES := Extensionality A
  rw [aIsES]
  intro arbitrarySet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction := AIsEmpty arbitrarySet arbInA
    cases contradiction
  . -- mpr <-
    intro arbInEmptySet
    have contradiction := TheEmptySetIsEmpty arbitrarySet arbInEmptySet
    cases contradiction



end LRA.Set.Constructions.ZFCSet.Axioms
