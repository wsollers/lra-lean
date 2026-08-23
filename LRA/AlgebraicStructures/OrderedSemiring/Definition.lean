import LRA.AlgebraicStructures.OrderedSemiring.Laws.Definition
import LRA.AlgebraicStructures.Semiring.Definition

namespace LRA.AlgebraicStructures

   
                                          
  

                                                                                                
structure OrderedSemiringConceptSignature extends SemiringConceptSignature where
  le : carrier → carrier → Prop

end LRA.AlgebraicStructures
