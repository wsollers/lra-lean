import LRA.VolumeI.Logic.Language.Notation

namespace LRA.Algebra.Signatures.FormalVocabulary

/--
Common display roles for formal notation.

Logical form:

```lean
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript
```
-/
inductive NotationRole where
  | prefix
  | infix
  | postfix
  | superscript

/--
A symbolic notation assignment for a formal symbol.

Logical form:

```lean
structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole
```
-/
structure NotationAssignment (Symbol : Type) where
  SymbolValue : Symbol
  Token : String
  Role : NotationRole

end LRA.Algebra.Signatures.FormalVocabulary
