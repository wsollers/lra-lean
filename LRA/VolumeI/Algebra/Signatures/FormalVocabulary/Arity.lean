import LRA.VolumeI.Logic.Language.Symbols

namespace LRA.Algebra.Signatures.FormalVocabulary

/--
The arity of a formal symbol.

Logical form:

```lean
abbrev Arity := Nat
```
-/
abbrev Arity := Nat

/--
A nullary symbol denotes a constant.

Logical form:

```lean
def Nullary (arity : Arity) : Prop := arity = 0
```
-/
def Nullary (arity : Arity) : Prop := arity = 0

/--
A unary symbol denotes a one-input operation or relation.

Logical form:

```lean
def Unary (arity : Arity) : Prop := arity = 1
```
-/
def Unary (arity : Arity) : Prop := arity = 1

/--
A binary symbol denotes a two-input operation or relation.

Logical form:

```lean
def Binary (arity : Arity) : Prop := arity = 2
```
-/
def Binary (arity : Arity) : Prop := arity = 2

end LRA.Algebra.Signatures.FormalVocabulary
