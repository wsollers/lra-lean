import LRA.Identity.Constructions.Mathlib.Primitives
import LRA.Identity.Interface.Logic.FOL.Theory

namespace LRA.Identity.Constructions.Mathlib

universe u

/-- Native equality satisfies every predicate-relative FOL identity theory.

Logical form: `IdentityTheoryFor Expressible NativeIdentity`.
-/
theorem SatisfiesFOLIdentity (Carrier : Type u)
    (Expressible : (Carrier -> Prop) -> Prop) :
    LRA.Identity.Logic.FOL.IdentityTheoryFor Expressible
      (NativeIdentity : Carrier -> Carrier -> Prop) := by
  sorry

/-- Native equality satisfies the FOL identity theory determined by formulas
definable in the specified model.

Logical form:
```lean
ModelIdentityTheory Variable M NativeIdentity
```
-/
theorem SatisfiesFOLModelIdentity
    {S : LRA.Logic.Signature} (Variable : Type) [DecidableEq Variable]
    (M : LRA.Logic.FirstOrder.Interpretation S) :
    LRA.Identity.Logic.FOL.ModelIdentityTheory Variable M
      (NativeIdentity : M.Domain -> M.Domain -> Prop) := by
  sorry

end LRA.Identity.Constructions.Mathlib
