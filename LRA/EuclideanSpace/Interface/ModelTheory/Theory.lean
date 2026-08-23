import LRA.EuclideanSpace.Interface.ModelTheory.LStructure
import LRA.Logic.Theory

namespace LRA.EuclideanSpace

   
                                                                    
           

                                                                       
                                                                 
                        
  

                                                                         
abbrev TarskiFormulaTheory (Variable : Type) :=
  LRA.Logic.FirstOrder.FormulaTheory TarskiFirstOrderSignature Variable

                                                                          
abbrev TarskiTheory (Variable : Type) [DecidableEq Variable] :=
  LRA.Logic.FirstOrder.Theory TarskiFirstOrderSignature Variable

                                                                    
          
abbrev TarskiStructuresOfTheory {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) :
    Set TarskiStructure :=
  LRA.Logic.FirstOrder.ModelsOfTheory Γ

                                                                         
def IsTarskiModelOf {Variable : Type} [DecidableEq Variable]
    (M : TarskiStructure) (Γ : TarskiTheory Variable) : Prop :=
  M ∈ TarskiStructuresOfTheory Γ

                                                                 
                                                      
structure TarskiModelOf {Variable : Type} [DecidableEq Variable]
    (Γ : TarskiTheory Variable) where
  toStructure : TarskiStructure
  isModel : IsTarskiModelOf toStructure Γ

end LRA.EuclideanSpace
