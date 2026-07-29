import LRA.VolumeI.Algebra.Signatures.Algebraic.MonoidSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/--
A group signature adds a unary inverse symbol to a monoid signature.

Unary inverse/negation as primitive is a deliberate universal-algebra/Lean
choice, even where Fine-style prose later derives the symbol by solving an
equation.
-/
structure GroupSignature extends MonoidSignature where
  InverseSymbol : Type
  InverseArityIsUnary : InverseSymbol -> Nat

end LRA.VolumeI.Algebra.Signatures.Algebraic
