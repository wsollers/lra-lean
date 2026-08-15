import LRA.VolumeI.Algebra.Signatures.FormalVocabulary.RelationSymbols

namespace LRA.Algebra.Signatures.BasicArithmeticLanguage

/--
Primitive relation symbols for arithmetic languages.

Logical form:

```lean
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual
```
-/
inductive PrimitiveRelationSymbol where
  | lessThan
  | lessThanOrEqual

/--
Arity assignment for primitive arithmetic relation symbols.

Logical form:

```lean
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2
```
-/
def PrimitiveRelationArity : PrimitiveRelationSymbol -> Nat
  | .lessThan => 2
  | .lessThanOrEqual => 2

end LRA.Algebra.Signatures.BasicArithmeticLanguage
