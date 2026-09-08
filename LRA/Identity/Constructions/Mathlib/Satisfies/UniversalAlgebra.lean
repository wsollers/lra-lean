import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity.Constructions.Mathlib

universe u v w

/-- Native equality is a congruence for every algebraic structure.

Logical form:
```lean
IsCongruence structure_ NativeIdentity
```
-/
theorem SatisfiesUniversalAlgebraIdentity
    {signature : LRA.Identity.AlgebraicSignature.{v, w}}
    (structure_ : LRA.Identity.AlgebraicStructure.{u} signature) :
    LRA.Identity.IsCongruence structure_
      (NativeIdentity : structure_.Carrier -> structure_.Carrier -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
