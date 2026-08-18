import LRA.AlgebraicStructures.OrderedField.Interface.Signature.Definition

namespace LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature

/-!
First-order signature for complete ordered fields.

The first-order reduct of a complete ordered field uses exactly the
ordered-field language. Completeness does not add a first-order symbol.
-/

abbrev CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.Interface.Signature.OrderedFieldFirstOrderSignature

end LRA.AlgebraicStructures.CompleteOrderedField.Interface.Signature
