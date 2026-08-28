import LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RealNumbers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.RealNumbers.Interface.ModelTheory

open LRA.NumberSystems.RealNumbers.Interface.UniversalAlgebra

/-- Any `RealModel`'s own `add`/`mul`/`neg`/`inv`/`zero`/`one` interpreted as
the universal-algebra structure carrying `RealNumbersAlgebraicSignature` —
generic over every backend, not tied to a specific carrier.

Logical form:

```lean
def genericAlgebra (M : RealModel) :
    LRA.Identity.AlgebraicStructure RealNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
    | .inv, args => (args ⟨0, by decide⟩)⁻¹
  interpretConstant
    | .zero => 0
    | .one => 1
```
-/
def genericAlgebra (M : RealModel) :
    LRA.Identity.AlgebraicStructure RealNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg => -(args ⟨0, by decide⟩)
    | .inv => (args ⟨0, by decide⟩)⁻¹
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
    | .one => 1

end LRA.NumberSystems.RealNumbers.Interface.ModelTheory
