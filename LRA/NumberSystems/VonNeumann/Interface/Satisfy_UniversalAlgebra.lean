import LRA.NumberSystems.VonNeumann.Interface.ModelTheory.Model
import LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.VonNeumann.Interface.ModelTheory

open LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra

/--
`genericAlgebra` TODO

Predicate logic:

  def genericAlgebra (M : VonNeumannModel) :
      LRA.Identity.AlgebraicStructure VonNeumannAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
      | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
      | .multiplication => (args ⟨0, by decide⟩) * (args ⟨1, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0
      | .one => 1

Predicate logic (unfolded):

  def genericAlgebra (M : VonNeumannModel) :
      LRA.Identity.AlgebraicStructure VonNeumannAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
      | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
      | .multiplication => (args ⟨0, by decide⟩) * (args ⟨1, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0
      | .one => 1 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericAlgebra (M : VonNeumannModel) :
    LRA.Identity.AlgebraicStructure VonNeumannAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
    | .multiplication => (args ⟨0, by decide⟩) * (args ⟨1, by decide⟩)
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
def genericAlgebra (M : VonNeumannModel) :
    LRA.Identity.AlgebraicStructure VonNeumannAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
    | .multiplication => (args ⟨0, by decide⟩) * (args ⟨1, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
    | .one => 1

end LRA.NumberSystems.VonNeumann.Interface.ModelTheory
