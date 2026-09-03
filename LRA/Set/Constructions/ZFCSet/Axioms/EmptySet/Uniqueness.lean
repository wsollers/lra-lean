import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Existence
import LRA.Set.Constructions.ZFCSet.Axioms.Extensionality.Theorems

namespace LRA.Set.Constructions.ZFCSet.Axioms

theorem EmptySetIsUnique
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    B = A := by
  have abEqual := Extensionality A
  symm
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp
    intro arbInA
    --have arbNotInA :=
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr
    intro arbInB
    have contradiction :=  BIsEmpty arbSet arbInB
    cases contradiction

theorem EmptySetsAreEqual
    {A B : Set}
    (AIsEmpty : IsEmptySet A)
    (BIsEmpty : IsEmptySet B) :
    A = B := by
  have abEqual := Extensionality A
  rw [abEqual]
  intro arbSet
  constructor
  . -- mp ->
    intro arbInA
    have contradiction :=  AIsEmpty arbSet arbInA
    cases contradiction

  . -- mpr <--
    intro arbInB
    have contradiction :=  BIsEmpty arbSet arbInB
    cases contradiction


/--
There exists exactly one empty ZFC set, with uniqueness expressed using Lean
equality. The identity-polymorphic counterpart is `LRA.Identity.ExactlyOne`.
-/
theorem EmptySetExistsAndIsUnique :
    ExistsAndUnique IsEmptySet := by
  constructor
  . exact EmptySetExists
  . intro A B AIsEmpty BIsEmpty
    exact EmptySetsAreEqual AIsEmpty BIsEmpty

end LRA.Set.Constructions.ZFCSet.Axioms
