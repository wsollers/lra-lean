import LRA.NumberSystems.Presburger.Interface.ModelTheory.Model
import LRA.NumberSystems.Presburger.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.Presburger.Interface.ModelTheory

open LRA.NumberSystems.Presburger.Interface.UniversalAlgebra

/--
`genericAlgebra` TODO

Predicate logic:

  def genericAlgebra (M : PresburgerModel) :
      LRA.Identity.AlgebraicStructure PresburgerAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
      | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0

Predicate logic (unfolded):

  def genericAlgebra (M : PresburgerModel) :
      LRA.Identity.AlgebraicStructure PresburgerAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
      | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericAlgebra (M : PresburgerModel) :
    LRA.Identity.AlgebraicStructure PresburgerAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0
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
def genericAlgebra (M : PresburgerModel) :
    LRA.Identity.AlgebraicStructure PresburgerAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    | .addition => (args ⟨0, by decide⟩) + (args ⟨1, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0

end LRA.NumberSystems.Presburger.Interface.ModelTheory
