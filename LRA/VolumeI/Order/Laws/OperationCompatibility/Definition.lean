namespace LRA.Order

universe u

/-!
Compatibility laws between native order machines and operations.
-/

class AdditionRespectsOrderLaws (R : Type u) [Add R] [LE R] : Prop where
  AddLeAddLeft : forall a b : R, a <= b -> forall c : R, c + a <= c + b
  AddLeAddRight : forall a b : R, a <= b -> forall c : R, a + c <= b + c

class MultiplicationRespectsOrderLaws (R : Type u)
    [Mul R] [LE R] [OfNat R 0] : Prop where
  MulNonneg : forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b

def StrictlyPreservesRightTranslation {R : Type u}
    (relation : R -> R -> Prop)
    (operation : R -> R -> R) : Prop :=
  forall first second translation,
    relation first second ->
    relation (operation first translation) (operation second translation)

def PreservesPositiveRightMultiplication {R : Type u}
    (strictOrderRelation : R -> R -> Prop)
    (mul : R -> R -> R)
    (zero : R) : Prop :=
  forall first second positive,
    strictOrderRelation zero positive ->
    strictOrderRelation first second ->
    strictOrderRelation (mul first positive) (mul second positive)

section Wrappers

variable {R : Type u}

theorem AddLeAddLeft [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, c + a <= c + b :=
  AdditionRespectsOrderLaws.AddLeAddLeft

theorem AddLeAddRight [Add R] [LE R] [AdditionRespectsOrderLaws R] :
    forall a b : R, a <= b -> forall c : R, a + c <= b + c :=
  AdditionRespectsOrderLaws.AddLeAddRight

theorem MulNonneg [Mul R] [LE R] [OfNat R 0]
    [MultiplicationRespectsOrderLaws R] :
    forall a b : R, 0 <= a -> 0 <= b -> 0 <= a * b :=
  MultiplicationRespectsOrderLaws.MulNonneg

end Wrappers

end LRA.Order
