import LRA.Identity.Interface.ModelTheory.LStructure

namespace LRA.Identity

universe u

def NativeEquality (Carrier : Type u) : Carrier -> Carrier -> Prop :=
  EqualityDiagonal Carrier

theorem NativeEqualityIsDiagonal (Carrier : Type u) :
    ∀ left right, NativeEquality Carrier left right ↔ left = right := by
  sorry

end LRA.Identity
