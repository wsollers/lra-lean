
import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.Set
import LRA.Set.Constructions.TypeSet
import LRA.Set.Constructions.ZFCSet.Axioms
import LRA.Set.Constructions.ZFCSet
import LRA.Set.Interface.ModelTheory
import LRA.SetSystems
import LRA.UniversalAlgebra
import LRA.AlgebraicStructures
import LRA.Order

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

universe u

/--
`WholeNumberArithmeticForQuotientPairs` TODO

Predicate logic:

  structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type u
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

Predicate logic (unfolded):

  structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type u
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
      nonstrict_order first second (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type u
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

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, cases, rcases

-/
structure WholeNumberArithmeticForQuotientPairs where
  carrier : Type u
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

/--
`WholeNumberArithmeticForQuotientPairs.ofCarrier` TODO

Predicate logic:

  def WholeNumberArithmeticForQuotientPairs.ofCarrier
    (R : Type u)
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
  carrier

Predicate logic (unfolded):

  def WholeNumberArithmeticForQuotientPairs.ofCarrier
    (R : Type u)
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
  carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
def WholeNumberArithmeticForQuotientPairs.ofCarrier
    (R : Type u)
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
  carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr, unfold

-/
def WholeNumberArithmeticForQuotientPairs.ofCarrier
    (R : Type u)
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

/--
`Representative` TODO

Predicate logic:

  structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier

Predicate logic (unfolded):

  structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
structure Representative (whole_data : WholeNumberArithmeticForQuotientPairs) where
  positive_coordinate : whole_data.carrier
  negative_coordinate : whole_data.carrier

end LRA.NumberSystems.Integers.QuotientOrderedPairs
