                                                                       
                                                                

import LRA.NumberSystems.IntegerStructure.Interface.ModelTheory.LStructure
import LRA.NumberSystems.IntegerStructure.Definition
import LRA.Logic.Model.SecondOrderMonadic.HenkinModel

namespace LRA.NumberSystems.IntegerStructure.Interface.ModelTheory

open LRA.NumberSystems.IntegerStructure.Interface.Signature

   
                                           

                                                                           
                                                                        
                                                                            
                                                                           
                                     
  

                                                     
def IntegerInverseAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (∀ element : M.Domain,
    M.interpretFunction .predecessor (fun _ => M.interpretFunction .successor (fun _ => element)) =
      element) /\
  (∀ element : M.Domain,
    M.interpretFunction .successor (fun _ => M.interpretFunction .predecessor (fun _ => element)) =
      element)

                                                                         
       
def IntegerBaseNeighboursAxiom
    (M : IntegerStructureLStructure) : Prop :=
  (M.interpretFunction .successor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .one) /\
  (M.interpretFunction .predecessor (fun _ => M.interpretConstant .zero) =
    M.interpretConstant .negativeOne)

                                                                     
def IntegerAperiodicAxiom
    (M : IntegerStructureLStructure) : Prop :=
  ∀ iterations : Nat, 0 < iterations ->
    LRA.NumberSystems.IntegerStructure.iterate
      (fun element => M.interpretFunction .successor (fun _ => element))
      iterations (M.interpretConstant .zero) ≠
      M.interpretConstant .zero

                                                                          
                                                                          
def IntegerInductionAxiom
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  ∀ subset ∈ M.SecondOrderDomain,
    M.interpretConstant .zero ∈ subset ->
    (∀ element ∈ subset,
      M.interpretFunction .successor (fun _ => element) ∈ subset) ->
    (∀ element ∈ subset,
      M.interpretFunction .predecessor (fun _ => element) ∈ subset) ->
    ∀ element : M.Domain, element ∈ subset

                                                                      
                                                                  
                                             
def IntegerStructureHenkinTheory
    (M : LRA.Logic.SecondOrderMonadic.HenkinModel IntegerFirstOrderSignature) : Prop :=
  IntegerInverseAxiom M.toModel /\
  IntegerBaseNeighboursAxiom M.toModel /\
  IntegerAperiodicAxiom M.toModel /\
  IntegerInductionAxiom M

                                                                       
                  
abbrev IntegerStructureTheory := IntegerStructureHenkinTheory

                                                                        
                 
abbrev IntegerStructureAxioms := IntegerStructureHenkinTheory

end LRA.NumberSystems.IntegerStructure.Interface.ModelTheory
