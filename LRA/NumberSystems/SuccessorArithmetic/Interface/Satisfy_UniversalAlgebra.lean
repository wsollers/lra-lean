import LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory.Model
import LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory

open LRA.NumberSystems.SuccessorArithmetic.Interface.UniversalAlgebra

/--
`genericAlgebra` TODO

Predicate logic:

  def genericAlgebra (M : SuccessorArithmeticModel) :
      LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0

Predicate logic (unfolded):

  def genericAlgebra (M : SuccessorArithmeticModel) :
      LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
    Carrier := M.Carrier
    carrierNonempty := M.carrierNonempty
    interpretOperation := fun symbol args =>
      match symbol with
      | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
    interpretConstant := fun symbol =>
      match symbol with
      | .zero => 0 (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def genericAlgebra (M : SuccessorArithmeticModel) :
    LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
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
def genericAlgebra (M : SuccessorArithmeticModel) :
    LRA.Identity.AlgebraicStructure SuccessorArithmeticAlgebraicSignature where
  Carrier := M.Carrier
  carrierNonempty := M.carrierNonempty
  interpretOperation := fun symbol args =>
    match symbol with
    | .successor => LRA.AlgebraicStructures.Succ (args ⟨0, by decide⟩)
  interpretConstant := fun symbol =>
    match symbol with
    | .zero => 0

end LRA.NumberSystems.SuccessorArithmetic.Interface.ModelTheory
