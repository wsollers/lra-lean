                                         
                                                                 

import Mathlib.Data.Rat.Defs
import Mathlib.Data.Set.Basic

namespace LRA.NumberSystems.RealNumbers

                                                     

             

       
                       
                 
                           
                                     
                                                                                
                                                                          
   
  
structure LraReal where
  lower : Set Rat
  nonempty : lower.Nonempty
  not_all : exists q : Rat, q ∉ lower
  downward : forall {p : Rat}, p ∈ lower -> forall {q : Rat}, q < p -> q ∈ lower
  open_above : forall {p : Rat}, p ∈ lower -> exists r, r ∈ lower /\ p < r

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.LraReal

                                                         
instance : Preorder LraReal where
  le x y := x.lower ⊆ y.lower
  le_refl x := Set.Subset.refl x.lower
  le_trans _ _ _ hxy hyz := Set.Subset.trans hxy hyz

end LRA.NumberSystems.RealNumbers.LraReal
namespace LRA.NumberSystems.RealNumbers

end LRA.NumberSystems.RealNumbers
