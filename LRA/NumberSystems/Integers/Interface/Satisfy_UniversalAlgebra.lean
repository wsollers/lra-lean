import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.NumberSystems.Integers.Interface.UniversalAlgebra

/-- Any `IntegerModel`'s own `add`/`mul`/`neg`/`zero`/`one` interpreted as the
universal-algebra structure carrying `IntegersAlgebraicSignature` — generic
over every backend, not tied to a specific carrier.

Logical form:

```lean
def genericAlgebra (M : IntegerModel) :
    LRA.Identity.AlgebraicStructure IntegersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation
    | .add, args => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul, args => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg, args => -(args ⟨0, by decide⟩)
  interpretConstant
    | .zero => 0
    | .one => 1
```
-/
def genericAlgebra (M : IntegerModel) :
    LRA.Identity.AlgebraicStructure IntegersAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .add => args ⟨0, by decide⟩ + args ⟨1, by decide⟩
    | .mul => args ⟨0, by decide⟩ * args ⟨1, by decide⟩
    | .neg => -(args ⟨0, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
    | .one => 1

end LRA.NumberSystems.Integers.Interface.ModelTheory
