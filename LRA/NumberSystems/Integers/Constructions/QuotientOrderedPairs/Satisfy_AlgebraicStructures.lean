import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Instances

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures

/--
`satisfiesIntegralDomain` The quotient-of-ordered-pairs construction canonically realizes integral domain structure.

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), have x := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierAdd whole_data; have x_1 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierMul whole_data; have x_2 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierNeg whole_data; have x_3 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierZero whole_data; have x_4 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierOne whole_data; have x_5 := ⋯; LRA.AlgebraicStructures.IntegralDomainLaws (LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    whole_data : WholeNumberArithmeticForQuotientPairs
  Prove
    have x := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierAdd whole_data; have x_1 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierMul whole_data; have x_2 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierNeg whole_data; have x_3 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierZero whole_data; have x_4 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierOne whole_data; have x_5 := ⋯; LRA.AlgebraicStructures.IntegralDomainLaws (LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data)

Logical form (Lean):

```lean
theorem satisfiesIntegralDomain
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    IntegralDomainLaws (Carrier whole_data)
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
theorem satisfiesIntegralDomain
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    IntegralDomainLaws (Carrier whole_data) := by
  sorry
/--
`satisfiesOrderedRing` The quotient-of-ordered-pairs construction canonically realizes ordered ring structure.

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), have x := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierAdd whole_data; have x_1 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierMul whole_data; have x_2 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierNeg whole_data; have x_3 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierZero whole_data; have x_4 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierOne whole_data; have x_5 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierLE whole_data; have x_6 := ⋯; LRA.AlgebraicStructures.OrderedRingLaws (LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data)

Predicate logic (unfolded):

  Ambient
    (implicit ambient)
  Objects
    whole_data : WholeNumberArithmeticForQuotientPairs
  Prove
    have x := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierAdd whole_data; have x_1 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierMul whole_data; have x_2 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierNeg whole_data; have x_3 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierZero whole_data; have x_4 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierOne whole_data; have x_5 := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotientCarrierLE whole_data; have x_6 := ⋯; LRA.AlgebraicStructures.OrderedRingLaws (LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data)

Logical form (Lean):

```lean
theorem satisfiesOrderedRing
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : LE (Carrier whole_data) := quotientCarrierLE whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    OrderedRingLaws (Carrier whole_data)
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
theorem satisfiesOrderedRing
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    let _ : Add (Carrier whole_data) := quotientCarrierAdd whole_data
    let _ : Mul (Carrier whole_data) := quotientCarrierMul whole_data
    let _ : Neg (Carrier whole_data) := quotientCarrierNeg whole_data
    let _ : OfNat (Carrier whole_data) 0 := quotientCarrierZero whole_data
    let _ : OfNat (Carrier whole_data) 1 := quotientCarrierOne whole_data
    let _ : LE (Carrier whole_data) := quotientCarrierLE whole_data
    let _ : Nonempty (Carrier whole_data) := ⟨0⟩
    OrderedRingLaws (Carrier whole_data) := by
  sorry
end LRA.NumberSystems.Integers.QuotientOrderedPairs
