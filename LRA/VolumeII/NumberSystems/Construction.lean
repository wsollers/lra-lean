                                               
                                                           

import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Models

open LRA.NumberSystems.Integers
open LRA.NumberSystems.RationalNumbers

   
                                                        
                                                  
                                                        
                                                     
  

                                              
inductive IntegerConstruction where
  | canonical
  | tao
  | mendelson

                                               
inductive RationalConstruction where
  | canonical
  | reduced
  | fractionField

                                           
inductive RealConstruction where
  | dedekind
  | cauchy
  | cantor
  | intervalQuotient
  | dyadic

                                                               

             

       
                                        
                               
                                 
                         
   
  
structure NumberSystemConstruction where
  Integer : IntegerConstruction
  Rational : RationalConstruction
  Real : RealConstruction

                                                                               
                            

             

       
                                                          
                       
                        
                   
   
  
def CanonicalConstruction : NumberSystemConstruction where
  Integer := .canonical
  Rational := .canonical
  Real := .dedekind

                                                                             
                                                                         
         

                                                                              
                                                                              
                                                                           
                                                                              
              

             

       
                                 
                         
                          
                      
                                         
                                           
                                                                          
                 
                                                                      
                                                                      
                                                                              
                                                                    
   
  
structure NumberSystemTower where
  IntegerCarrier : Type u
  RationalCarrier : Type u
  RealCarrier : Type u
  IntegerSystem : IntegerNumberSystem.{u}
  RationalSystem : RationalNumberSystem.{u}
  RationalUsesIntegerSystem : RationalSystem.IntegerSystem = IntegerSystem
  RealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  IntegerCarrierMatches : IntegerSystem.Model.Carrier = IntegerCarrier
  RationalCarrierMatches : RationalSystem.FieldModel.Carrier = RationalCarrier
  RealCarrierMatches : RealExtension.RealModel.Carrier = RealCarrier

                                                                              
                                      

             

       
                               
                                               
                              
   
  
theorem NumberSystemTowerExists
    (construction : NumberSystemConstruction) :
    Nonempty NumberSystemTower := by
  sorry

                                                             

                                                                           
                                                                              
  
noncomputable def BuildNumberSystemTower
    (construction : NumberSystemConstruction) : NumberSystemTower :=
  Classical.choice (NumberSystemTowerExists construction)

                                       
noncomputable def DefaultTower : NumberSystemTower :=
  BuildNumberSystemTower CanonicalConstruction

                                                 
theorem DefaultRealConstructionIsDedekind :
    CanonicalConstruction.Real = RealConstruction.dedekind := by
  sorry

                                                      
theorem DefaultRationalConstructionIsCanonical :
    CanonicalConstruction.Rational = RationalConstruction.canonical := by
  sorry

end LRA.NumberSystems.Models
