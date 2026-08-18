namespace LRA.Order

universe u

/-- Native partial-order law certificate over Lean's `LE` machine. -/
class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : forall a : R, a <= a
  LeAntisymm : forall a b : R, a <= b -> b <= a -> a = b
  LeTrans : forall a b c : R, a <= b -> b <= c -> a <= c

section Wrappers

variable {R : Type u}

theorem LeRefl [LE R] [PartialOrderLaws R] : forall a : R, a <= a :=
  PartialOrderLaws.LeRefl

theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    forall a b : R, a <= b -> b <= a -> a = b :=
  PartialOrderLaws.LeAntisymm

theorem LeTrans [LE R] [PartialOrderLaws R] :
    forall a b c : R, a <= b -> b <= c -> a <= c :=
  PartialOrderLaws.LeTrans

end Wrappers

end LRA.Order
