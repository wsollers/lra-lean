import LRA.VolumeI.Logic.Language.Symbols

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

/-- The arity of a formal symbol. -/
abbrev Arity := Nat

/-- A nullary symbol denotes a constant. -/
def Nullary (arity : Arity) : Prop := arity = 0

/-- A unary symbol denotes a one-input operation or relation. -/
def Unary (arity : Arity) : Prop := arity = 1

/-- A binary symbol denotes a two-input operation or relation. -/
def Binary (arity : Arity) : Prop := arity = 2

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
