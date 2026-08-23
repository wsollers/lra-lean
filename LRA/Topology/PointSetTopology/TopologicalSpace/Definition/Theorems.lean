import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

   
                                                                            
  

namespace LRA.Topology

universe u

                                                        

                                                                      
                                                                              
                                      

                                                                                                              


             

       
                                                                               
             
   
  
def ClosedSetDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Prop :=
  IsOpen (Eᶜ)

                                                             

                                                                      
                     

                                                                                                               


             

       
                                                                                
                             
   
  
def ClosedSetFamilyOfTopology (X : Type u) [TopologicalSpace X] : Set (Set X) :=
  {F | ClosedSetDefinition F}

open Set

                                                                         

                                                                     
                                                    
                                                    
                               


             

       
                                        
                
                          
                                                                  
                                                                 
                                                  
   
  
theorem closed_sets_in_topological_space
    {X : Type u}
    [TopologicalSpace X] :
    (∀ S : Set (Set X), (∀ C ∈ S, IsClosed C) → IsClosed (⋂₀ S)) ∧
    (∀ C D : Set X, IsClosed C → IsClosed D → IsClosed (C ∪ D)) ∧
    IsClosed (univ : Set X) ∧ IsClosed (∅ : Set X) := by
  sorry

                                                                          

                                                                            
                                                                         
                                       


             

       
                                   
                
                     
                                                           
                                                           
                               
                        
                                            
                                                         
   
  

theorem TopologyFromClosedSetAxioms
    {X : Type u}
    (F : Set (Set X))
    (closedUnderArbitraryIntersections : ∀ S ⊆ F, ⋂₀ S ∈ F)
    (closedUnderFiniteUnions : ∀ C ∈ F, ∀ D ∈ F, C ∪ D ∈ F)
    (_wholeSpaceMem : univ ∈ F)
    (emptyMem : ∅ ∈ F) :
    ∃ topologicalSpace : TopologicalSpace X,
      ∀ C : Set X, @IsClosed X topologicalSpace C ↔ C ∈ F := by
  sorry

                                                        

                                                                             
                                           

                                                                                                                        


             

       
                                                                                         
                                     
   
  
def TopologicalClosureDefinition {X : Type u} [TopologicalSpace X] (E : Set X) : Set X :=
  ⋂₀ {K : Set X | E ⊆ K ∧ IsClosed K}

                                                   

                                                                              
                                       

                                                                                                                                                                                                       


             

       
                                  
                
                        
                 
                      
                                                                   
   
  
theorem TopologicalClosureMonotone
    {X : Type u}
    [TopologicalSpace X]
    {A B : Set X}
    (subset : A ⊆ B) :
    TopologicalClosureDefinition A ⊆ TopologicalClosureDefinition B := by
  sorry

end LRA.Topology
