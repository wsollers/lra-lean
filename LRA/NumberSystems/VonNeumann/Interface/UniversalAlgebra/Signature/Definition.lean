import LRA.NumberSystems.VonNeumann.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra

open LRA.NumberSystems.VonNeumann.Interface.Signature

/--
`VonNeumannAlgebraicSignature` TODO

Predicate logic:

  def VonNeumannAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := VonNeumannFunctionSymbol
    arity := VonNeumannFirstOrderFunctions.arity
    ConstantSymbol := VonNeumannConstantSymbol

Predicate logic (unfolded):

  def VonNeumannAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := VonNeumannFunctionSymbol
    arity := VonNeumannFirstOrderFunctions.arity
    ConstantSymbol := VonNeumannConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def VonNeumannAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := VonNeumannFunctionSymbol
  arity := VonNeumannFirstOrderFunctions.arity
  ConstantSymbol := VonNeumannConstantSymbol
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
def VonNeumannAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := VonNeumannFunctionSymbol
  arity := VonNeumannFirstOrderFunctions.arity
  ConstantSymbol := VonNeumannConstantSymbol

end LRA.NumberSystems.VonNeumann.Interface.UniversalAlgebra
