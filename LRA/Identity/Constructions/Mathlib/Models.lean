import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.ModelTheory.Model

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- The canonical equality structure realized by Lean's native equality.

Logical form: `equalityInterpretation x y <-> x = y`.
-/
noncomputable def CanonicalEqualityStructure
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.Identity.EqualityStructure := by
  sorry

/-- The canonical FOL equality model realized by native equality. -/
noncomputable def CanonicalFOLModel
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.FirstOrder.Model LRA.Identity.pureEqualitySignature := by
  sorry

/-- The canonical full-SOL equality model realized by native equality. -/
noncomputable def CanonicalSOLFullModel
    (Carrier : Type u) [Nonempty Carrier] :
    LRA.ModelTheory.SecondOrder.FullModel LRA.Identity.pureEqualitySignature := by
  sorry

end LRA.Identity.Constructions.Mathlib
