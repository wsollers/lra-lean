import LRA.Algebra.LinearAlgebra.VectorSpace.Definition.VectorSpace

   
                                                                          
                                                                          
                                                                    
  

namespace LRA.LinearAlgebra

universe u v w

                                                                             
structure LinearMapDefinition
    (K : Type u) [Field K]
    (V : Type v) (W : Type w)
    (domain : VectorSpaceDefinition K V)
    (codomain : VectorSpaceDefinition K W) where
                                 
  toFun : V → W
                                           
  map_add : ∀ x y : V,
    toFun (domain.add x y) = codomain.add (toFun x) (toFun y)
                                                 
  map_smul : ∀ a : K, ∀ x : V,
    toFun (domain.smul a x) = codomain.smul a (toFun x)

end LRA.LinearAlgebra
