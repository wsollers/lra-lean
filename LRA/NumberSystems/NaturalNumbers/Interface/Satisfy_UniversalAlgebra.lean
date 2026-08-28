import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra

/-- Any `NaturalNumberModel`'s own `add`/`multiply`/`one` interpreted as the
universal-algebra structure carrying `NaturalNumbersAlgebraicSignature` —
generic over every backend, not tied to a specific carrier.

Logical form:

```lean
def genericAlgebra (M : NaturalNumberModel) :
    LRA.Identity.AlgebraicStructure NaturalNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant
    | .one => 1
```
-/
def genericAlgebra (M : NaturalNumberModel) :
    LRA.Identity.AlgebraicStructure NaturalNumbersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
  interpretConstant := fun symbol =>
    match symbol with
    | .one => 1

end LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory
