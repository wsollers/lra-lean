import LRA.EuclideanSpace.Interface.Signature
import LRA.Logic.Model.Model

namespace LRA.EuclideanSpace

universe u

   
                                        

                                                                   
                                                                       
                                                                        
                                                                   
  

                                                               
                                    
abbrev TarskiStructure := LRA.Logic.FirstOrder.Model TarskiFirstOrderSignature

                                                               
                                                 
def BuildTarskiStructure {Point : Type u} [Nonempty Point]
    (between : Point -> Point -> Point -> Prop)
    (congruent : Point -> Point -> Point -> Point -> Prop) :
    TarskiStructure where
  Domain := Point
  domainNonempty := inferInstance
  interpretFunction := fun symbol _ => symbol.elim
  interpretRelation
    | .between, args =>
        between (args ⟨0, by decide⟩) (args ⟨1, by decide⟩) (args ⟨2, by decide⟩)
    | .congruent, args =>
        congruent (args ⟨0, by decide⟩) (args ⟨1, by decide⟩)
          (args ⟨2, by decide⟩) (args ⟨3, by decide⟩)
  interpretConstant := fun symbol => symbol.elim

                                                                    
                                                   
abbrev BuildTarskiModel := @BuildTarskiStructure

end LRA.EuclideanSpace
