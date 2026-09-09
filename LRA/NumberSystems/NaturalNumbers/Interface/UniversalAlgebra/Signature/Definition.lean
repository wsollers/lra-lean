import LRA.NumberSystems.NaturalNumbers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra

open LRA.NumberSystems.NaturalNumbers.Interface.Signature

/--
`NaturalNumbersAlgebraicSignature` is ℕ's signature restated as a pure `LRA.Identity.AlgebraicSignature`: the same `add`/`multiply` operation symbols and `one` constant symbol as `NaturalNumbersFirstOrderSignature`, with no relation symbols — ℕ's order `<` is a first-order-only artifact, not part of the universal-algebra signature.

Predicate logic:

  def NaturalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := NaturalNumbersFunctionSymbol
    arity := NaturalNumbersFirstOrderFunctions.arity
    ConstantSymbol := NaturalNumbersConstantSymbol

Predicate logic (unfolded):

  def NaturalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := NaturalNumbersFunctionSymbol
    arity := NaturalNumbersFirstOrderFunctions.arity
    ConstantSymbol := NaturalNumbersConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def NaturalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := NaturalNumbersFunctionSymbol
  arity := NaturalNumbersFirstOrderFunctions.arity
  ConstantSymbol := NaturalNumbersConstantSymbol
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
def NaturalNumbersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := NaturalNumbersFunctionSymbol
  arity := NaturalNumbersFirstOrderFunctions.arity
  ConstantSymbol := NaturalNumbersConstantSymbol

end LRA.NumberSystems.NaturalNumbers.Interface.UniversalAlgebra
