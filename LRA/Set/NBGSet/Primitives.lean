namespace LRA.Set

                                                                 
axiom NBGSet : Type

                                                                   
axiom NBGClass : Type

                                             
axiom NBGSetMembership : NBGSet -> NBGSet -> Prop

                                                       
axiom NBGClassMembership : NBGSet -> NBGClass -> Prop

                                           
axiom NBGClassOfSet : NBGSet -> NBGClass

                                                                          
instance : Membership NBGSet NBGSet where
  mem containingSet element := NBGSetMembership element containingSet

                                                                              
instance : Membership NBGSet NBGClass where
  mem containingClass element := NBGClassMembership element containingClass

end LRA.Set
