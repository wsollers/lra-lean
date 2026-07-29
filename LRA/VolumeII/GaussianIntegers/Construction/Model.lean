-- LRA/VolumeII/GaussianIntegers/Construction/Model.lean
-- Gaussian-integer construction over the active integer model.

import LRA.VolumeI.Algebra.Models
import LRA.VolumeII.Integers.Construction

namespace LRA.VolumeII.GaussianIntegers

open LRA.VolumeI.Algebra.Models

/-!
Volume II label: gaussian-integer-construction
Lean module: LRA.VolumeII.GaussianIntegers.Construction.Model
Verification status: definitions accepted; algebraic proofs pending

The Gaussian integers are represented as pairs of active integers, with
addition and multiplication given by the usual coordinate formulas for
`a + bi`.
-/

abbrev BaseIntegerModel : IntegerModel :=
  LRA.VolumeII.Integers.Active.integerNumberSystemModel

abbrev BaseIntegerCarrier : Type :=
  BaseIntegerModel.signature.carrier

/-- A Gaussian integer over the active integer model. -/
structure GaussianInteger where
  realPart : BaseIntegerCarrier
  imaginaryPart : BaseIntegerCarrier

/-- The Gaussian integer `0 + 0i`. -/
def GaussianZero : GaussianInteger where
  realPart := BaseIntegerModel.signature.zero
  imaginaryPart := BaseIntegerModel.signature.zero

/-- The Gaussian integer `1 + 0i`. -/
def GaussianOne : GaussianInteger where
  realPart := BaseIntegerModel.signature.one
  imaginaryPart := BaseIntegerModel.signature.zero

/-- The Gaussian integer `0 + 1i`. -/
def GaussianImaginaryUnit : GaussianInteger where
  realPart := BaseIntegerModel.signature.zero
  imaginaryPart := BaseIntegerModel.signature.one

/-- Coordinatewise Gaussian-integer addition. -/
def GaussianAddition
    (first second : GaussianInteger) : GaussianInteger where
  realPart :=
    BaseIntegerModel.signature.addition first.realPart second.realPart
  imaginaryPart :=
    BaseIntegerModel.signature.addition first.imaginaryPart second.imaginaryPart

/-- Coordinatewise additive inverse. -/
def GaussianNegation
    (value : GaussianInteger) : GaussianInteger where
  realPart := BaseIntegerModel.signature.negation value.realPart
  imaginaryPart := BaseIntegerModel.signature.negation value.imaginaryPart

/-- Gaussian-integer subtraction. -/
def GaussianSubtraction
    (first second : GaussianInteger) : GaussianInteger :=
  GaussianAddition first (GaussianNegation second)

/-- Gaussian-integer multiplication: `(a + bi)(c + di) = (ac - bd) + (ad + bc)i`. -/
def GaussianMultiplication
    (first second : GaussianInteger) : GaussianInteger where
  realPart :=
    BaseIntegerModel.signature.addition
      (BaseIntegerModel.signature.multiplication first.realPart second.realPart)
      (BaseIntegerModel.signature.negation
        (BaseIntegerModel.signature.multiplication
          first.imaginaryPart second.imaginaryPart))
  imaginaryPart :=
    BaseIntegerModel.signature.addition
      (BaseIntegerModel.signature.multiplication first.realPart second.imaginaryPart)
      (BaseIntegerModel.signature.multiplication first.imaginaryPart second.realPart)

/-- Gaussian conjugation: `a + bi` maps to `a - bi`. -/
def GaussianConjugation
    (value : GaussianInteger) : GaussianInteger where
  realPart := value.realPart
  imaginaryPart := BaseIntegerModel.signature.negation value.imaginaryPart

/-- Squared Gaussian norm: `a^2 + b^2`. -/
def GaussianNormSquared
    (value : GaussianInteger) : BaseIntegerCarrier :=
  BaseIntegerModel.signature.addition
    (BaseIntegerModel.signature.multiplication value.realPart value.realPart)
    (BaseIntegerModel.signature.multiplication value.imaginaryPart value.imaginaryPart)

/-- The Gaussian integers as a first-order arithmetic-ring operation bundle. -/
def GaussianArithmeticRingSignature : ArithmeticRingSignature where
  carrier := GaussianInteger
  zero := GaussianZero
  one := GaussianOne
  addition := GaussianAddition
  multiplication := GaussianMultiplication

/-- The Gaussian integers as a first-order model of the arithmetic ring language. -/
def GaussianArithmeticRingModel :
    LRA.VolumeI.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  BuildArithmeticRingModel GaussianArithmeticRingSignature

/-- Gaussian addition is associative. -/
theorem GaussianAdditionIsAssociative :
    LRA.VolumeI.Operations.Associative GaussianAddition := by
  sorry

/-- Gaussian addition is commutative. -/
theorem GaussianAdditionIsCommutative :
    LRA.VolumeI.Operations.Commutative GaussianAddition := by
  sorry

/-- Gaussian zero is the additive identity. -/
theorem GaussianZeroIsAdditiveIdentity :
    LRA.VolumeI.Operations.Identity GaussianAddition GaussianZero := by
  sorry

/-- Gaussian negation gives additive inverses. -/
theorem GaussianNegationIsAdditiveInverse :
    LRA.VolumeI.Operations.Inverse GaussianAddition GaussianZero GaussianNegation := by
  sorry

/-- Gaussian multiplication is associative. -/
theorem GaussianMultiplicationIsAssociative :
    LRA.VolumeI.Operations.Associative GaussianMultiplication := by
  sorry

/-- Gaussian multiplication is commutative. -/
theorem GaussianMultiplicationIsCommutative :
    LRA.VolumeI.Operations.Commutative GaussianMultiplication := by
  sorry

/-- Gaussian one is the multiplicative identity. -/
theorem GaussianOneIsMultiplicativeIdentity :
    LRA.VolumeI.Operations.Identity GaussianMultiplication GaussianOne := by
  sorry

/-- Gaussian multiplication distributes over Gaussian addition. -/
theorem GaussianMultiplicationDistributesOverAddition :
    LRA.VolumeI.Operations.Distributive GaussianMultiplication GaussianAddition := by
  sorry

/-- The Gaussian imaginary unit squares to negative one. -/
theorem GaussianImaginaryUnitSquared :
    GaussianMultiplication GaussianImaginaryUnit GaussianImaginaryUnit =
      GaussianNegation GaussianOne := by
  sorry

end LRA.VolumeII.GaussianIntegers
