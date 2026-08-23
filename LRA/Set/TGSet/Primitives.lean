namespace LRA.Set

                                                                          
axiom TGSet : Type

                                                             
axiom TGMembership : TGSet -> TGSet -> Prop

                                                                     
instance : Membership TGSet TGSet where
  mem containingSet element := TGMembership element containingSet

end LRA.Set
