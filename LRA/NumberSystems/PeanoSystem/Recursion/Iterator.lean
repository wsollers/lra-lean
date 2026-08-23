import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.PeanoSystem.Recursion

open LRA.NumberSystems.PeanoSystem

universe u v w

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]


   
                                

                                                                             
                                   

                                                                                             


             

       
                                                                 
                 
                       
                             
   
  
structure IteratorData (ps : PeanoSystem Element SetObject) where
  Target : Type w
  InitialValue : Target
  StepRule : Target -> Target

   
                                                                                                       

             

       
                                                                                        
   
  
abbrev IteratorDataOnPeanoSystem (ps : PeanoSystem Element SetObject) := IteratorData ps

   
                                            

                                                                   
                                                                                
          

                                                                                                                                                                                                                           


             

       
                           
                                        
                     
                            
                                  
                                                     
                                             
                             
                                                
                                             
   
  
def IteratorFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (iterator_function : Element -> target) : Prop :=
  iterator_function ps.one = initial_value /\
    forall element : Element,
      iterator_function (ps.successor element) =
        step_rule (iterator_function element)

   
                                    

                                                                               
     

                                                                                                                                                                       


             

       
                    
                                        
                            
                                                         
                                      
                             
                                 
                                 
                                                             
   
  
def IteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (relation : Element -> data.Target -> Prop) : Prop :=
  relation ps.one data.InitialValue /\
    forall element : Element,
      forall value : data.Target,
        relation element value ->
        relation (ps.successor element) (data.StepRule value)

   
                                            

                                                                        
                  

                                                                                                                                                                            


             

       
                           
                                        
                            
                       
                                   
                                                   
                                        
                          
   
  
def MinimalIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps)
    (element : Element)
    (value : data.Target) : Prop :=
  forall relation : Element -> data.Target -> Prop,
    IteratorRelation ps data relation ->
    relation element value

   
                                                                     

                                                                               
              

                                                                                                                                                                                                              


             

       
                                                 
                                        
                              
                            
                                       
   
  
theorem MinimalIteratorRelationIsIteratorRelation
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data
      (MinimalIteratorRelation ps data) := by
  sorry

   
                                                                   

             

       
                                   
                                        
                              
                                                              
   
  
theorem IteratorRelationConsistency
    (ps : PeanoSystem Element SetObject)
    (data : IteratorData ps) :
    IteratorRelation ps data (MinimalIteratorRelation ps data) := by
  sorry

   
                                                             

                                                                    

                                                                                                                                                                                                                                             


             

       
                                       
                                        
                              
                             
                                 
                                                     
   
  
theorem MinimalIteratorRelationComplete
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      exists value : data.Target,
        MinimalIteratorRelation ps data element value := by
  let _ := fullInduction
  sorry

   
                                                            

                                                                             
               

                                                                                                                                                                                                                                                                                                                                                                 


             

       
                                            
                                        
                              
                             
                                                    
                                                              
                                                               
                                  
   
  
theorem MinimalIteratorRelationDeterministic
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  let _ := fullInduction
  sorry

   
                                                        

             

       
                             
                                        
                              
                             
                                                    
                                                              
                                                               
                                  
   
  
theorem ForcedValuesAreUnique
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (data : IteratorData ps) :
    forall element : Element,
      forall first_value second_value : data.Target,
        MinimalIteratorRelation ps data element first_value ->
        MinimalIteratorRelation ps data element second_value ->
        first_value = second_value := by
  let _ := fullInduction
  sorry

   
                                                 

                                                                             
                                         

                                                                                                                                                                                                                                                                                                                


             

       
                                   
                                        
                                               
                     
                            
                                    
                                                 
                             
          
              
                     
                 
                         
   
  
theorem ExistenceOfIteratorFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function := by
  let _ := fullInduction
  sorry

   
                                                

                                                                          

                                                                                                                                                                                                                                                                                                                                                                                                                                       


             

       
                                     
                                        
                                               
                     
                            
                                  
                                                          
                                                                               
                                                                                  
                                      
   
  
theorem UniquenessOfIteratorFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (first_iterator second_iterator : Element -> target) :
    IteratorFunctionClauses ps target initial_value step_rule first_iterator ->
      IteratorFunctionClauses ps target initial_value step_rule second_iterator ->
      first_iterator = second_iterator := by
  let _ := fullInduction
  sorry

   
                                                  

                                                       

                                                                     


             

       
                                   
                                        
                                               
                     
                            
                                    
                                                 
                             
          
              
                     
                 
                            
                                                
                               
            
                
                       
                   
                           
                                          
   
  
theorem IteratorFunctionWellDefined
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  let _ := fullInduction
  sorry

   
                                              

                                                                              
                

                                                                                                                                                                                                                


             

       
                                           
                                        
                                               
                     
                            
                                    
                        
                  
                                
        
                   
            
                   
                
   
  
noncomputable def IteratorGeneratedFunction
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    Element -> target :=
  Classical.choose
    (ExistenceOfIteratorFunction
      ps
      fullInduction
      target
      initial_value
      step_rule)

   
                                    

                                                                              
      

                                                                                                                                                                                                                                                               


             

       
                         
                                        
                     
                            
                                    
                                                                                      
   
  
theorem IteratorBaseValue
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule ps.one = initial_value := by
  sorry

   
                                         

                                                                            

                                                                                                                                                                                                                                                                                                                                                                         


             

       
                             
                                        
                     
                            
                                  
                         
                                                                                        
                                                                                     
   
  
theorem IteratorSuccessorStep
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target)
    (element : Element) :
    IteratorGeneratedFunction ps fullInduction target initial_value step_rule (ps.successor element) =
      step_rule (IteratorGeneratedFunction ps fullInduction target initial_value step_rule element) := by
  sorry

   
                                                                               

             

       
                                     
                                        
                                               
                             
                                                            
                                                                            
   
  
noncomputable def IterationOfASelfMap
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (initial_value : Element)
    (step_rule : Element -> Element) : Element -> Element :=
  IteratorGeneratedFunction ps fullInduction Element initial_value step_rule

   
                                      

                                                                             
                                                                              
      

                                                                                                                                                                                                                                                                                                                                                                                                                                                                      


             

       
                            
                                        
                                               
                     
                            
                                    
                                                 
                             
          
              
                     
                 
                            
                                                
                               
            
                
                       
                   
                           
                                          
   
  
theorem PeanoIteratorTheorem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : target -> target) :
    exists iterator_function : Element -> target,
      IteratorFunctionClauses
        ps
        target
        initial_value
        step_rule
        iterator_function /\
      forall other_iterator : Element -> target,
        IteratorFunctionClauses
          ps
          target
          initial_value
          step_rule
          other_iterator ->
        other_iterator = iterator_function := by
  let _ := fullInduction
  sorry

   
                                                                                    

             

       
                          
                                         
                                         
                             
   
  
def StageDependentStepRule
    (_ps : PeanoSystem Element SetObject)
    (target : Type w) : Type (max u w) :=
  Element -> target -> target

   
                                                                     
                                                                     

             

       
                                   
                                        
                     
                            
                                                  
                                                   
   
  
def GeneralRecursiveFunctionClauses
    (ps : PeanoSystem Element SetObject)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (recursive_function : Element -> target) : Prop :=
  recursive_function ps.one = initial_value /\
    forall element : Element,
      recursive_function (ps.successor element) =
        step_rule element (recursive_function element)

   
                                                                                       

             

       
                            
                                        
                            
   
  
def GeneralRecursiveFunction
    (ps : PeanoSystem Element SetObject)
    (target : Type w) : Prop :=
  forall initial_value : target,
    forall step_rule : StageDependentStepRule ps target,
      exists recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule recursive_function

   
                                                                                         

             

       
                                             
                                        
                                               
                     
                            
                                                  
                                                                              
                                   
                                                                   
                                   
                                                                    
                                                        
   
  
theorem UniquenessOfGeneralRecursiveFunctions
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target)
    (first_recursive_function second_recursive_function : Element -> target) :
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule first_recursive_function ->
    GeneralRecursiveFunctionClauses
      ps target initial_value step_rule second_recursive_function ->
    first_recursive_function = second_recursive_function := by
  let _ := fullInduction
  sorry

   
                                                                             

             

       
                                       
                                        
                     
                            
                                                    
                                                  
                                     
                                                            
   
  
theorem GeneralRecursionByStateEncoding
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function := by
  let _ := fullInduction
  sorry

   
                                                                                          

             

       
                                             
                                        
                                               
                     
                            
                                                    
                                                  
                                     
                                                               
                                                          
                                       
                                                                       
                                                     
   
  
theorem GeneralRecursionTheoremForPeanoSystem
    (ps : PeanoSystem Element SetObject)
    (fullInduction : FullPredicateInduction ps)
    (target : Type w)
    (initial_value : target)
    (step_rule : StageDependentStepRule ps target) :
    exists recursive_function : Element -> target,
      GeneralRecursiveFunctionClauses
        ps target initial_value step_rule recursive_function /\
      forall other_recursive_function : Element -> target,
        GeneralRecursiveFunctionClauses
          ps target initial_value step_rule other_recursive_function ->
        other_recursive_function = recursive_function := by
  let _ := fullInduction
  sorry

end LRA.NumberSystems.PeanoSystem.Recursion
