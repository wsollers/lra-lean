import LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model
import LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory

open LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra

/--
`genericAlgebra` Any `NaturalNumberModel`'s own `add`/`multiply`/`one` interpreted as the universal-algebra structure carrying `NaturalNumbersAlgebraicSignature` — generic over every backend, not tied to a specific carrier.

Predicate logic:

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

Predicate logic (unfolded):

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
      | .one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
