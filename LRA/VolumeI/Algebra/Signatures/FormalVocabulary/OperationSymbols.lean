import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Arity

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

/-- Operation symbols with assigned arities. -/
structure OperationSymbols where
  Symbol : Type
  arity : Symbol -> Arity

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
