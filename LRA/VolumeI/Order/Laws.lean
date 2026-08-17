namespace LRA.Order

universe u

/-!
Native order-law certificates over Lean's `LE` and `LT` machines.

The relation-level concepts in the surrounding Order chapter remain the
mathematical source of truth. These classes are the executable certificate
surface used by concrete carriers and algebraic structures.
-/

class PartialOrderLaws (R : Type u) [LE R] : Prop where
  LeRefl : ∀ a : R, a ≤ a
  LeAntisymm : ∀ a b : R, a ≤ b → b ≤ a → a = b
  LeTrans : ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c

class TotalOrderLaw (R : Type u) [LE R] : Prop where
  LeTotal : ∀ a b : R, a ≤ b ∨ b ≤ a

class abbrev LinearOrderLaws (R : Type u) [LE R] : Prop :=
  PartialOrderLaws R, TotalOrderLaw R

class StrictOrderCompatibilityLaw (R : Type u) [LT R] [LE R] : Prop where
  LtIffLeNotLe : ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a

class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b
  AddLeAddRight : ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c

class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b

def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R → R → Prop)
    (operation : R → R → R) : Prop :=
  ∀ first second translation,
    relation first second →
    relation (operation first translation) (operation second translation)

def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R → R → Prop)
    (mul : R → R → R)
    (zero : R) : Prop :=
  ∀ first second positive,
    strictOrderRelation zero positive →
    strictOrderRelation first second →
    strictOrderRelation (mul first positive) (mul second positive)

class DenseOrderLaw (R : Type u) [LT R] : Prop where
  ExistsBetween :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b

class OrderDiscretenessLaw (R : Type u)
    [LT R] [Add R] [OfNat R 1] : Prop where
  NoStrictBetweenAddOne :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1

section Wrappers

variable {R : Type u}

theorem LeRefl [LE R] [PartialOrderLaws R] : ∀ a : R, a ≤ a :=
  PartialOrderLaws.LeRefl

theorem LeAntisymm [LE R] [PartialOrderLaws R] :
    ∀ a b : R, a ≤ b → b ≤ a → a = b :=
  PartialOrderLaws.LeAntisymm

theorem LeTrans [LE R] [PartialOrderLaws R] :
    ∀ a b c : R, a ≤ b → b ≤ c → a ≤ c :=
  PartialOrderLaws.LeTrans

theorem LeTotal [LE R] [TotalOrderLaw R] :
    ∀ a b : R, a ≤ b ∨ b ≤ a :=
  TotalOrderLaw.LeTotal

theorem LtIffLeNotLe [LT R] [LE R] [StrictOrderCompatibilityLaw R] :
    ∀ a b : R, a < b ↔ a ≤ b ∧ ¬ b ≤ a :=
  StrictOrderCompatibilityLaw.LtIffLeNotLe

theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, c + a ≤ c + b :=
  AdditionRespectsOrderLaws.AddLeAddLeft

theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    ∀ a b : R, a ≤ b → ∀ c : R, a + c ≤ b + c :=
  AdditionRespectsOrderLaws.AddLeAddRight

theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    ∀ a b : R, 0 ≤ a → 0 ≤ b → 0 ≤ a * b :=
  MultiplicationRespectsOrderLaws.MulNonneg

theorem ExistsBetween [LT R] [DenseOrderLaw R] :
    ∀ a b : R, a < b → ∃ middle : R, a < middle ∧ middle < b :=
  DenseOrderLaw.ExistsBetween

theorem NoStrictBetweenAddOne [LT R] [Add R] [OfNat R 1]
    [OrderDiscretenessLaw R] :
    ∀ a : R, ¬ ∃ middle : R, a < middle ∧ middle < a + 1 :=
  OrderDiscretenessLaw.NoStrictBetweenAddOne

end Wrappers

end LRA.Order
