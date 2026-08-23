namespace LRA.UniversalAlgebra.UniversalProperties.Basic

universe u v

   
                                                                

             

       
                       
                     
                                        
                                         
                                                                                
               
                       
                                                                  
                                
   
  
structure InitialObject
    (Object : Type u)
    (Arrow : Object -> Object -> Type v)
    (initialObject : Object) : Prop where
  ExistsArrow : forall targetObject, Nonempty (Arrow initialObject targetObject)
  UniqueArrow :
    forall targetObject
      (firstArrow secondArrow : Arrow initialObject targetObject),
        firstArrow = secondArrow

end LRA.UniversalAlgebra.UniversalProperties.Basic
