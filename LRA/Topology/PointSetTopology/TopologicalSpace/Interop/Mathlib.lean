import LRA.Topology.PointSetTopology.TopologicalSpace.Definition.TopologicalSpace

   
                                                                              
  

namespace LRA.Topology

universe u

namespace TopologyDefinition

                                                                        

             

       
                                                                              
                                   
                           
                                     
                                       
                                         
   
  
@[implicit_reducible]
def ToMathlibTopologicalSpace {X : Type u} (topology : TopologyDefinition X) :
    _root_.TopologicalSpace X where
  IsOpen := topology.IsOpen
  isOpen_univ := topology.isOpen_univ
  isOpen_inter := topology.isOpen_inter
  isOpen_sUnion := topology.isOpen_sUnion

                                                                         
                                                      

             

       
                                                                                    
                                                                          
                                       
   
  
theorem ToMathlibIsOpen {X : Type u} (topology : TopologyDefinition X) (U : Set X) :
    letI : _root_.TopologicalSpace X := topology.ToMathlibTopologicalSpace
    _root_.IsOpen U ↔ topology.IsOpen U := by
  sorry

                                                                              
      

             

       
            
                                                            
   
  
def FromMathlibTopologicalSpace (X : Type u) [_root_.TopologicalSpace X] :
    TopologyDefinition X where
  IsOpen := _root_.IsOpen
  isOpen_univ := _root_.isOpen_univ
  isOpen_empty := _root_.isOpen_empty
  isOpen_sUnion := by
    intro S open_sets
    exact _root_.isOpen_sUnion open_sets
  isOpen_inter := by
    intro U V open_U open_V
    exact open_U.inter open_V

end TopologyDefinition

namespace TopologicalSpaceDefinition

                                                                          
                  

             

       
                                                                        
                                            
                                          
   
  
@[implicit_reducible]
def ToMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.topology.ToMathlibTopologicalSpace

                                                                           
                                 

                                                                   
                                                                            
                                                               
instance instMathlibTopologicalSpace (space : TopologicalSpaceDefinition.{u}) :
    _root_.TopologicalSpace space.Carrier :=
  space.ToMathlibTopologicalSpace

end TopologicalSpaceDefinition

                                                                             
                                                 

             

       
                                                                                    
                                               
                                                  
   
  
def IsCompatibleWithMathlibTopologicalSpace {X : Type u} [_root_.TopologicalSpace X]
    (topology : TopologyDefinition X) : Prop :=
  ∀ U : Set X, topology.IsOpen U ↔ _root_.IsOpen U

                                                                            
                        

             

       
                                                                          
                                              
                                           
                                                        
   
  
theorem FromMathlibTopologicalSpaceIsCompatibleWithMathlibTopologicalSpace
    {X : Type u} [_root_.TopologicalSpace X] :
    IsCompatibleWithMathlibTopologicalSpace
      (TopologyDefinition.FromMathlibTopologicalSpace X) := by
  sorry

end LRA.Topology
