import LRA.AlgebraicStructures.Group.Interface.ModelTheory.Theory
import LRA.AlgebraicStructures.Group.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.Group.Interface.Laws.Definition

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures (GroupLaws)

/-- The group theory carried by the signature any raw `Mul`/`Inv`/`OfNat _ 1`
carrier `R` induces — generic over every backend, not tied to a specific
carrier.

Logical form:

```lean
def genericTheory {R : Type u} [Mul R] [Inv R] [OfNat R 1] : Prop :=
  GroupTheory (GroupConceptSignature.ofCarrier R)
```
-/
def genericTheory {R : Type u} [Mul R] [Inv R] [OfNat R 1] : Prop :=
  GroupTheory (GroupConceptSignature.ofCarrier R)

/-- Every `R` satisfying `GroupLaws` satisfies `genericTheory` at the
signature `R` induces. -/
theorem satisfiesModelTheory
    {R : Type u} [Mul R] [Inv R] [OfNat R 1] [Nonempty R] [GroupLaws R] :
    genericTheory (R := R) := by
  sorry

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
