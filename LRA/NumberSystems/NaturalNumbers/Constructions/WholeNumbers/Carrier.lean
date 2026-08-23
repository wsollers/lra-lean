                                                                           
                                                                                        

import LRA.NumberSystems.NaturalNumbers.Constructions.Landau.Operations

namespace LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers

universe u v

variable {Element : Type u} {SetObject : Type v}
variable [Membership Element SetObject]

   
                                                                                
                                                    
                                                                 

                                                                        
                                                                           
                                                                       
                                                                           
                                                                             
                                                                      
            
  

                                                                         

                                                                       
                                                                     
                                                                          
                                                                         
                                              
  
structure NaturalArithmeticForWholeNumbers
    (Element : Type u) (SetObject : Type v)
    [Membership Element SetObject] where
  model : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject
  strictOrder : Element → Element → Prop
  strictOrder_trichotomous :
    ∀ first second,
      strictOrder first second ∨ first = second ∨ strictOrder second first
  strictOrder_transitive :
    ∀ first second third,
      strictOrder first second →
      strictOrder second third →
      strictOrder first third
  addition_preserves_and_reflects_strictOrder :
    ∀ first second translation,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model first translation)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauAddition
            model second translation)
  multiplication_preserves_and_reflects_strictOrder :
    ∀ first second factor,
      strictOrder first second ↔
        strictOrder
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model first factor)
          (LRA.NumberSystems.NaturalNumbers.Constructions.Landau.LandauMultiplication
            model second factor)

variable (natural_data : NaturalArithmeticForWholeNumbers Element SetObject)

                                                                                        
abbrev Carrier
    (_natural_data : NaturalArithmeticForWholeNumbers Element SetObject) :=
  Option Element

                         
def zero : Carrier natural_data := none

                        
def one : Carrier natural_data := some natural_data.model.one

                                                                         
def naturalEmbedding (value : Element) : Carrier natural_data := some value

                                      
def successor : Carrier natural_data → Carrier natural_data
  | none => some natural_data.model.one
  | some value => some (natural_data.model.successor value)

                                                                          
                 
def strictOrder : Carrier natural_data → Carrier natural_data → Prop
  | none, none => False
  | none, some _ => True
  | some _, none => False
  | some left, some right => natural_data.strictOrder left right

                                                    
def nonstrictOrder (left right : Carrier natural_data) : Prop :=
  strictOrder natural_data left right ∨ left = right

end LRA.NumberSystems.NaturalNumbers.Constructions.WholeNumbers
