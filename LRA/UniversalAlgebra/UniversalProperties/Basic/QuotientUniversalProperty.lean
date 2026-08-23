namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v

   
                                                                            

             

       
                                   
                     
                                        
                                          
                                                    
                                                                                     
              
                
                                                                
                                        
                                                    
                
                       
                                             
                                                            
                                                                     
                                  
   
  
structure QuotientUniversalProperty
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (sourceObject quotientObject : Object)
    (projection : Arrow sourceObject quotientObject)
    (RespectsKernel : forall targetObject, Arrow sourceObject targetObject -> Prop) :
    Prop where
  ExistsFactor :
    forall targetObject (map : Arrow sourceObject targetObject),
      RespectsKernel targetObject map ->
        Nonempty (Arrow quotientObject targetObject)
  UniqueFactor :
    forall targetObject
      (map : Arrow sourceObject targetObject)
      (_mapRespectsKernel : RespectsKernel targetObject map)
      (firstFactor secondFactor : Arrow quotientObject targetObject),
        firstFactor = secondFactor

end LRA.UniversalAlgebra.UniversalProperties.Basic
