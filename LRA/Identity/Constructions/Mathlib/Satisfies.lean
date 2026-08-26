import LRA.Identity.Interface.ModelTheory.Theory

namespace LRA.Identity

universe u

theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier := by
  sorry

theorem MathlibEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier :=
  NativeEqualitySatisfiesEqualityTheory Carrier

end LRA.Identity
