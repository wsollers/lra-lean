import LRA.VolumeI.Sets.SetDefinitions

open LRA.VolumeI.Sets

namespace LRA.VolumeI.Sets

variable {α : Type}

theorem Intersection_Distributes_Over_Union (A B C : Set α) :
  intersection A (union B C) = union (intersection A B) (intersection A C) := by
  apply axiom_set_extension
  intro x
  simp only [intersection, union, memberOf]
  constructor

  · intro hypothesis
    obtain ⟨x_in_A, x_in_union⟩ := hypothesis
    cases x_in_union with
    | inl x_in_B =>
      exact Or.inl ⟨x_in_A, x_in_B⟩
    | inr x_in_C =>
      exact Or.inr ⟨x_in_A, x_in_C⟩

  · intro hypothesis
    cases hypothesis with
    | inl x_in_A_and_B =>
      obtain ⟨x_in_A, x_in_B⟩ := x_in_A_and_B
      exact ⟨x_in_A, Or.inl x_in_B⟩
    | inr x_in_A_and_C =>
      obtain ⟨x_in_A, x_in_C⟩ := x_in_A_and_C
      exact ⟨x_in_A, Or.inr x_in_C⟩

end LRA.VolumeI.Sets
