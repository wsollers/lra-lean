-- Proof-ready dyadic representation core.

import LRA.VolumeII.Reals.Cauchy

namespace LRA.VolumeII.Reals.DyadicCore

open NumberSystems

inductive Digit where
  | zero
  | one
  deriving DecidableEq

abbrev FractionalDigits := Nat → Digit

def IsCanonical (digits : FractionalDigits) : Prop :=
  ¬ ∃ threshold, ∀ index, threshold ≤ index → digits index = Digit.one

structure Expansion where
  negative : Bool
  integerPart : Nat
  fractionalDigits : FractionalDigits
  canonical : IsCanonical fractionalDigits

structure Context where
  rational_model : RationalModel
  absolute_value_data : Cauchy.AbsoluteValueData rational_model
  digitValue : Digit → rational_model.signature.carrier
  powerOfTwo : Nat → rational_model.signature.carrier
  finiteSum :
    (Nat → rational_model.signature.carrier) → Nat → rational_model.signature.carrier
  integerValue : Nat → rational_model.signature.carrier
  rationalEmbedding :
    rational_model.signature.carrier →
      Cauchy.Carrier rational_model absolute_value_data
  cauchyAddition :
    Cauchy.Carrier rational_model absolute_value_data →
    Cauchy.Carrier rational_model absolute_value_data →
    Cauchy.Carrier rational_model absolute_value_data
  cauchyNegation :
    Cauchy.Carrier rational_model absolute_value_data →
    Cauchy.Carrier rational_model absolute_value_data

variable (context : Context)

abbrev RealCarrier :=
  Cauchy.Carrier context.rational_model context.absolute_value_data

def partialSum (expansion : Expansion) (bound : Nat) :
    context.rational_model.signature.carrier :=
  context.rational_model.signature.addition
    (context.integerValue expansion.integerPart)
    (context.finiteSum
      (fun index =>
        context.rational_model.signature.multiplication
          (context.digitValue (expansion.fractionalDigits index))
          (context.rational_model.signature.inverse
            (context.powerOfTwo (index + 1))))
      bound)

theorem partial_sums_are_cauchy (expansion : Expansion) :
    Cauchy.is_cauchy
      context.rational_model
      context.absolute_value_data
      (partialSum context expansion) := by
  sorry

def unsignedValue (expansion : Expansion) : RealCarrier context :=
  Quotient.mk _
    ⟨partialSum context expansion,
      partial_sums_are_cauchy context expansion⟩

def value (expansion : Expansion) : RealCarrier context :=
  if expansion.negative then
    context.cauchyNegation (unsignedValue context expansion)
  else
    unsignedValue context expansion

theorem representation_exists (real_value : RealCarrier context) :
    ∃ expansion, value context expansion = real_value := by
  sorry

theorem value_is_injective :
    ∀ first second,
      value context first = value context second → first = second := by
  sorry

noncomputable def expansionOf (real_value : RealCarrier context) : Expansion :=
  Classical.choose (representation_exists context real_value)

theorem value_expansionOf (real_value : RealCarrier context) :
    value context (expansionOf context real_value) = real_value :=
  Classical.choose_spec (representation_exists context real_value)

noncomputable def equivalence : Expansion ≃ RealCarrier context where
  toFun := value context
  invFun := expansionOf context
  left_inv := by
    intro expansion
    apply value_is_injective context
    exact value_expansionOf context (value context expansion)
  right_inv := value_expansionOf context

theorem terminating_tail_ambiguity_is_removed :
    ∀ first second,
      value context first = value context second → first = second := by
  exact value_is_injective context

end LRA.VolumeII.Reals.DyadicCore
