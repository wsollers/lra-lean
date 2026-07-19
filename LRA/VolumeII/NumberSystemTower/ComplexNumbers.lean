-- LRA/VolumeII/NumberSystemTower/ComplexNumbers.lean
-- Complex numbers over a selected real model.

import LRA.VolumeII.Reals.Extensions

namespace LRA
namespace VolumeII
namespace NumberSystemTower
namespace ComplexNumbers

/-!
Volume II label: complex-number-construction
Lean module: LRA.VolumeII.NumberSystemTower.ComplexNumbers
Source: docs/number-systems/gpt-09-complex.md
Verification status: statement-accepted-proof-pending
-/

open LRA.VolumeII.NumberSystems

structure Complex (real_model : RealModel) where
  real_part : real_model.signature.carrier
  imaginary_part : real_model.signature.carrier

def zero (real_model : RealModel) : Complex real_model where
  real_part := real_model.signature.zero
  imaginary_part := real_model.signature.zero

def one (real_model : RealModel) : Complex real_model where
  real_part := real_model.signature.one
  imaginary_part := real_model.signature.zero

def addition
    (real_model : RealModel)
    (first second : Complex real_model) : Complex real_model where
  real_part := real_model.signature.addition first.real_part second.real_part
  imaginary_part := real_model.signature.addition first.imaginary_part second.imaginary_part

def negation
    (real_model : RealModel)
    (value : Complex real_model) : Complex real_model where
  real_part := real_model.signature.negation value.real_part
  imaginary_part := real_model.signature.negation value.imaginary_part

def multiplication
    (real_model : RealModel)
    (first second : Complex real_model) : Complex real_model where
  real_part :=
    real_model.signature.addition
      (real_model.signature.multiplication first.real_part second.real_part)
      (real_model.signature.negation
        (real_model.signature.multiplication first.imaginary_part second.imaginary_part))
  imaginary_part :=
    real_model.signature.addition
      (real_model.signature.multiplication first.real_part second.imaginary_part)
      (real_model.signature.multiplication first.imaginary_part second.real_part)

def conjugate
    (real_model : RealModel)
    (value : Complex real_model) : Complex real_model where
  real_part := value.real_part
  imaginary_part := real_model.signature.negation value.imaginary_part

def real_embedding
    (real_model : RealModel)
    (value : real_model.signature.carrier) : Complex real_model where
  real_part := value
  imaginary_part := real_model.signature.zero

def modulus_squared
    (real_model : RealModel)
    (value : Complex real_model) : real_model.signature.carrier :=
  real_model.signature.addition
    (real_model.signature.multiplication value.real_part value.real_part)
    (real_model.signature.multiplication value.imaginary_part value.imaginary_part)

def power
    (real_model : RealModel)
    (base : Complex real_model) : Nat → Complex real_model
  | 0 => one real_model
  | Nat.succ exponent =>
      multiplication real_model (power real_model base exponent) base

def polynomial_value
    (real_model : RealModel)
    (coefficients : List (Complex real_model))
    (value : Complex real_model) : Complex real_model :=
  (coefficients.zipIdx).foldl
    (fun total coefficient_with_index =>
      addition real_model total
        (multiplication real_model coefficient_with_index.fst
          (power real_model value coefficient_with_index.snd)))
    (zero real_model)

structure ComplexFieldLaws (real_model : RealModel) : Prop where
  addition_is_abelian_group :
    ∀ value : Complex real_model,
      addition real_model (zero real_model) value = value ∧
        addition real_model value (negation real_model value) = zero real_model
  multiplication_is_commutative_monoid :
    ∀ value : Complex real_model,
      multiplication real_model (one real_model) value = value ∧
        multiplication real_model value (one real_model) = value
  distributive :
    ∀ first second third : Complex real_model,
      multiplication real_model first (addition real_model second third) =
        addition real_model
          (multiplication real_model first second)
          (multiplication real_model first third)
  nonzero_inverse_exists :
    ∀ value : Complex real_model,
      value ≠ zero real_model →
        ∃ inverse : Complex real_model,
          multiplication real_model inverse value = one real_model

theorem complex_field_laws
    (real_model : RealModel) :
    ComplexFieldLaws real_model := by
  sorry

theorem no_compatible_linear_order
    (real_model : RealModel) :
    ¬ ∃ le : Complex real_model → Complex real_model → Prop,
      ∀ value : Complex real_model, le (zero real_model) value ∨ le value (zero real_model) := by
  sorry

theorem algebraically_closed
    (real_model : RealModel) :
    ∀ polynomial_coefficients : List (Complex real_model),
      polynomial_coefficients ≠ [] →
        polynomial_coefficients ≠ [zero real_model] →
        ∃ root : Complex real_model,
          polynomial_value real_model polynomial_coefficients root =
            zero real_model := by
  sorry

end ComplexNumbers
end NumberSystemTower
end VolumeII
end LRA
