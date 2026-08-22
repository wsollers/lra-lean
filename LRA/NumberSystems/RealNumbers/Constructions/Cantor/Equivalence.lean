-- LRA/NumberSystems/RealNumbers/Constructions/Cantor/Equivalence.lean
-- Endpoint equivalence between nested interval sequences, the proof that it
-- is an equivalence relation, the resulting setoid, and the Cantor real
-- carrier as the quotient by that setoid.

import LRA.NumberSystems.RealNumbers.Constructions.Cantor.Carrier

namespace LRA.NumberSystems.RealNumbers.Cantor
open LRA.NumberSystems.Models

/--
**[Def — endpoint_equivalent]**

Mathematical statement (Lean): `def endpoint_equivalent (rational_model : DenselyOrderedFieldModel) (first second : NestedIntervalSequence rational_model) : Prop`.


Logical form:

```lean
def endpoint_equivalent
    (rational_model : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence rational_model) : Prop :=
  ∀ tolerance : rational_model.signature.carrier,
    rational_model.signature.StrictOrder rational_model.signature.zero tolerance →
      ∃ index : Nat,
        rational_model.signature.StrictOrder
          (rational_model.signature.add
            (first.interval index).lower
            (rational_model.signature.neg (second.interval index).upper))
          tolerance
```
-/
def endpoint_equivalent
    (rational_model : DenselyOrderedFieldModel)
    (first second : NestedIntervalSequence rational_model) : Prop :=
  ∀ tolerance : rational_model.signature.carrier,
    rational_model.signature.StrictOrder rational_model.signature.zero tolerance →
      ∃ index : Nat,
        rational_model.signature.StrictOrder
          (rational_model.signature.add
            (first.interval index).lower
            (rational_model.signature.neg (second.interval index).upper))
          tolerance

/--
**[Theorem — endpoint_equivalent_is_equivalence]**

Mathematical statement (Lean): `theorem endpoint_equivalent_is_equivalence (rational_model : DenselyOrderedFieldModel) : Equivalence (endpoint_equivalent rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem endpoint_equivalent_is_equivalence
    (rational_model : DenselyOrderedFieldModel) :
    Equivalence (endpoint_equivalent rational_model)
```
-/
theorem endpoint_equivalent_is_equivalence
    (rational_model : DenselyOrderedFieldModel) :
    Equivalence (endpoint_equivalent rational_model) := by
  sorry

/--
**[Def — setoid]**

Mathematical statement (Lean): `def setoid (rational_model : DenselyOrderedFieldModel) : Setoid (NestedIntervalSequence rational_model)`.


Logical form:

```lean
def setoid (rational_model : DenselyOrderedFieldModel) :
    Setoid (NestedIntervalSequence rational_model) where
  r := endpoint_equivalent rational_model
  iseqv := endpoint_equivalent_is_equivalence rational_model
```
-/
def setoid (rational_model : DenselyOrderedFieldModel) :
    Setoid (NestedIntervalSequence rational_model) where
  r := endpoint_equivalent rational_model
  iseqv := endpoint_equivalent_is_equivalence rational_model

/--
**[Abbrev — Carrier]**

Mathematical statement (Lean): `abbrev Carrier (rational_model : DenselyOrderedFieldModel)`.


Logical form:

```lean
abbrev Carrier (rational_model : DenselyOrderedFieldModel) :=
  Quotient (setoid rational_model)
```
-/
abbrev Carrier (rational_model : DenselyOrderedFieldModel) :=
  Quotient (setoid rational_model)

end LRA.NumberSystems.RealNumbers.Cantor
