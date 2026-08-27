namespace LRA.Identity

universe u v

structure AlgebraicSignature where
  OperationSymbol : Type u
  arity : OperationSymbol → Nat
  ConstantSymbol : Type v

end LRA.Identity
