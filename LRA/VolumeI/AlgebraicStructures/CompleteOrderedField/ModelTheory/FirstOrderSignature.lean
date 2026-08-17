import LRA.VolumeI.AlgebraicStructures.OrderedField.ModelTheory.FirstOrderSignature

namespace LRA.AlgebraicStructures.CompleteOrderedField.ModelTheory

/-!
First-order signature for complete ordered fields.

The first-order reduct of a complete ordered field uses exactly the
ordered-field language. Completeness does not add a first-order symbol.
-/

abbrev CompleteOrderedFieldFirstOrderSignature :=
  LRA.AlgebraicStructures.OrderedField.ModelTheory.OrderedFieldFirstOrderSignature

end LRA.AlgebraicStructures.CompleteOrderedField.ModelTheory
