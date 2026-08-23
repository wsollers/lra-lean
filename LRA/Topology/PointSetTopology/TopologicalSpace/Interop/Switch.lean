import LRA.Topology.PointSetTopology.TopologicalSpace.Interop.Mathlib

   
                                                                       
                                                                       
                              
  

namespace LRA.Topology

universe u

                                                             

             

       
                                       
                                                                            
            
                                 
                                                                   
                           
                            
   
  
inductive TopologicalSpaceBackend where
                                                                            
            
  | inducedFromTopologyDefinition
                                                                   
  | existingMathlibTopology
  deriving DecidableEq, Repr

                                                                      

             

       
                                                               
                                
   
  
def DefaultTopologicalSpaceBackend : TopologicalSpaceBackend :=
  .inducedFromTopologyDefinition

                                                                              
       

                                           

       
                                                                           
   

                                                                                
                                                              

             

       
                                                                                
                                
                                    
   
  
@[implicit_reducible]
def UseTextbookTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  topology.ToMathlibTopologicalSpace

                                                               

             

       
                                                                               
                                        
                                
               
   
  
@[implicit_reducible]
def UseExistingMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (_topology : TopologyDefinition X) :
    _root_.TopologicalSpace X :=
  inferInstance

                                                                       

             

       
                                              
                                       
                                     
                                                            
                                
                    
                                                                        
                                                        
   
  
@[implicit_reducible]
def SelectMathlibTopologicalSpace {X : Type u}
    (backend : TopologicalSpaceBackend)
    (topology : TopologyDefinition X)
    [existingTopologicalSpace : _root_.TopologicalSpace X] :
    _root_.TopologicalSpace X :=
  match backend with
  | .inducedFromTopologyDefinition => topology.ToMathlibTopologicalSpace
  | .existingMathlibTopology => existingTopologicalSpace

                                                                               
                                                  

             

       
                                                               
                                     
                               
                 
                                       
                                                                           
                                       
   
  
theorem SelectMathlibTopologicalSpaceIsOpenInduced {X : Type u}
    (topology : TopologyDefinition X)
    [_root_.TopologicalSpace X]
    (U : Set X) :
    letI : _root_.TopologicalSpace X :=
      SelectMathlibTopologicalSpace .inducedFromTopologyDefinition topology
    _root_.IsOpen U ↔ topology.IsOpen U := by
  sorry

end LRA.Topology
