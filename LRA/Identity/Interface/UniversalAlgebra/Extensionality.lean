import LRA.Identity.Interface.UniversalAlgebra.Congruence

namespace LRA.Identity

universe u v w

/-- Pointwise-equal argument tuples give equal operation application. Depends
only on function extensionality, not on any particular axiomatization of
equality, so it is shared infrastructure rather than a Leibniz-specific
primitive. -/
theorem IndexedOperationCongruence
    {Index : Type u} {Carrier : Type v} {Codomain : Type w}
    (operation : (Index → Carrier) → Codomain)
    {left right : Index → Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    operation left = operation right := by
  sorry

theorem AlgebraicStructure.interpretOperationCongruence
    {signature : AlgebraicSignature.{v, w}}
    (structure_ : AlgebraicStructure.{u} signature)
    (symbol : signature.OperationSymbol)
    {left right : Fin (signature.arity symbol) → structure_.Carrier}
    (argumentsEqual : ∀ index, left index = right index) :
    structure_.interpretOperation symbol left =
      structure_.interpretOperation symbol right := by
  sorry

end LRA.Identity
