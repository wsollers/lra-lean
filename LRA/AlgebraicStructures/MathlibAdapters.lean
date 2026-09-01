import Mathlib.Algebra.Field.Defs
import LRA.AlgebraicStructures.CommutativeRing.Interface.Laws.Definition
import LRA.AlgebraicStructures.Field.Interface.Laws.Definition
import LRA.AlgebraicStructures.MathlibBridge

namespace LRA.AlgebraicStructures

universe u

/--
`toMathlibCommRing` TODO

Predicate logic:

  def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add

Predicate logic (unfolded):

  def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[reducible] def toMathlibCommRing (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [OfNat R 0] [OfNat R 1]
    [CommutativeRingLaws R] [SubtractionCompatibilityLaw R] :
    CommRing R where
  add := (· + ·)
  add_assoc := AddAssociative
  zero := 0
  zero_add := ZeroAdd
  add_zero := AddZero
  nsmul := nsmulRec
  neg := (- ·)
  sub := (· - ·)
  sub_eq_add_neg := SubEqAddNeg
  zsmul := zsmulRec
  neg_add_cancel := NegAddCancel
  add_comm := AddCommutative
  mul := (· * ·)
  left_distrib := LeftDistributive
  right_distrib := RightDistributive
  zero_mul := ZeroMul
  mul_zero := MulZero
  mul_assoc := MulAssociative
  one := 1
  one_mul := OneMul
  mul_one := MulOne
  npow := npowRec
  mul_comm := MulCommutative

/--
`toMathlibField` TODO

Predicate logic:

  noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R

Predicate logic (unfolded):

  noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: unfold

-/
@[reducible] noncomputable def toMathlibField (R : Type u)
    [Add R] [Mul R] [Neg R] [Sub R] [Inv R] [Div R]
    [OfNat R 0] [OfNat R 1]
    [FieldLaws R] [SubtractionCompatibilityLaw R]
    [DivisionCompatibilityLaw R] : Field R :=
  have inverse_cancels : ∀ a : R, a ≠ 0 → a * a⁻¹ = 1 := MulInvCancel
  have inverse_of_zero : (0 : R)⁻¹ = 0 := InvZero
  have division_compatible : ∀ a b : R, a / b = a * b⁻¹ := DivEqMulInv
  have one_is_not_zero : (1 : R) ≠ 0 := OneNeZero
  { toMathlibCommRing R with
    inv := (·⁻¹)
    div := (· / ·)
    div_eq_mul_inv := division_compatible
    zpow := zpowRec
    exists_pair_ne := ⟨1, 0, one_is_not_zero⟩
    mul_inv_cancel := inverse_cancels
    inv_zero := inverse_of_zero
    nnqsmul := _
    qsmul := _ }

example : CommRing Int := toMathlibCommRing Int
noncomputable example : Field Rat := toMathlibField Rat

end LRA.AlgebraicStructures
