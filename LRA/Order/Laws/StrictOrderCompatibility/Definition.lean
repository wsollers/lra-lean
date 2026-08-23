namespace LRA.Order

universe u

                                                                         
class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : forall a b : R, a < b <-> a <= b /\ Not (b <= a)

section Wrappers

variable {R : Type u}

theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    forall a b : R, a < b <-> a <= b /\ Not (b <= a) := by
  sorry

end Wrappers

end LRA.Order
