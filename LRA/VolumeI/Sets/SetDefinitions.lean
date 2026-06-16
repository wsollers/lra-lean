namespace LRA.VolumeI.Sets

def Set (α : Type) := α → Prop

def memberOf (x : α) (s : Set α) : Prop := s x

def intersection (s1 s2 : Set α) : Set α :=
  fun x => memberOf x s1 ∧ memberOf x s2

def union (s1 s2 : Set α) : Set α :=
  fun x => memberOf x s1 ∨ memberOf x s2

theorem axiom_set_extension {α : Type} (A B : Set α) :
    (∀ x, memberOf x A ↔ memberOf x B) → A = B :=
  fun h => funext (fun x => propext (h x))

def emptySet (α : Type) : Set α := fun _ => False

end LRA.VolumeI.Sets
