namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v w

   
                                                                            
                                

             

       
                    
                               
                                        
                                
                         
                                                                     
                   
                                                                            
                                              
                   
                       
                                                         
                                                               
                                
   
  
structure FreeObject
    (Generator Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (Carrier : Object -> Type w)
    (freeObject : Object)
    (includeGenerator : Generator -> Carrier freeObject) : Prop where
  ExistsExtension :
    forall targetObject (_generatorMap : Generator -> Carrier targetObject),
      Nonempty (Arrow freeObject targetObject)
  UniqueExtension :
    forall targetObject
      (_generatorMap : Generator -> Carrier targetObject)
      (firstArrow secondArrow : Arrow freeObject targetObject),
        firstArrow = secondArrow

end LRA.UniversalAlgebra.UniversalProperties.Basic
