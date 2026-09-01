import Mathlib.Data.Set.BooleanAlgebra
import LRA.AlgebraicStructures.BooleanAlgebra.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.BooleanAlgebra.Examples

/-- `(𝒫(X), ∪, ∩, compl, ∅, univ)` — the powerset Boolean algebra, free via
Mathlib's native `BooleanAlgebra (Set α)` instance and the subject-local bridge. -/
example {α : Type u} :
    LRA.AlgebraicStructures.BooleanAlgebraLaws
      (Carrier := Set α) (· ⊔ ·) (· ⊓ ·) Compl.compl ⊥ ⊤ :=
  LRA.AlgebraicStructures.ofBooleanAlgebra

end LRA.AlgebraicStructures.BooleanAlgebra.Examples
