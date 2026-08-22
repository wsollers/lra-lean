-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Behavior.lean
-- Behavioral theorems: density of the embedded rationals, the Archimedean
-- property, and the final reference-real structural summary.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Laws

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

/-- Theorem 7.1: embedded rationals are order-dense.

Mathematical statement (Lean): `theorem embedded_rationals_are_dense (first second : Cut rational_model) (first_lt_second : strict_order rational_model first second) : ∃ rational, strict_order rational_model first (rational_embedding rational_model rational) ∧ strict_order rational_model...`.

*Proof status:* proof pending


Logical form:

```lean
theorem embedded_rationals_are_dense
    (first second : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    ∃ rational,
      strict_order rational_model first
        (rational_embedding rational_model rational) ∧
      strict_order rational_model
        (rational_embedding rational_model rational) second
```
-/
theorem embedded_rationals_are_dense
    (first second : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    ∃ rational,
      strict_order rational_model first
        (rational_embedding rational_model rational) ∧
      strict_order rational_model
        (rational_embedding rational_model rational) second := by
  sorry

/-- Theorem 7.2: Archimedean property.

Mathematical statement (Lean): `theorem archimedean_property (natural_carrier : Type) (natural_to_rational : natural_carrier → Rational rational_model) (cut : Cut rational_model) : ∃ natural, strict_order rational_model cut (rational_embedding rational_model (natural_to_rational natural))`.

*Proof status:* proof pending


Logical form:

```lean
theorem archimedean_property
    (natural_carrier : Type)
    (natural_to_rational : natural_carrier → Rational rational_model)
    (cut : Cut rational_model) :
    ∃ natural,
      strict_order rational_model cut
        (rational_embedding rational_model
          (natural_to_rational natural))
```
-/
theorem archimedean_property
    (natural_carrier : Type)
    (natural_to_rational : natural_carrier → Rational rational_model)
    (cut : Cut rational_model) :
    ∃ natural,
      strict_order rational_model cut
        (rational_embedding rational_model
          (natural_to_rational natural)) := by
  sorry

/-- Proposition expressing the final reference-real summary.

Mathematical statement (Lean): `def ReferenceRealNumberConstruction : Prop`.


Logical form:

```lean
def ReferenceRealNumberConstruction : Prop :=
  CompleteOrderedFieldStructure rational_model ∧
  (∀ first second : Cut rational_model,
    strict_order rational_model first second →
    ∃ rational,
      strict_order rational_model first
        (rational_embedding rational_model rational) ∧
      strict_order rational_model
        (rational_embedding rational_model rational) second)
```
-/
def ReferenceRealNumberConstruction : Prop :=
  CompleteOrderedFieldStructure rational_model ∧
  (∀ first second : Cut rational_model,
    strict_order rational_model first second →
    ∃ rational,
      strict_order rational_model first
        (rational_embedding rational_model rational) ∧
      strict_order rational_model
        (rational_embedding rational_model rational) second)


/-- Theorem 8.1: final reference-real structural summary.

Mathematical statement (Lean): `theorem reference_real_number_construction : ReferenceRealNumberConstruction rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem reference_real_number_construction :
    ReferenceRealNumberConstruction rational_model
```
-/
theorem reference_real_number_construction :
    ReferenceRealNumberConstruction rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
