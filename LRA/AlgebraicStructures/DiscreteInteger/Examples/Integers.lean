import Mathlib.Data.Int.Basic
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.DiscreteInteger.Examples

/-- `ℤ` is the canonical (per the spec's own categoricity remarks, essentially
the *only*) model of the two-sided-Peano/discrete-ordered-ring axiomatization:
`Succ := (· + 1)`, `Pred := (· - 1)`. -/
instance : LRA.AlgebraicStructures.HasSuccessor Int := ⟨fun x => x + 1⟩
instance : LRA.AlgebraicStructures.HasPredecessor Int := ⟨fun x => x - 1⟩

instance : LRA.AlgebraicStructures.SuccessorLaws Int := by
  sorry

instance : LRA.AlgebraicStructures.SuccessorAdditionLaw Int := by
  sorry

instance : LRA.AlgebraicStructures.SuccessorMultiplicationLaws Int := by
  sorry

instance : LRA.AlgebraicStructures.DiscretenessLaw Int := by
  sorry

end LRA.AlgebraicStructures.DiscreteInteger.Examples
