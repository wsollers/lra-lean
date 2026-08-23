import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.BooleanAlgebras.Signature
import LRA.Analysis.MeasureTheory.AlgebraOfSets.Construction.ModelTheory.BooleanAlgebras.ConceptSignature

namespace LRA.Logic.ModelTheory.BooleanAlgebras

                                                                             
                                                                             
                                                                        

             

       
                            
                                                  
                                                                      
        
   
  
def BuildBooleanAlgebraModel
    (signature : BooleanAlgebraConceptSignature) :
    LRA.Logic.FirstOrder.Model BooleanAlgebraFirstOrderSignature where
  Domain := signature.carrier
  domainNonempty := ⟨signature.zero⟩
  interpretFunction
    | .join, args =>
        signature.join (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .meet, args =>
        signature.meet (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
    | .complement, args =>
        signature.complement (args ⟨0, by decide⟩)
  interpretRelation := fun RelationSymbol => nomatch RelationSymbol
  interpretConstant
    | .zero => signature.zero
    | .one => signature.one

end LRA.Logic.ModelTheory.BooleanAlgebras
