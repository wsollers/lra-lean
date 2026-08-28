import LRA.NumberSystems.WholeNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.WholeNumbers.Interface.ModelTheory

open LRA.NumberSystems.WholeNumbers.Interface.UniversalAlgebra

/-- Any `WholeNumberModel`'s own `add`/`mul`/`zero`/`one` interpreted as the
universal-algebra structure carrying `WholeNumbersAlgebraicSignature` —
generic over every backend, not tied to a specific carrier.

Logical form:

```lean
def genericAlgebra (M : WholeNumberModel) :
    LRA.Identity.AlgebraicStructure WholeNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant
    | .zero => 0
    | .one => 1
```
-/
def genericAlgebra (M : WholeNumberModel) :
    LRA.Identity.AlgebraicStructure WholeNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
    | .one => 1

end LRA.NumberSystems.WholeNumbers.Interface.ModelTheory
