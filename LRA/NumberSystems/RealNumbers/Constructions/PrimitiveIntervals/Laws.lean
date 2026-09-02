
import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Integers.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers.Interface.ModelTheory
open LRA.NumberSystems.RealNumbers.Interface.ModelTheory

variable (rational_model : RationalModel)

/--
`StrictTotalOrder` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (value : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), ¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model value value ∧ (∀ (first second third : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first second → LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model second third → LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first third ∧ ∀ (first second : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), Ne first second → Or (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model second first)))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (value : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 value value → False ∧ (∀ (first second third : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 second third → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first third ∧ ∀ (first second : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (first = second → False) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 second first)))

Logical form (Lean):

```lean
def StrictTotalOrder : Prop :=
  (∀ value : Carrier rational_model,
    ¬ strict_order rational_model value value) ∧
  (∀ first second third : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Carrier rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, unfold

-/
def StrictTotalOrder : Prop :=
  (∀ value : Carrier rational_model,
    ¬ strict_order rational_model value value) ∧
  (∀ first second third : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Carrier rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)

/--
`strict_total_order` TODO

Predicate logic:

  StrictTotalOrder rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (value : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 value value → False ∧ (∀ (first second third : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 second third → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first third ∧ ∀ (first second : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (first = second → False) → Or ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 second first)))

Logical form (Lean):

```lean
theorem strict_total_order : StrictTotalOrder rational_model
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
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry
/--
`OrderCompatibility` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (first second translation : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first second → LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.addition rational_model first translation) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.addition rational_model second translation) ∧ ∀ (first second positive : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model first second → LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.zero rational_model) positive → LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.multiplication rational_model first positive) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.multiplication rational_model second positive))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (first second translation : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).1 first translation) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).1 second translation) ∧ ∀ (first second positive : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 (Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).r (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.rational_representative rational_model rational_model.signature.zero)) positive → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 first positive) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 second positive))

Logical form (Lean):

```lean
def OrderCompatibility : Prop :=
  (∀ first second translation : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second positive : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model (zero rational_model) positive →
    strict_order rational_model
      (multiplication rational_model first positive)
      (multiplication rational_model second positive))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, unfold

-/
def OrderCompatibility : Prop :=
  (∀ first second translation : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second positive : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model (zero rational_model) positive →
    strict_order rational_model
      (multiplication rational_model first positive)
      (multiplication rational_model second positive))

/--
`order_compatibility` TODO

Predicate logic:

  OrderCompatibility rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), (∀ (first second translation : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).val first translation) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).val second translation) ∧ ∀ (first second positive : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 first second → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.rational_representative rational_model rational_model.signature.zero)) positive → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).val first positive) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).val second positive))

Logical form (Lean):

```lean
theorem order_compatibility : OrderCompatibility rational_model
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
theorem order_compatibility : OrderCompatibility rational_model := by
  sorry
/--
`raw_interval_subdistributivity` TODO

Predicate logic:

  subset rational_model (interval_multiplication rational_model first (interval_addition rational_model second third)) (interval_addition rational_model (interval_multiplication rational_model first second) (interval_multiplication rational_model first third))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second third : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).1 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).1 ∧ rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).2)

Logical form (Lean):

```lean
theorem raw_interval_subdistributivity
    (first second third : RationalInterval rational_model) :
    subset rational_model
      (interval_multiplication rational_model first
        (interval_addition rational_model second third))
      (interval_addition rational_model
        (interval_multiplication rational_model first second)
        (interval_multiplication rational_model first third))
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
theorem raw_interval_subdistributivity
    (first second third : RationalInterval rational_model) :
    subset rational_model
      (interval_multiplication rational_model first
        (interval_addition rational_model second third))
      (interval_addition rational_model
        (interval_multiplication rational_model first second)
        (interval_multiplication rational_model first third)) := by
  sorry
/--
`raw_interval_distributivity_can_fail` TODO

Predicate logic:

  ∃ first second third ∈ RationalInterval rational_model, subset rational_model (interval_multiplication rational_model first (interval_addition rational_model second third)) (interval_addition rational_model (interval_multiplication rational_model first second) (interval_multiplication rational_model first third)) ∧ ¬ subset rational_model (interval_addition rational_model (interval_multiplication rational_model first second) (interval_multiplication rational_model first third)) (interval_multiplication rational_model first (interval_addition rational_model second third))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel), Exists fun first => Exists fun second => Exists fun third => ((rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).1 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).1 ∧ rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).2) ∧ (rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).1 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).1 ∧ rational_model.signature.toOrderedRingConceptSignature.2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first third)).2 (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.interval_addition rational_model second third)).2) → False)

Logical form (Lean):

```lean
theorem raw_interval_distributivity_can_fail :
    ∃ first second third : RationalInterval rational_model,
      subset rational_model
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third)) ∧
      ¬ subset rational_model
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third))
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: constructor, cases, rcases, use

-/
theorem raw_interval_distributivity_can_fail :
    ∃ first second third : RationalInterval rational_model,
      subset rational_model
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third)) ∧
      ¬ subset rational_model
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third))
        (interval_multiplication rational_model first
          (interval_addition rational_model second third)) := by
  sorry
/--
`distributive_defect_vanishes` TODO

Predicate logic:

  equivalent rational_model (representative_multiplication rational_model first (representative_addition rational_model second third)) (representative_addition rational_model (representative_multiplication rational_model first second) (representative_multiplication rational_model first third))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second third : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model) (first_index second_index : Nat), Exists fun value => ((rational_model.signature.toOrderedRingConceptSignature.2 ((LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model second third)).interval first_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value ((LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model second third)).interval first_index).2) ∧ (rational_model.signature.toOrderedRingConceptSignature.2 ((LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first third)).interval second_index).1 value ∧ rational_model.signature.toOrderedRingConceptSignature.2 value ((LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first second) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first third)).interval second_index).2))

Logical form (Lean):

```lean
theorem distributive_defect_vanishes
    (first second third : Representative rational_model) :
    equivalent rational_model
      (representative_multiplication rational_model first
        (representative_addition rational_model second third))
      (representative_addition rational_model
        (representative_multiplication rational_model first second)
        (representative_multiplication rational_model first third))
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
theorem distributive_defect_vanishes
    (first second third : Representative rational_model) :
    equivalent rational_model
      (representative_multiplication rational_model first
        (representative_addition rational_model second third))
      (representative_addition rational_model
        (representative_multiplication rational_model first second)
        (representative_multiplication rational_model first third)) := by
  sorry
/--
`quotient_distributivity` TODO

Predicate logic:

  multiplication rational_model first (addition rational_model second third) = addition rational_model (multiplication rational_model first second) (multiplication rational_model first third)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (first second third : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 first ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).1 second third) = (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_addition rational_model first_representative second_representative)) ⋯).1 ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 first second) ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 first third)

Logical form (Lean):

```lean
theorem quotient_distributivity
    (first second third : Carrier rational_model) :
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third)
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
theorem quotient_distributivity
    (first second third : Carrier rational_model) :
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third) := by
  sorry
/--
`nonzero_eventually_separated_from_zero` TODO

Predicate logic:

  ∃ representative ∈ Representative rational_model, Quotient.mk _ representative = value ∧ ∃ delta, rational_model.signature.StrictOrder rational_model.signature.zero delta ∧ ((∃ threshold, ∀ index, threshold ≤ index → rational_model.signature.le delta (representative.interval index).left_endpoint) ∨ (∃ threshold, ∀ index, threshold ≤ index → rational_model.signature.le (representative.interval index).right_endpoint (rational_model.signature.neg delta)))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (value = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.choose ⋯) → False) → Exists fun representative => (Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 representative = value ∧ Exists fun delta => (rational_model.signature.toOrderedRingSignature.2 rational_model.signature.toZeroOneBundle.2 delta ∧ Or (Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rational_model.signature.toOrderedRingConceptSignature.2 delta (representative.interval index).1) (Exists fun threshold => ∀ (index : Nat), instLENat.1 threshold index → rational_model.signature.toOrderedRingConceptSignature.2 (representative.interval index).2 (rational_model.signature.toRingConceptSignature.2 delta))))

Logical form (Lean):

```lean
theorem nonzero_eventually_separated_from_zero
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ representative : Representative rational_model,
      Quotient.mk _ representative = value ∧
      ∃ delta,
        rational_model.signature.StrictOrder
          rational_model.signature.zero delta ∧
        ((∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le
              (representative.interval index).right_endpoint
              (rational_model.signature.neg delta)))
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, Or.inl, Or.inr, use

-/
theorem nonzero_eventually_separated_from_zero
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ representative : Representative rational_model,
      Quotient.mk _ representative = value ∧
      ∃ delta,
        rational_model.signature.StrictOrder
          rational_model.signature.zero delta ∧
        ((∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le
              (representative.interval index).right_endpoint
              (rational_model.signature.neg delta))) := by
  sorry
/--
`IsReciprocalInterval` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval reciprocal : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), (¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.contains rational_model interval rational_model.signature.zero ∧ (reciprocal.left_endpoint = rational_model.signature.inv interval.right_endpoint ∧ reciprocal.right_endpoint = rational_model.signature.inv interval.left_endpoint))

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (interval reciprocal : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.RationalInterval rational_model), ((rational_model.signature.toOrderedRingConceptSignature.2 interval.1 rational_model.signature.toZeroOneBundle.2 ∧ rational_model.signature.toOrderedRingConceptSignature.2 rational_model.signature.toZeroOneBundle.2 interval.2) → False ∧ (reciprocal.1 = rational_model.signature.2 interval.2 ∧ reciprocal.2 = rational_model.signature.2 interval.1))

Logical form (Lean):

```lean
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inv interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inv interval.left_endpoint
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
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inv interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inv interval.left_endpoint

/--
`reciprocal_exists_uniquely` TODO

Predicate logic:

  ∃ inverse_value, multiplication rational_model value inverse_value = one rational_model ∧ ∀ other, multiplication rational_model value other = one rational_model → other = inverse_value

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (value : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (value = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.choose ⋯) → False) → Exists fun inverse_value => ((Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 value inverse_value = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.degenerate_interval rational_model rational_model.signature.one) ⋯).1 ∧ ∀ (other : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) = Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_multiplication rational_model first_representative second_representative)) ⋯).1 value other = Quot.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 (Classical.indefiniteDescription (fun x => ∀ (index : Nat), x.interval index = LRA.NumberSystems.RealNumbers.PrimitiveIntervals.degenerate_interval rational_model rational_model.signature.one) ⋯).1 → other = inverse_value)

Logical form (Lean):

```lean
theorem reciprocal_exists_uniquely
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model ∧
      ∀ other,
        multiplication rational_model value other = one rational_model →
        other = inverse_value
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use

-/
theorem reciprocal_exists_uniquely
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model ∧
      ∀ other,
        multiplication rational_model value other = one rational_model →
        other = inverse_value := by
  sorry
/--
`inverse` TODO

Predicate logic:

  noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)

Predicate logic (unfolded):

  noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero) (source fallback; no compiled unfold data available)

Logical form (Lean):

```lean
noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)
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
noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)

/--
`LeastUpperBoundProperty` TODO

Predicate logic:

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (members : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model → Prop), (Exists fun member => members member ∧ Exists fun upper_bound => ∀ (member : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), members member → ¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model upper_bound member) → Exists fun supremum => (∀ (member : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), members member → ¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model supremum member ∧ ∀ (upper_bound : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), (∀ (member : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Carrier rational_model), members member → ¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model upper_bound member) → ¬ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.strict_order rational_model upper_bound supremum)

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (members : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 → Prop), (Exists fun member => members member ∧ Exists fun upper_bound => ∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound member → False) → Exists fun supremum => (∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 supremum member → False ∧ ∀ (upper_bound : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound member → False) → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound supremum → False)

Logical form (Lean):

```lean
def LeastUpperBoundProperty : Prop :=
  ∀ members : Carrier rational_model → Prop,
    (∃ member, members member) →
    (∃ upper_bound,
      ∀ member,
        members member →
        ¬ strict_order rational_model upper_bound member) →
    ∃ supremum,
      (∀ member,
        members member →
        ¬ strict_order rational_model supremum member) ∧
      (∀ upper_bound,
        (∀ member,
          members member →
          ¬ strict_order rational_model upper_bound member) →
        ¬ strict_order rational_model upper_bound supremum)
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, cases, rcases, use, unfold

-/
def LeastUpperBoundProperty : Prop :=
  ∀ members : Carrier rational_model → Prop,
    (∃ member, members member) →
    (∃ upper_bound,
      ∀ member,
        members member →
        ¬ strict_order rational_model upper_bound member) →
    ∃ supremum,
      (∀ member,
        members member →
        ¬ strict_order rational_model supremum member) ∧
      (∀ upper_bound,
        (∀ member,
          members member →
          ¬ strict_order rational_model upper_bound member) →
        ¬ strict_order rational_model upper_bound supremum)

/--
`least_upper_bound_property` TODO

Predicate logic:

  LeastUpperBoundProperty rational_model

Predicate logic (unfolded):

  ∀ (rational_model : LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.RationalModel) (members : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1 → Prop), (Exists fun member => members member ∧ Exists fun upper_bound => ∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound member → False) → Exists fun supremum => (∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 supremum member → False ∧ ∀ (upper_bound : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), (∀ (member : Quot (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model).1), members member → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound member → False) → (Classical.indefiniteDescription (fun x => ∀ (first_representative second_representative : LRA.NumberSystems.RealNumbers.PrimitiveIntervals.Representative rational_model), x (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) first_representative) (Quotient.mk (LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_setoid rational_model) second_representative) ↔ LRA.NumberSystems.RealNumbers.PrimitiveIntervals.representative_strict_order rational_model first_representative second_representative) ⋯).1 upper_bound supremum → False)

Logical form (Lean):

```lean
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model
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
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry
end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
