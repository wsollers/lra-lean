import LRA.VolumeI.Logic.Language.Notation

namespace LRA.VolumeI.Algebra.Signatures.FormalVocabulary

/-- Common display roles for formal notation. -/
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript

/-- A symbolic notation assignment for a formal symbol. -/
structure NotationAssignment (Symbol : Type) where
  symbol : Symbol
  token : String
  role : NotationRole

end LRA.VolumeI.Algebra.Signatures.FormalVocabulary
