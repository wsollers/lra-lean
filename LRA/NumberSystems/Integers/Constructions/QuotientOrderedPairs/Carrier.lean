-- LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean
-- The pre-carrier: formal differences of whole numbers, and the algebraic
-- data required of the whole-number carrier they are built from.

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.Set
import LRA.Set.PredicateSet
import LRA.Set.ZFC
import LRA.Set.ZFCSet
import LRA.Set.Model
import LRA.SetSystems
import LRA.UniversalAlgebra
import LRA.AlgebraicStructures
import LRA.Order

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

/-!
Lean module: LRA.NumberSystems.Integers.QuotientOrderedPairs
Verification status: definitions complete; proofs pending

This module formalizes the default quotient-ordered-pairs construction of the
integers from formal differences of whole numbers. It follows the mathematical
order in `docs/number-systems/gpt-02-integers.md`.

Moved from `LRA.VolumeII.Integers.QuotientOrderedPairs` (previously one file
covering the whole pipeline); split per §1.6.1 into `Carrier` (this file),
`Equivalence`, `WellFoundedness`, `Operations`, `WellDefinedness`, `Laws`,
`Behavior`, `Instances`. See `Integers/ProofOrder.md`.
-/

/-- Algebraic data required from the whole-number carrier.

The quotient order on formal differences compares translated sums
`a + d` and `c + b`. To make that order faithful to the underlying
whole-number order, the input contract must let a common translation be
cancelled on order comparisons, not merely preserved.

Logical form:

```lean
structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type
  zero : carrier
  one : carrier
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  nonstrict_order : carrier → carrier → Prop
  addition_associative :
    ∀ first second third,
      addition (addition first second) third =
        addition first (addition second third)
  addition_commutative :
    ∀ first second,
      addition first second = addition second first
  zero_additive_identity :
    ∀ value,
      addition zero value = value ∧ addition value zero = value
  addition_cancellative :
    ∀ first second common,
      addition first common = addition second common → first = second
  multiplication_associative :
    ∀ first second third,
      multiplication (multiplication first second) third =
        multiplication first (multiplication second third)
  multiplication_commutative :
    ∀ first second,
      multiplication first second = multiplication second first
  one_multiplicative_identity :
    ∀ value,
      multiplication one value = value ∧ multiplication value one = value
  multiplication_distributes_over_addition :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
  nonstrict_order_reflexive :
    ∀ value, nonstrict_order value value
  nonstrict_order_transitive :
    ∀ first second third,
      nonstrict_order first second →
      nonstrict_order second third →
      nonstrict_order first third
  nonstrict_order_antisymmetric :
    ∀ first second,
      nonstrict_order first second →
      nonstrict_order second first →
      first = second
  addition_preserves_and_reflects_order :
    ∀ first second translation,
      nonstrict_order
        (addition first translation)
        (addition second translation) ↔
      nonstrict_order first second
```
-/
structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type
  zero : carrier
  one : carrier
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  nonstrict_order : carrier → carrier → Prop
  addition_associative :
    ∀ first second third,
      addition (addition first second) third =
        addition first (addition second third)
  addition_commutative :
    ∀ first second,
      addition first second = addition second first
  zero_additive_identity :
    ∀ value,
      addition zero value = value ∧ addition value zero = value
  addition_cancellative :
    ∀ first second common,
      addition first common = addition second common → first = second
  multiplication_associative :
    ∀ first second third,
      multiplication (multiplication first second) third =
        multiplication first (multiplication second third)
  multiplication_commutative :
    ∀ first second,
      multiplication first second = multiplication second first
  one_multiplicative_identity :
    ∀ value,
      multiplication one value = value ∧ multiplication value one = value
  multiplication_distributes_over_addition :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third)
  nonstrict_order_reflexive :
    ∀ value, nonstrict_order value value
  nonstrict_order_transitive :
    ∀ first second third,
      nonstrict_order first second →
      nonstrict_order second third →
      nonstrict_order first third
  nonstrict_order_antisymmetric :
    ∀ first second,
      nonstrict_order first second →
      nonstrict_order second first →
      first = second
  addition_preserves_and_reflects_order :
    ∀ first second translation,
      nonstrict_order
        (addition first translation)
        (addition second translation) ↔
      nonstrict_order first second

/-- Package a canonically certified whole-number carrier as the shared input
for formal-difference integer constructions.

This keeps the quotient-pairs, Tao, and Mendelson entry points aligned with
the repository's native algebra and order certificate surface instead of
forcing each consumer to restate the same machine fields by hand.
-/
def WholeNumberArithmeticForQuotientPairs.ofCarrier
    (R : Type)
    [Add R] [Mul R] [OfNat R 0] [OfNat R 1] [LE R]
    [CommutativeSemiringLaws R] [PartialOrderLaws R]
    (addition_cancellative :
      ∀ first second common : R,
        first + common = second + common → first = second)
    (addition_preserves_and_reflects_order :
      ∀ first second translation : R,
        first + translation ≤ second + translation ↔
          first ≤ second) :
    WholeNumberArithmeticForQuotientPairs where
  carrier := R
  zero := 0
  one := 1
  addition := (· + ·)
  multiplication := (· * ·)
  nonstrict_order := (· ≤ ·)
  addition_associative := AddAssociative
  addition_commutative := AddCommutative
  zero_additive_identity := fun value => ⟨ZeroAdd value, AddZero value⟩
  addition_cancellative := addition_cancellative
  multiplication_associative := MulAssociative
  multiplication_commutative := MulCommutative
  one_multiplicative_identity := fun value => ⟨OneMul value, MulOne value⟩
  multiplication_distributes_over_addition := LeftDistributive
  nonstrict_order_reflexive := LeRefl
  nonstrict_order_transitive := LeTrans
  nonstrict_order_antisymmetric := LeAntisymm
  addition_preserves_and_reflects_order := addition_preserves_and_reflects_order


/-- A formal difference `(positive_coordinate, negative_coordinate)`.

Logical form:

```lean
structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier
```
-/
structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier

end LRA.NumberSystems.Integers.QuotientOrderedPairs
