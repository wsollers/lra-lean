import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.Arity

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

/-- Relation symbols with assigned arities. -/
structure RelationSymbols where
  Symbol : Type
  ArityOf : Symbol -> Arity

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
