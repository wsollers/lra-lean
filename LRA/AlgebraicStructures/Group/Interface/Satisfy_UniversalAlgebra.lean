import LRA.AlgebraicStructures.Group.Interface.ModelTheory.Model
import LRA.AlgebraicStructures.Group.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.AlgebraicStructures.Group.Interface.ModelTheory

universe u

open LRA.AlgebraicStructures.Group.Interface.UniversalAlgebra

/-- Any raw `Mul`/`Inv`/`OfNat _ 1` carrier `R`, interpreted as the
universal-algebra structure carrying `GroupAlgebraicSignature` — generic over
every backend, not tied to a specific carrier.

Logical form:

```lean
def genericAlgebra (R : Type u) [Mul R] [Inv R] [OfNat R 1] [Nonempty R] :
    LRA.Identity.AlgebraicStructure GroupAlgebraicSignature where
  Carrier := R
  carrierNonempty := inferInstance
  interpretOperation
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .inv, args => (args ⟨0, by decide⟩)⁻¹
  interpretConstant
    | .one => 1
```
-/
def genericAlgebra (R : Type u) [Mul R] [Inv R] [OfNat R 1] [Nonempty R] :
    LRA.Identity.AlgebraicStructure GroupAlgebraicSignature where
  Carrier := R
  carrierNonempty := inferInstance
  interpretOperation := fun symbol args =>
    match symbol with
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .inv => (args ⟨0, by decide⟩)⁻¹
  interpretConstant := fun symbol =>
    match symbol with
    | .one => 1

end LRA.AlgebraicStructures.Group.Interface.ModelTheory
