import LRA.Identity.Interface.ModelTheory.Theory

namespace LRA.Identity

universe u

theorem NativeEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier := by
  constructor
  . -- reflivity
    intro arbitrary
    rfl

  . --leibniz
    intro x
    intro y
    intro hypothesis
    intro arbitaryProperty
    rw [hypothesis]


theorem MathlibEqualitySatisfiesEqualityTheory (Carrier : Type u) :
    EqualityTheory Carrier :=
  NativeEqualitySatisfiesEqualityTheory Carrier

end LRA.Identity
