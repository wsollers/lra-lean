-- LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Equivalence.lean
-- Repurposed pipeline stage: `Cut` is a subtype, not a quotient, so there is
-- no separate raw-representative/equivalence-relation layer. This stage
-- instead carries the order structure that plays the analogous role:
-- inclusion order on cuts, strict order by proper inclusion, and the
-- proposition (with pending proof) that this order is a strict total order.

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Carrier

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

/-- Non-strict inclusion order on cuts.

Mathematical statement (Lean): `def nonstrict_order (first second : Cut rational_model) : Prop`.


Logical form:

```lean
def nonstrict_order (first second : Cut rational_model) : Prop :=
  ∀ value,
    contains rational_model first value →
    contains rational_model second value
```
-/
def nonstrict_order (first second : Cut rational_model) : Prop :=
  ∀ value,
    contains rational_model first value →
    contains rational_model second value


/-- Definition 2.1: strict order by proper inclusion.

Mathematical statement (Lean): `def strict_order (first second : Cut rational_model) : Prop`.


Logical form:

```lean
def strict_order (first second : Cut rational_model) : Prop :=
  nonstrict_order rational_model first second ∧ first ≠ second
```
-/
def strict_order (first second : Cut rational_model) : Prop :=
  nonstrict_order rational_model first second ∧ first ≠ second


/-- Proposition expressing strict total order.

Mathematical statement (Lean): `def StrictTotalOrder : Prop`.


Logical form:

```lean
def StrictTotalOrder : Prop :=
  (∀ cut : Cut rational_model, ¬ strict_order rational_model cut cut) ∧
  (∀ first second third : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Cut rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)
```
-/
def StrictTotalOrder : Prop :=
  (∀ cut : Cut rational_model, ¬ strict_order rational_model cut cut) ∧
  (∀ first second third : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Cut rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)


/-- Theorem 2.2: proper inclusion is a strict total order.

Mathematical statement (Lean): `theorem strict_total_order : StrictTotalOrder rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem strict_total_order : StrictTotalOrder rational_model
```
-/
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
