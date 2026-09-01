import LRA.Set.Constructions.ZFCSet.Axioms.Common
import LRA.Set.Constructions.ZFCSet.Axioms.EmptySet.Definitions

namespace LRA.Set.Constructions.ZFCSet.Axioms

def IsSuccessorOf (x successor : Set) : Prop :=
  ∀ w : Set, w ∈ successor ↔ w ∈ x ∨ w = x

def IsInductiveSet (A : Set) : Prop :=
  (∃ empty : Set, empty ∈ A ∧ IsEmptySet empty) ∧
  ∀ x : Set, x ∈ A → ∃ successor : Set, successor ∈ A ∧ IsSuccessorOf x successor

end LRA.Set.Constructions.ZFCSet.Axioms
