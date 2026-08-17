import LRA.VolumeI.Operations.Definition

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

/-- Left translation by a fixed element preserves a relation. -/
def LeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed left) (operation fixed right)

/-- Right translation by a fixed element preserves a relation. -/
def RightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation left fixed) (operation right fixed)

/-- Coordinatewise application of a binary operation preserves a relation. -/
def CoordinatewisePreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left₁ left₂ right₁ right₂,
    relation left₁ left₂ -> relation right₁ right₂ ->
      relation (operation left₁ right₁) (operation left₂ right₂)

/-- Left translation by a fixed element reverses a relation. -/
def LeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    relation left right -> relation (operation fixed right) (operation fixed left)

/-- Right translation by a fixed element reverses a relation. -/
def RightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    relation left right -> relation (operation right fixed) (operation left fixed)

/-- Positive right translations preserve a relation. -/
def PositiveRightTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    positive fixed -> relation left right ->
      relation (operation left fixed) (operation right fixed)

/-- Positive left translations preserve a relation. -/
def PositiveLeftTranslationPreservesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (positive : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    positive fixed -> relation left right ->
      relation (operation fixed left) (operation fixed right)

/-- Negative right translations reverse a relation. -/
def NegativeRightTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall left right fixed,
    negative fixed -> relation left right ->
      relation (operation right fixed) (operation left fixed)

/-- Negative left translations reverse a relation. -/
def NegativeLeftTranslationReversesRelation {Carrier : Type u}
    (relation : Carrier -> Carrier -> Prop)
    (negative : Carrier -> Prop)
    (operation : LRA.Operation.BinaryEndoOperation Carrier) : Prop :=
  forall fixed left right,
    negative fixed -> relation left right ->
      relation (operation fixed right) (operation fixed left)

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
