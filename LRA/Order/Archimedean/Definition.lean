namespace LRA.Order

universe u

def IteratedSelfSum {R : Type u} [Add R] : Nat → R → R
  | 0, x => x
  | n + 1, x => IteratedSelfSum n x + x

class ArchimedeanLaw (R : Type u)
    [Add R] [LT R] [OfNat R 0] : Prop where
  ExistsMultipleExceeding :
    forall x y : R, 0 < x -> exists n : Nat, y < IteratedSelfSum n x

section Wrappers

variable {R : Type u}

theorem ExistsMultipleExceeding [Add R] [LT R] [OfNat R 0] [ArchimedeanLaw R] :
    forall x y : R, 0 < x -> exists n : Nat, y < IteratedSelfSum n x := by
  sorry

end Wrappers

end LRA.Order
