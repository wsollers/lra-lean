-- LRA/VolumeII/NaturalNumbers/PlaceValue.lean
-- Finite base-b representation of whole numbers.

import LRA.VolumeII.NaturalNumbers.Old.Divisibility

namespace LRA.VolumeII.NaturalNumbers.Old
namespace PlaceValue

/-!
Volume II label: place-value-representation
Lean module: LRA.VolumeII.NaturalNumbers.Old.PlaceValue
Source: docs/number-systems/gpt-01c-place-value-integers.md
Verification status: statement-accepted-proof-pending
-/

open LRA.VolumeII.WholeNumbers

variable (natural_data : NaturalArithmeticForWholeNumbers)

/--
**[Abbrev — Whole]**

Mathematical statement (Lean): `abbrev Whole`.
-/
abbrev Whole := Carrier natural_data

/--
**[Def — valid_base]**

Mathematical statement (Lean): `def valid_base (base : natural_data.peano.carrier) : Prop`.
-/
def valid_base (base : natural_data.peano.carrier) : Prop :=
  natural_data.strictOrder natural_data.peano.one base

/--
**[Def — is_digit]**

Mathematical statement (Lean): `def is_digit (base : natural_data.peano.carrier) (digit : Whole natural_data) : Prop`.
-/
def is_digit (base : natural_data.peano.carrier) (digit : Whole natural_data) : Prop :=
  valid_base natural_data base ∧
    (strictOrder natural_data digit
      (naturalEmbedding natural_data base) ∨
      digit = zero natural_data)

/--
**[Structure — FiniteDigitSequence]**

Mathematical statement (Lean): `structure FiniteDigitSequence (base : natural_data.peano.carrier)`.
-/
structure FiniteDigitSequence (base : natural_data.peano.carrier) where
  digits : List (Whole natural_data)
  all_digits_are_valid : ∀ digit ∈ digits, is_digit natural_data base digit
  nonempty : digits ≠ []

/--
**[Def — canonical]**

Mathematical statement (Lean): `def canonical {base : natural_data.peano.carrier} (sequence : FiniteDigitSequence natural_data base) : Prop`.
-/
def canonical
    {base : natural_data.peano.carrier}
    (sequence : FiniteDigitSequence natural_data base) : Prop :=
  sequence.digits = [zero natural_data] ∨
    ∃ leading rest,
      sequence.digits = leading :: rest ∧
        leading ≠ zero natural_data

/--
**[Def — evaluates_to]**

Mathematical statement (Lean): `def evaluates_to {base : natural_data.peano.carrier} (sequence : FiniteDigitSequence natural_data base) (value : Whole natural_data) : Prop`.
-/
def evaluates_to
    {base : natural_data.peano.carrier}
    (sequence : FiniteDigitSequence natural_data base)
    (value : Whole natural_data) : Prop :=
  ∃ powers : List (Whole natural_data),
    powers.length = sequence.digits.length ∧
      value =
        List.foldl
          (addition natural_data)
          (zero natural_data)
          (List.zipWith (multiplication natural_data) sequence.digits powers)

/--
**[Theorem — base_representation_exists]**

Mathematical statement (Lean): `theorem base_representation_exists (base : natural_data.peano.carrier) (base_valid : valid_base natural_data base) (value : Whole natural_data) : ∃ sequence : FiniteDigitSequence natural_data base, canonical natural_data sequence ∧ evaluates_to natural_data...`.

*Proof status:* proof pending
-/
theorem base_representation_exists
    (base : natural_data.peano.carrier)
    (base_valid : valid_base natural_data base)
    (value : Whole natural_data) :
    ∃ sequence : FiniteDigitSequence natural_data base,
      canonical natural_data sequence ∧
        evaluates_to natural_data sequence value := by
  sorry

/--
**[Theorem — canonical_base_representation_unique]**

Mathematical statement (Lean): `theorem canonical_base_representation_unique (base : natural_data.peano.carrier) (base_valid : valid_base natural_data base) (value : Whole natural_data) (first second : FiniteDigitSequence natural_data base) (first_canonical : canonical natural_data first)...`.

*Proof status:* proof pending
-/
theorem canonical_base_representation_unique
    (base : natural_data.peano.carrier)
    (base_valid : valid_base natural_data base)
    (value : Whole natural_data)
    (first second : FiniteDigitSequence natural_data base)
    (first_canonical : canonical natural_data first)
    (second_canonical : canonical natural_data second)
    (first_value : evaluates_to natural_data first value)
    (second_value : evaluates_to natural_data second value) :
    first.digits = second.digits := by
  sorry

end PlaceValue
end LRA.VolumeII.NaturalNumbers.Old
