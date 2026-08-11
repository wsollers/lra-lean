import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.OperationSymbols

namespace LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage

/--
Primitive operation symbols for the basic arithmetic language.

Logical form:

```lean
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication
```
-/
inductive PrimitiveOperationSymbol where
  | zero
  | one
  | addition
  | negation
  | multiplication

/--
Arity assignment for primitive arithmetic operation symbols.

Logical form:

```lean
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2
```
-/
def PrimitiveOperationArity : PrimitiveOperationSymbol -> Nat
  | .zero => 0
  | .one => 0
  | .addition => 2
  | .negation => 1
  | .multiplication => 2

end LRA.VolumeI.Algebra.Signatures.BasicArithmeticLanguage
