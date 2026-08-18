namespace LRA.Order

universe u

/-!
Native discreteness law certificates over Lean's `LT`, `Add`, and `1`
machines.

This certificate captures the integer-style statement that nothing lies
strictly between `a` and `a + 1`.
-/

class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1)

section Wrappers

variable {R : Type u}

theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    forall a : R, Not (exists middle : R, a < middle /\ middle < a + 1) :=
  OrderDiscretenessLaw.NoStrictBetweenAddOne

end Wrappers

end LRA.Order
