                                                                  
                                                  

import LRA.NumberSystems.PeanoSystem.Interface.ModelTheory.LStructure
import LRA.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.PeanoSystem.Interface.ModelTheory

open LRA.NumberSystems.PeanoSystem.Interface.Signature

   
                                           

                                                                     
                                                        
                                                                         
                                                                             
                                                                
                                                        
                                                                            
                                       
  

                                                    
def PeanoBaseNotSuccessorAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => element) ≠ M.interpretConstant .one

                                            
def PeanoSuccessorInjectiveAxiom
    (M : PeanoLStructure) : Prop :=
  ∀ first second : M.Domain,
    M.interpretFunction .successor (fun _ => first) =
      M.interpretFunction .successor (fun _ => second) ->
    first = second

                                                                        
                                                 
def PeanoInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .one ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

                                                                         
                                                                         
                                                       
def PeanoHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel PeanoFirstOrderSignature) : Prop :=
  PeanoBaseNotSuccessorAxiom M.toModel /\
  PeanoSuccessorInjectiveAxiom M.toModel /\
  PeanoInductionAxiom M

                                                                     
                  
abbrev PeanoTheory := PeanoHenkinTheory

                                                                      
                 
abbrev PeanoAxioms := PeanoHenkinTheory

end LRA.NumberSystems.PeanoSystem.Interface.ModelTheory
