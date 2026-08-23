namespace LRA.Set

universe u

                                                                            
def PredicateSet (Alpha : Type u) := Alpha → Prop

variable {Alpha : Type u}

                                                                             
instance : Membership Alpha (PredicateSet Alpha) where
  mem containingSet element := containingSet element

                                      
theorem PredicateSetExtensionality {A B : PredicateSet Alpha}
    (sameMembers : ∀ x : Alpha, x ∈ A ↔ x ∈ B) :
    A = B := by
  sorry

end LRA.Set
