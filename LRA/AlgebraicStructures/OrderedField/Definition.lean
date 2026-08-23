import LRA.AlgebraicStructures.OrderedField.Laws.Definition
import LRA.AlgebraicStructures.Field.Definition

namespace LRA.AlgebraicStructures

                                                                                          
structure OrderedFieldConceptSignature extends FieldConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
