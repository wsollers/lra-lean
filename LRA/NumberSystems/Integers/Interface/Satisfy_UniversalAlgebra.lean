import LRA.NumberSystems.Integers.Interface.ModelTheory.Model
import LRA.NumberSystems.Integers.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.Integers.Interface.ModelTheory

open LRA.NumberSystems.Integers.Interface.UniversalAlgebra

/--
`genericAlgebra` Any `IntegerModel`'s own `add`/`mul`/`neg`/`zero`/`one` interpreted as the universal-algebra structure carrying `IntegersAlgebraicSignature` — generic over every backend, not tied to a specific carrier.

Predicate logic:

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

Predicate logic (unfolded):

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
      | .one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
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
