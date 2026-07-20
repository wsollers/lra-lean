-- LRA/VolumeII/NaturalNumbers/Divisibility.lean
-- Divisibility, Euclidean division, gcd, parity, congruence, and primes.

import LRA.VolumeII.WholeNumbers.Construction

namespace LRA
namespace VolumeII
namespace NaturalNumbers
namespace Divisibility

/-!
Volume II label: divisibility-and-euclidean-division
Lean module: LRA.VolumeII.NaturalNumbers.Divisibility
Source: docs/number-systems/gpt-01d-divisibility-division.md
Verification status: statement-accepted-proof-pending
-/

open LRA.VolumeII.PeanoSystems
open LRA.VolumeII.WholeNumbers

variable (natural_data : NaturalArithmeticForWholeNumbers)

abbrev Whole := Carrier natural_data

def divides (divisor dividend : Whole natural_data) : Prop :=
  ∃ quotient : Whole natural_data,
    multiplication natural_data divisor quotient = dividend

structure EuclideanDivision
    (dividend divisor : Whole natural_data)
    (divisor_nonzero : divisor ≠ zero natural_data) where
  quotient : Whole natural_data
  remainder : Whole natural_data
  division_identity :
    dividend =
    addition natural_data
        (multiplication natural_data divisor quotient)
        remainder
  remainder_is_smaller :
    strictOrder natural_data remainder divisor

theorem euclidean_division_exists_unique
    (dividend divisor : Whole natural_data)
    (divisor_nonzero : divisor ≠ zero natural_data) :
    ∃ division : EuclideanDivision natural_data dividend divisor divisor_nonzero,
      ∀ other : EuclideanDivision natural_data dividend divisor divisor_nonzero,
        other.quotient = division.quotient ∧
          other.remainder = division.remainder := by
  sorry

def congruent_mod
    (modulus first second : Whole natural_data) : Prop :=
  ∃ difference : Whole natural_data,
    first = addition natural_data second
      (multiplication natural_data modulus difference) ∨
    second = addition natural_data first
      (multiplication natural_data modulus difference)

def is_even (value : Whole natural_data) : Prop :=
  ∃ half : Whole natural_data,
    value =
      addition natural_data half half

def is_odd (value : Whole natural_data) : Prop :=
  ∃ previous : Whole natural_data,
    value = successor natural_data previous ∧ is_even natural_data previous

def is_greatest_common_divisor
    (candidate first second : Whole natural_data) : Prop :=
  divides natural_data candidate first ∧
    divides natural_data candidate second ∧
    ∀ common_divisor : Whole natural_data,
      divides natural_data common_divisor first →
      divides natural_data common_divisor second →
        divides natural_data common_divisor candidate

theorem gcd_exists_unique
    (first second : Whole natural_data)
    (not_both_zero :
      first ≠ zero natural_data ∨
        second ≠ zero natural_data) :
    ∃ gcd : Whole natural_data,
      is_greatest_common_divisor natural_data gcd first second ∧
        ∀ other : Whole natural_data,
          is_greatest_common_divisor natural_data other first second →
            other = gcd := by
  sorry

def relatively_prime (first second : Whole natural_data) : Prop :=
  is_greatest_common_divisor natural_data
    (one natural_data) first second

def prime (value : natural_data.peano.carrier) : Prop :=
  value ≠ natural_data.peano.one ∧
    ∀ divisor : natural_data.peano.carrier,
      divides natural_data
        (naturalEmbedding natural_data divisor)
        (naturalEmbedding natural_data value) →
        divisor = natural_data.peano.one ∨ divisor = value

theorem euclid_lemma
    (prime_value first second : natural_data.peano.carrier)
    (prime_is_prime : prime natural_data prime_value)
    (divides_product :
      divides natural_data
        (naturalEmbedding natural_data prime_value)
        (multiplication natural_data
          (naturalEmbedding natural_data first)
          (naturalEmbedding natural_data second))) :
    divides natural_data
        (naturalEmbedding natural_data prime_value)
        (naturalEmbedding natural_data first) ∨
      divides natural_data
        (naturalEmbedding natural_data prime_value)
        (naturalEmbedding natural_data second) := by
  sorry

end Divisibility
end NaturalNumbers
end VolumeII
end LRA
