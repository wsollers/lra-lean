import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

universe u

   
                                                                     
                                                                      
                                                                      
                                                                    
                                                                    
                                                                       
                                                                     
                                                                      
                                         

                                                                  
                                                                   
                                         
  

variable (Point : Type u)

                                                                  
                                                                     
           
class CongruenceLaws [Congruent Point] : Prop where
  CongruenceReflexivity : ∀ x y : Point, congruent x y y x
  CongruenceTransitivity :
    ∀ x y z w u v : Point,
      congruent x y z w → congruent x y u v → congruent z w u v
  CongruenceIdentity : ∀ x y z : Point, congruent x y z z → x = y

                                                                      
                           
class SegmentConstructionLaw [Between Point] [Congruent Point] : Prop where
  SegmentConstruction :
    ∀ x y a b : Point, ∃ z : Point, between x y z ∧ congruent y z a b

                                                       
class FiveSegmentLaw [Between Point] [Congruent Point] : Prop where
  FiveSegment :
    ∀ x y z x' y' z' u u' : Point, x ≠ y →
      between x y z → between x' y' z' →
      congruent x y x' y' → congruent y z y' z' →
      congruent x u x' u' → congruent y u y' u' →
      congruent z u z' u'

                                                                        
         
class BetweennessLaws [Between Point] : Prop where
  BetweennessIdentity : ∀ x y : Point, between x y x → x = y
  InnerPasch :
    ∀ u v p q z : Point, between u p v → between p q z →
      ∃ x : Point, between u x z ∧ between q x v

                                                                 
class ParallelLaw [Between Point] : Prop where
  Playfair :
    ∀ a b c d t : Point, between a d t → between b d c → a ≠ d →
      ∃ x y : Point, between a b x ∧ between a c y ∧ between x t y

                                                                        
                                             
                                                                  
          
class ContinuityLaw [Between Point] : Prop where
  Continuity :
    ∀ φ ψ : Point → Prop,
      (∃ a : Point, ∀ x y : Point, φ x → ψ y → between a x y) →
      ∃ b : Point, ∀ x y : Point, φ x → ψ y → between x b y

                                                                     
                                                          
                                                                     
                                                                       
                                                            

             

       
                                                         
                                                      
       
   
  
def AffinelyIndependent [Between Point] [Congruent Point]
    (n : Nat) (points : Fin (n + 1) → Point) : Prop :=
  sorry

                                                                      
                                                              
                                                      

             

       
                                                                      
                                                                  
       
   
  
def CoincidesOrDeterminedByDistances [Between Point] [Congruent Point]
    (n : Nat) (p : Point) (points : Fin (n + 1) → Point) : Prop :=
  sorry

                                                                   
                                                                  
             
class DimensionLaws [Between Point] [Congruent Point] (n : Nat) : Prop where
  LowerDimension :
    ∃ points : Fin (n + 1) → Point, AffinelyIndependent Point n points
  UpperDimension :
    ∀ (p : Point) (points : Fin (n + 1) → Point),
      AffinelyIndependent Point n points →
      CoincidesOrDeterminedByDistances Point n p points

end LRA.EuclideanSpace
