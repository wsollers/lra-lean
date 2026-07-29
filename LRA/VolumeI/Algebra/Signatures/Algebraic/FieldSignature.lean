import LRA.VolumeI.Algebra.Signatures.Algebraic.RingSignature

namespace LRA.VolumeI.Algebra.Signatures.Algebraic

/-- A field signature adds multiplicative inverse notation to a ring signature. -/
structure FieldSignature extends RingSignature where
  inverseSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Algebraic
