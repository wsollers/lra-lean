import LRA.NumberSystems.Integers.Interface.Signature.Definition
import LRA.Identity.Interface.UniversalAlgebra.Signature.Definition

namespace LRA.NumberSystems.Integers.Interface.UniversalAlgebra

open LRA.NumberSystems.Integers.Interface.Signature

/--
`IntegersAlgebraicSignature` is ℤ's signature restated as a pure `LRA.Identity.AlgebraicSignature`: the same `add`/`mul`/`neg` operation symbols and `zero`/`one` constant symbols as `IntegersFirstOrderSignature`, with no relation symbols — ℤ's order `<` is a first-order-only artifact, not part of the universal-algebra signature.

Predicate logic:

  def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := IntegersFunctionSymbol
    arity := IntegersFirstOrderFunctions.arity
    ConstantSymbol := IntegersConstantSymbol

Predicate logic (unfolded):

  def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
    OperationSymbol := IntegersFunctionSymbol
    arity := IntegersFirstOrderFunctions.arity
    ConstantSymbol := IntegersConstantSymbol (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := IntegersFunctionSymbol
  arity := IntegersFirstOrderFunctions.arity
  ConstantSymbol := IntegersConstantSymbol
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
def IntegersAlgebraicSignature : LRA.Identity.AlgebraicSignature where
  OperationSymbol := IntegersFunctionSymbol
  arity := IntegersFirstOrderFunctions.arity
  ConstantSymbol := IntegersConstantSymbol

end LRA.NumberSystems.Integers.Interface.UniversalAlgebra
