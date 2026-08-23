namespace LRA.Set

                                                                           
axiom ZFCSet : Type

                                                              
axiom ZFCMembership : ZFCSet → ZFCSet → Prop

                                                                      
instance : Membership ZFCSet ZFCSet where
  mem containingSet element := ZFCMembership element containingSet

end LRA.Set
