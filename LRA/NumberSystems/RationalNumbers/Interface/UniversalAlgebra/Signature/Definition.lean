import LRA.NumberSystems.RationalNumbers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra

open LRA.NumberSystems.RationalNumbers.Interface.Signature

/--
`RationalNumbersAlgebraicSignature` is ℚ's signature restated as a pure `LRA.Identity.AlgebraicSignature`: the same `add`/`mul`/`neg`/`inv` operation symbols and `zero`/`one` constant symbols as `RationalNumbersFirstOrderSignature`, with no relation symbols — ℚ's order `<` is a first-order-only artifact, not part of the universal-algebra signature.

Predicate logic:

  def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := RationalNumbersFunctionSymbol
    arity := RationalNumbersFirstOrderFunctions.arity
    ConstantSymbol := RationalNumbersConstantSymbol

Predicate logic (unfolded):

  def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := RationalNumbersFunctionSymbol
    arity := RationalNumbersFirstOrderFunctions.arity
    ConstantSymbol := RationalNumbersConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RationalNumbersFunctionSymbol
  arity := RationalNumbersFirstOrderFunctions.arity
  ConstantSymbol := RationalNumbersConstantSymbol
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
def RationalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := RationalNumbersFunctionSymbol
  arity := RationalNumbersFirstOrderFunctions.arity
  ConstantSymbol := RationalNumbersConstantSymbol

end LRA.NumberSystems.RationalNumbers.Interface.UniversalAlgebra
