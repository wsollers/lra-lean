import LRA.VolumeI.Algebra.Signatures.Algebraic.GroupSignature

namespace LRA.VolumeI.Algebra.Signatures.Ordered

/-- An ordered group signature adds an order relation symbol to a group language. -/
structure OrderedGroupSignature extends
    LRA.VolumeI.Algebra.Signatures.Algebraic.GroupSignature where
  orderSymbol : Type

end LRA.VolumeI.Algebra.Signatures.Ordered
