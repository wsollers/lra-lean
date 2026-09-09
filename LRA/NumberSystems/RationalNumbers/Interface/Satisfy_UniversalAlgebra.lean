import LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.RationalNumbers.Interface.ModelTheory

open LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra

/--
`genericAlgebra` Any `RationalModel`'s own `add`/`mul`/`neg`/`inv`/`zero`/`one` interpreted as the universal-algebra structure carrying `RationalNumbersAlgebraicSignature` — generic over every backend, not tied to a specific carrier.

Predicate logic:

  def genericAlgebra (M : RationalModel) :
      LRA.Identity.AlgebraicStructure RationalNumbersAlgebraicSignature where
    Carrier

Predicate logic (unfolded):

  def genericAlgebra (M : RationalModel) :
      LRA.Identity.AlgebraicStructure RationalNumbersAlgebraicSignature where
    Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericAlgebra (M : RationalModel) :
    LRA.Identity.AlgebraicStructure RationalNumbersAlgebraicSignature where
  Carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
def genericAlgebra (M : RationalModel) :
    LRA.Identity.AlgebraicStructure RationalNumbersAlgebraicSignature where
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

end LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
