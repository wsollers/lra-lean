import Mathlib.Tactic.Tauto
import LRA.Set.Interop.Mathlib.ZFSet.Instances
import LRA.Set.Interface

   
                                                         

                                                                        
                                                                     
                                                     
                                                          
                                                                       
                                                                       
                                                                       
                                                
  

namespace LRA.Set.MathlibZFSet

                                                                    

             

       
                                                 
                                                                   
   
  
theorem mem_symmetricDifference {A B z : ZFSet} :
    z ∈ SymmetricDifference A B ↔ (z ∈ A ∧ z ∉ B) ∨ (z ∈ B ∧ z ∉ A) := by
  sorry

instance : ExtensionalityLaw ZFSet ZFSet where
  SetExtensionality := fun h => ZFSet.ext h

instance : MembershipLaws ZFSet ZFSet where
  EmptyMembership := ZFSet.notMem_empty
  UnionMembership := fun _ _ _ => ZFSet.mem_union
  IntersectionMembership := fun _ _ _ => ZFSet.mem_inter
  DifferenceMembership := fun _ _ _ => ZFSet.mem_sdiff
  SubsetIffAllMembers := fun _ _ => ZFSet.subset_def

instance : SeparationLaws ZFSet ZFSet where
  SeparationMembership := fun _ _ _ => ZFSet.mem_sep

instance : SymmDiffMembershipLaws ZFSet ZFSet where
  SymmetricDifferenceMembership := fun _ _ _ => mem_symmetricDifference

instance : PowersetMembershipLaws ZFSet ZFSet where
  PowersetMembership := fun _ _ => ZFSet.mem_powerset

instance : UnionLaws ZFSet where
  UnionCommutative := fun A B =>
    ZFSet.ext fun z => by simp [ZFSet.mem_union, or_comm]
  UnionAssociative := fun A B C =>
    ZFSet.ext fun z => by simp [ZFSet.mem_union, or_assoc]
  EmptyUnion := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_union, ZFSet.notMem_empty]
  UnionEmpty := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_union, ZFSet.notMem_empty]
  UnionIdempotent := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_union]
  UnionMonotone := fun A₁ A₂ B₁ B₂ hA hB =>
    ZFSet.subset_def.mpr fun z hz => by
      rcases ZFSet.mem_union.mp hz with h | h
      · exact ZFSet.mem_union.mpr (Or.inl (ZFSet.subset_def.mp hA h))
      · exact ZFSet.mem_union.mpr (Or.inr (ZFSet.subset_def.mp hB h))
  SubsetIffUnionEqRight := fun A B => by
    constructor
    · intro h
      exact ZFSet.ext fun z => by
        rw [ZFSet.mem_union]
        exact ⟨fun hz => hz.elim (fun h1 => ZFSet.subset_def.mp h h1) id,
          Or.inr⟩
    · intro h
      exact ZFSet.subset_def.mpr fun z hz => by
        rw [← h, ZFSet.mem_union]
        exact Or.inl hz

instance : IntersectionLaws ZFSet where
  IntersectionCommutative := fun A B =>
    ZFSet.ext fun z => by simp [ZFSet.mem_inter, and_comm]
  IntersectionAssociative := fun A B C =>
    ZFSet.ext fun z => by simp [ZFSet.mem_inter, and_assoc]
  EmptyIntersection := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_inter, ZFSet.notMem_empty]
  IntersectionEmpty := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_inter, ZFSet.notMem_empty]
  IntersectionIdempotent := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_inter]
  IntersectionMonotone := fun A₁ A₂ B₁ B₂ hA hB =>
    ZFSet.subset_def.mpr fun z hz => by
      have h := ZFSet.mem_inter.mp hz
      exact ZFSet.mem_inter.mpr
        ⟨ZFSet.subset_def.mp hA h.1, ZFSet.subset_def.mp hB h.2⟩
  SubsetIffIntersectionEqLeft := fun A B => by
    constructor
    · intro h
      exact ZFSet.ext fun z => by
        rw [ZFSet.mem_inter]
        exact ⟨And.left, fun hz => ⟨hz, ZFSet.subset_def.mp h hz⟩⟩
    · intro h
      exact ZFSet.subset_def.mpr fun z hz => by
        rw [← h] at hz
        exact (ZFSet.mem_inter.mp hz).2

instance : DistributivityLaws ZFSet where
  IntersectionDistributesOverUnion := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_inter, ZFSet.mem_union] <;> tauto
  UnionDistributesOverIntersection := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_inter, ZFSet.mem_union] <;> tauto
  AbsorptionUnionIntersection := fun A B =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_inter, ZFSet.mem_union] <;> tauto
  AbsorptionIntersectionUnion := fun A B =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_inter, ZFSet.mem_union] <;> tauto

instance : SubsetLaws ZFSet where
  SubsetReflexive := fun A => le_refl A
  SubsetTransitive := fun _ _ _ h1 h2 => le_trans h1 h2
  SetEqualityIffMutualSubset := fun A B =>
    ⟨fun h => h ▸ ⟨le_refl A, le_refl A⟩, fun h => le_antisymm h.1 h.2⟩

instance : DifferenceLaws ZFSet where
  DifferenceMonotoneLeft := fun A₁ A₂ B h =>
    ZFSet.subset_def.mpr fun z hz => by
      rw [ZFSet.mem_sdiff] at hz ⊢
      exact ⟨ZFSet.subset_def.mp h hz.1, hz.2⟩
  DifferenceAntitoneRight := fun A B₁ B₂ h =>
    ZFSet.subset_def.mpr fun z hz => by
      rw [ZFSet.mem_sdiff] at hz ⊢
      exact ⟨hz.1, fun hzB => hz.2 (ZFSet.subset_def.mp h hzB)⟩
  DifferenceEmpty := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_sdiff, ZFSet.notMem_empty]
  EmptyDifference := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_sdiff, ZFSet.notMem_empty]
  DifferenceSelf := fun A =>
    ZFSet.ext fun z => by simp [ZFSet.mem_sdiff, ZFSet.notMem_empty]
  DifferenceUnion := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_sdiff, ZFSet.mem_union, ZFSet.mem_inter] <;> tauto
  DifferenceIntersection := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_sdiff, ZFSet.mem_union, ZFSet.mem_inter] <;> tauto
  UnionDifferenceDistributes := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_sdiff, ZFSet.mem_union] <;> tauto
  IntersectionDifferenceDistributes := fun A B C =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_sdiff, ZFSet.mem_inter] <;> tauto
  DifferenceSubsetLeft := fun A B =>
    ZFSet.subset_def.mpr fun z hz => (ZFSet.mem_sdiff.mp hz).1
  DifferenceDisjointRight := fun A B =>
    ZFSet.ext fun z => by
      simp [ZFSet.mem_inter, ZFSet.mem_sdiff, ZFSet.notMem_empty] <;> tauto

                                                                        
                                                                     
                                                                  

   
                                                                                            

             

       
                                                  
                  
                                                 
   
  
theorem symmetricDifference_eq_union_sdiff_inter :
    ∀ A B : ZFSet,
      SymmetricDifference A B = (A ∪ B) \ (A ∩ B) := by
  sorry

   
                                                            

             

       
                                  
                  
                                                       
   
  
theorem symmetricDifference_comm :
    ∀ A B : ZFSet,
      SymmetricDifference A B = SymmetricDifference B A := by
  sorry

   
                                                              

             

       
                                   
                    
                                                       
                                                       
   
  
theorem symmetricDifference_assoc :
    ∀ A B C : ZFSet,
      SymmetricDifference (SymmetricDifference A B) C =
        SymmetricDifference A (SymmetricDifference B C) := by
  sorry

   
                                                              

             

       
                                   
                                                      
   
  
theorem symmetricDifference_empty :
    ∀ A : ZFSet, SymmetricDifference A (∅ : ZFSet) = A := by
  sorry

   
                                                              

             

       
                                   
                                                      
   
  
theorem empty_symmetricDifference :
    ∀ A : ZFSet, SymmetricDifference (∅ : ZFSet) A = A := by
  sorry

   
                                                            

             

       
                                  
                                                      
   
  
theorem symmetricDifference_self :
    ∀ A : ZFSet, SymmetricDifference A A = (∅ : ZFSet) := by
  sorry

   
                                                                            

             

       
                                          
                                                                
   
  
theorem symmetricDifference_eq_empty_iff :
    ∀ A B : ZFSet, SymmetricDifference A B = (∅ : ZFSet) ↔ A = B := by
  sorry

   
                                                                            

             

       
                                          
                                                  
   
  
theorem symmetricDifference_subset_union :
    ∀ A B : ZFSet, SymmetricDifference A B ⊆ A ∪ B := by
  sorry

instance : SymmDiffLaws ZFSet where
  SymmetricDifferenceAsUnionDifferences := fun A B => rfl
  SymmetricDifferenceAsUnionDifferenceIntersection :=
    symmetricDifference_eq_union_sdiff_inter
  SymmetricDifferenceCommutative := symmetricDifference_comm
  SymmetricDifferenceAssociative := symmetricDifference_assoc
  SymmetricDifferenceEmpty := symmetricDifference_empty
  EmptySymmetricDifference := empty_symmetricDifference
  SymmetricDifferenceSelf := symmetricDifference_self
  SymmetricDifferenceEqEmptyIff := symmetricDifference_eq_empty_iff
  SymmetricDifferenceSubsetUnion := symmetricDifference_subset_union

   
                                                

             

       
                                                               
                                                         
   
  
theorem mem_countableUnion {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableUnion family ↔ ∃ index, x ∈ family index := by
  sorry

   
                                                              

             

       
                                                                      
                                                                
   
  
theorem mem_countableIntersection {family : Nat → ZFSet} {x : ZFSet} :
    x ∈ CountableIntersection family ↔ ∀ index, x ∈ family index := by
  sorry

                                                                       
                                                                         
                                                                 
instance : CollectionMembershipLaws ZFSet ZFSet ZFSet where
  CollectionUnionMembership := fun _ _ => ZFSet.mem_sUnion
  CollectionIntersectionMembership := fun _ _ h => ZFSet.mem_sInter h

                                                                   
                                                                         
                                                                        
instance : CountableMembershipLaws ZFSet ZFSet where
  CountableUnionMembership := fun _ _ => mem_countableUnion
  CountableIntersectionMembership := fun _ _ => mem_countableIntersection

end LRA.Set.MathlibZFSet
