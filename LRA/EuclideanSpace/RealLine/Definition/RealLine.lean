import Mathlib.Data.Real.Basic

   
                                                                       
                                                                       
                                                                      
                                                                      
                                                                  
                                                                          
       
  

namespace LRA.EuclideanSpace

                                                                       
                                                                   
       

             

       
                                                   
                                
   
  
noncomputable def RealLineDistance (a b : ℝ) : ℝ :=
  if b ≥ a then b - a else a - b

                                                                    

             

       
                                     
                         
   
  
def OpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x < b}

                                                                       
         

             

       
                                       
                         
   
  
def ClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x ≤ b}

                                                                    
                        

             

       
                                                    
                         
   
  
def LeftClosedRightOpenInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x ∧ x < b}

                                                                    
                        

             

       
                                                    
                         
   
  
def LeftOpenRightClosedInterval (a b : ℝ) : Set ℝ :=
  {x : ℝ | a < x ∧ x ≤ b}

                                                     

             

       
                                   
                 
   
  
def OpenRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a < x}

                                                    

             

       
                                     
                 
   
  
def ClosedRayAbove (a : ℝ) : Set ℝ :=
  {x : ℝ | a ≤ x}

                                                      

             

       
                                   
                 
   
  
def OpenRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x < b}

                                                     

             

       
                                     
                 
   
  
def ClosedRayBelow (b : ℝ) : Set ℝ :=
  {x : ℝ | x ≤ b}

                                                                    

             

       
                                     
   
  
def Translate1 (c x : ℝ) : ℝ := x + c

                                                                      
                                                                        
                    

             

       
                                  
   
  
def Dilate1 (k x : ℝ) : ℝ := k * x

end LRA.EuclideanSpace
