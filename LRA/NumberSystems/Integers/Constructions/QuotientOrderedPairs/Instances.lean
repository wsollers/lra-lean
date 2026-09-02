
import LRA.AlgebraicStructures
import LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs.Behavior
import LRA.NumberSystems.Integers.Interface.Definition

namespace LRA.NumberSystems.Integers.QuotientOrderedPairs

open LRA.AlgebraicStructures
open LRA.Order

/--
`quotient_addition` TODO

Predicate logic:

  noncomputable def quotient_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_addition_exists whole_data)

Predicate logic (unfolded):

  noncomputable def quotient_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_addition_exists whole_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_addition_exists whole_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def quotient_addition
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_addition_exists whole_data)

/--
`quotient_addition_spec` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∀ first second, quotient_addition whole_data (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_addition whole_data first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) = Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_addition whole_data first second)) ⋯).1 (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 first.1 second.1, negative_coordinate := whole_data.4 first.2 second.2 }

Logical form (Lean):

```lean
theorem quotient_addition_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_addition whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_addition whole_data first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem quotient_addition_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_addition whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_addition whole_data first second) := by
  sorry
/--
`quotient_multiplication` TODO

Predicate logic:

  noncomputable def quotient_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_multiplication_exists whole_data)

Predicate logic (unfolded):

  noncomputable def quotient_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_multiplication_exists whole_data) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_multiplication_exists whole_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def quotient_multiplication
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Carrier whole_data :=
  Classical.choose (quotient_multiplication_exists whole_data)

/--
`quotient_multiplication_spec` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∀ first second, quotient_multiplication whole_data (Quotient.mk _ first) (Quotient.mk _ second) = Quotient.mk _ (representative_multiplication whole_data first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) = Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_multiplication whole_data first second)) ⋯).1 (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) = Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 { positive_coordinate := whole_data.4 (whole_data.5 first.1 second.1) (whole_data.5 first.2 second.2), negative_coordinate := whole_data.4 (whole_data.5 first.1 second.2) (whole_data.5 first.2 second.1) }

Logical form (Lean):

```lean
theorem quotient_multiplication_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_multiplication whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_multiplication whole_data first second)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro

-/
theorem quotient_multiplication_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_multiplication whole_data (Quotient.mk _ first) (Quotient.mk _ second) =
        Quotient.mk _ (representative_multiplication whole_data first second) := by
  sorry
/--
`quotient_negation` TODO

Predicate logic:

  noncomputable def quotient_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data :=
  Quotient.lift
    (fun representative => Quotient.mk _ (representative_negation whole_data representative))
    (fun first second equivalentRepresentatives =>
      Quotient.sound
        (representative_negation_respects_equivalence whole_data
          first second equivalentRepresentatives))

Predicate logic (unfolded):

  noncomputable def quotient_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data :=
  Quotient.lift
    (fun representative => Quotient.mk _ (representative_negation whole_data representative))
    (fun first second equivalentRepresentatives =>
      Quotient.sound
        (representative_negation_respects_equivalence whole_data
          first second equivalentRepresentatives)) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def quotient_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data :=
  Quotient.lift
    (fun representative => Quotient.mk _ (representative_negation whole_data representative))
    (fun first second equivalentRepresentatives =>
      Quotient.sound
        (representative_negation_respects_equivalence whole_data
          first second equivalentRepresentatives))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def quotient_negation
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data :=
  Quotient.lift
    (fun representative => Quotient.mk _ (representative_negation whole_data representative))
    (fun first second equivalentRepresentatives =>
      Quotient.sound
        (representative_negation_respects_equivalence whole_data
          first second equivalentRepresentatives))

/--
`quotient_nonstrict_order` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (a a_1 : LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) ↔ LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_nonstrict_order whole_data first second) ⋯).1 a a_1

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (a a_1 : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) ↔ LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_nonstrict_order whole_data first second) ⋯).1 a a_1

Logical form (Lean):

```lean
noncomputable def quotient_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Prop :=
  Classical.choose (quotient_order_exists whole_data)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
noncomputable def quotient_nonstrict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Carrier whole_data → Carrier whole_data → Prop :=
  Classical.choose (quotient_order_exists whole_data)

/--
`quotient_nonstrict_order_spec` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∀ first second, quotient_nonstrict_order whole_data (Quotient.mk _ first) (Quotient.mk _ second) ↔ representative_nonstrict_order whole_data first second

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), (Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) ↔ LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_nonstrict_order whole_data first second) ⋯).1 (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 first) (Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1 second) ↔ whole_data.6 (whole_data.4 first.1 second.2) (whole_data.4 second.1 first.2)

Logical form (Lean):

```lean
theorem quotient_nonstrict_order_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_nonstrict_order whole_data (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_nonstrict_order whole_data first second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
theorem quotient_nonstrict_order_spec
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ first second,
      quotient_nonstrict_order whole_data (Quotient.mk _ first) (Quotient.mk _ second) ↔
        representative_nonstrict_order whole_data first second := by
  sorry
/--
`quotient_strict_order` TODO

Predicate logic:

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Carrier whole_data), (LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_nonstrict_order whole_data first second ∧ Ne first second)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (first second : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), ((Classical.indefiniteDescription (fun x => ∀ (first second : LRA.NumberSystems.Integers.QuotientOrderedPairs.Representative whole_data), x (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) first) (Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) second) ↔ LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_nonstrict_order whole_data first second) ⋯).1 first second ∧ first = second → False)

Logical form (Lean):

```lean
def quotient_strict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Carrier whole_data) : Prop :=
  quotient_nonstrict_order whole_data first second ∧ first ≠ second
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, unfold

-/
def quotient_strict_order
    (whole_data : WholeNumberArithmeticForQuotientPairs)
    (first second : Carrier whole_data) : Prop :=
  quotient_nonstrict_order whole_data first second ∧ first ≠ second

noncomputable instance quotientCarrierAdd
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Add (Carrier whole_data) := ⟨quotient_addition whole_data⟩

noncomputable instance quotientCarrierMul
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Mul (Carrier whole_data) := ⟨quotient_multiplication whole_data⟩

noncomputable instance quotientCarrierNeg
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    Neg (Carrier whole_data) := ⟨quotient_negation whole_data⟩

noncomputable instance quotientCarrierZero
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OfNat (Carrier whole_data) 0 := ⟨Quotient.mk _ (zero_representative whole_data)⟩

noncomputable instance quotientCarrierOne
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OfNat (Carrier whole_data) 1 := ⟨Quotient.mk _ (one_representative whole_data)⟩

noncomputable instance quotientCarrierLT
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LT (Carrier whole_data) := ⟨quotient_strict_order whole_data⟩

noncomputable instance quotientCarrierLE
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LE (Carrier whole_data) := ⟨quotient_nonstrict_order whole_data⟩

/--
`quotient_domain_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), IntegralDomainLaws (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.AlgebraicStructures.IntegralDomainLaws (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_domain_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
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
theorem quotient_domain_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    IntegralDomainLaws (Carrier whole_data) := by
  sorry
/--
`quotient_linear_order_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), LinearOrderLaws (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.Order.LinearOrderLaws (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_linear_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LinearOrderLaws (Carrier whole_data)
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
theorem quotient_linear_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LinearOrderLaws (Carrier whole_data) := by
  sorry
/--
`quotient_strict_order_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), StrictOrderCompatibilityLaw (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.Order.StrictOrderCompatibilityLaw (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_strict_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    StrictOrderCompatibilityLaw (Carrier whole_data)
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
theorem quotient_strict_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    StrictOrderCompatibilityLaw (Carrier whole_data) := by
  sorry
/--
`quotient_addition_order_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), AdditionRespectsOrderLaws (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.Order.AdditionRespectsOrderLaws (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_addition_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    AdditionRespectsOrderLaws (Carrier whole_data)
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
theorem quotient_addition_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    AdditionRespectsOrderLaws (Carrier whole_data) := by
  sorry
/--
`quotient_multiplication_order_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), MultiplicationRespectsOrderLaws (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.Order.MultiplicationRespectsOrderLaws (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_multiplication_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    MultiplicationRespectsOrderLaws (Carrier whole_data)
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
theorem quotient_multiplication_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    MultiplicationRespectsOrderLaws (Carrier whole_data) := by
  sorry
/--
`quotient_discrete_order_cert` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), OrderDiscretenessLaw (Carrier whole_data)

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs), LRA.Order.OrderDiscretenessLaw (Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1)

Logical form (Lean):

```lean
theorem quotient_discrete_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OrderDiscretenessLaw (Carrier whole_data)
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
theorem quotient_discrete_order_cert
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    OrderDiscretenessLaw (Carrier whole_data) := by
  sorry
/--
`QuotientOrderedPairsRealizesIntegerModel` TODO

Predicate logic:

  noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel where
  Carrier

Predicate logic (unfolded):

  noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel where
  Carrier (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel where
  Carrier
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
noncomputable def QuotientOrderedPairsRealizesIntegerModel
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.Interface.ModelTheory.IntegerModel where
  Carrier := Carrier whole_data
  addInst := quotientCarrierAdd whole_data
  mulInst := quotientCarrierMul whole_data
  negInst := quotientCarrierNeg whole_data
  zeroInst := quotientCarrierZero whole_data
  oneInst := quotientCarrierOne whole_data
  ltInst := quotientCarrierLT whole_data
  leInst := quotientCarrierLE whole_data
  domainCert := quotient_domain_cert whole_data
  orderCert := quotient_linear_order_cert whole_data
  strictCert := quotient_strict_order_cert whole_data
  addOrderCert := quotient_addition_order_cert whole_data
  mulOrderCert := quotient_multiplication_order_cert whole_data
  discreteCert := quotient_discrete_order_cert whole_data

/--
`quotient_every_element_is_integer_numeral` TODO

Predicate logic:

  (∀ whole_data ∈ WholeNumberArithmeticForQuotientPairs), ∀ value : Carrier whole_data, ∃ integer ∈ Int, LRA.NumberSystems.Integers.IntegerNumeral (QuotientOrderedPairsRealizesIntegerModel whole_data) integer = value

Predicate logic (unfolded):

  ∀ (whole_data : LRA.NumberSystems.Integers.QuotientOrderedPairs.WholeNumberArithmeticForQuotientPairs) (value : Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).1), Exists fun integer => Int.rec (fun a => (fun a => (fun n => LRA.NumberSystems.Integers.NaturalNumeral { Carrier := Quot (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).r, addInst := { add := Classical.choose ⋯ }, mulInst := { mul := Classical.choose ⋯ }, negInst := { neg := Quotient.lift (fun representative => Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_negation whole_data representative)) ⋯ }, zeroInst := { ofNat := Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).r (LRA.NumberSystems.Integers.QuotientOrderedPairs.zero_representative whole_data) }, oneInst := { ofNat := Quot.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data).r (LRA.NumberSystems.Integers.QuotientOrderedPairs.one_representative whole_data) }, ltInst := { lt := fun first second => (LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_nonstrict_order whole_data first second ∧ Ne first second) }, leInst := { le := Classical.choose ⋯ }, domainCert := ⋯, orderCert := ⋯, strictCert := ⋯, addOrderCert := ⋯, mulOrderCert := ⋯, discreteCert := ⋯ } n) a) a) (fun a => (fun a => (fun n => (LRA.NumberSystems.Integers.QuotientOrderedPairs.QuotientOrderedPairsRealizesIntegerModel whole_data).negInst.1 (LRA.NumberSystems.Integers.NaturalNumeral { Carrier := Quotient (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data), addInst := { add := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_addition whole_data }, mulInst := { mul := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_multiplication whole_data }, negInst := { neg := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_negation whole_data }, zeroInst := { ofNat := Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) (LRA.NumberSystems.Integers.QuotientOrderedPairs.zero_representative whole_data) }, oneInst := { ofNat := Quotient.mk (LRA.NumberSystems.Integers.QuotientOrderedPairs.representative_setoid whole_data) (LRA.NumberSystems.Integers.QuotientOrderedPairs.one_representative whole_data) }, ltInst := { lt := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_strict_order whole_data }, leInst := { le := LRA.NumberSystems.Integers.QuotientOrderedPairs.quotient_nonstrict_order whole_data }, domainCert := ⋯, orderCert := ⋯, strictCert := ⋯, addOrderCert := ⋯, mulOrderCert := ⋯, discreteCert := ⋯ } (instHAdd.1 n (instOfNatNat 1).1))) a) a) integer = value

Logical form (Lean):

```lean
theorem quotient_every_element_is_integer_numeral
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ value : Carrier whole_data,
      ∃ integer : Int,
        LRA.NumberSystems.Integers.IntegerNumeral
          (QuotientOrderedPairsRealizesIntegerModel whole_data) integer = value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, use, rcases

-/
theorem quotient_every_element_is_integer_numeral
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    ∀ value : Carrier whole_data,
      ∃ integer : Int,
        LRA.NumberSystems.Integers.IntegerNumeral
          (QuotientOrderedPairsRealizesIntegerModel whole_data) integer = value := by
  sorry
/--
`QuotientOrderedPairsRealizesIntegerNumberSystem` TODO

Predicate logic:

  noncomputable def QuotientOrderedPairsRealizesIntegerNumberSystem
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.IntegerNumberSystem where
  Model := QuotientOrderedPairsRealizesIntegerModel whole_data
  EveryElementIsIntegerNumeral := quotient_every_element_is_integer_numeral whole_data

Predicate logic (unfolded):

  noncomputable def QuotientOrderedPairsRealizesIntegerNumberSystem
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.IntegerNumberSystem where
  Model := QuotientOrderedPairsRealizesIntegerModel whole_data
  EveryElementIsIntegerNumeral := quotient_every_element_is_integer_numeral whole_data (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def QuotientOrderedPairsRealizesIntegerNumberSystem
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.IntegerNumberSystem where
  Model := QuotientOrderedPairsRealizesIntegerModel whole_data
  EveryElementIsIntegerNumeral := quotient_every_element_is_integer_numeral whole_data
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
noncomputable def QuotientOrderedPairsRealizesIntegerNumberSystem
    (whole_data : WholeNumberArithmeticForQuotientPairs) :
    LRA.NumberSystems.Integers.IntegerNumberSystem where
  Model := QuotientOrderedPairsRealizesIntegerModel whole_data
  EveryElementIsIntegerNumeral := quotient_every_element_is_integer_numeral whole_data

end LRA.NumberSystems.Integers.QuotientOrderedPairs
