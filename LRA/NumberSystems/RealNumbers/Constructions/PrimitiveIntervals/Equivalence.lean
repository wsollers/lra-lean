-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Equivalence.lean
-- Persistent cross-level overlap, the proof that it is an equivalence
-- relation, the resulting setoid, the primitive-interval real carrier as
-- the quotient by that setoid, admissibility of the constant degenerate
-- sequence, the canonical rational representative and embedding, and
-- injectivity of that embedding.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Carrier

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : DenselyOrderedFieldModel)

/-- Definition 1.7: persistent cross-level overlap.

Mathematical statement (Lean): `def equivalent (first second : Representative rational_model) : Prop`.


Logical form:

```lean
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)
```
-/
def equivalent
    (first second : Representative rational_model) : Prop :=
  ∀ first_index second_index,
    overlaps rational_model
      (first.interval first_index)
      (second.interval second_index)


/-- Theorem 1.8: persistent overlap is an equivalence relation.

Mathematical statement (Lean): `theorem equivalent_is_equivalence_relation : Equivalence (equivalent rational_model)`.

*Proof status:* proof pending


Logical form:

```lean
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model)
```
-/
theorem equivalent_is_equivalence_relation :
    Equivalence (equivalent rational_model) := by
  sorry

/-- Definition 1.9: the representative setoid.

Mathematical statement (Lean): `def representative_setoid : Setoid (Representative rational_model)`.


Logical form:

```lean
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model
```
-/
def representative_setoid : Setoid (Representative rational_model) where
  r := equivalent rational_model
  iseqv := equivalent_is_equivalence_relation rational_model


/-- Definition 1.10: the primitive interval real carrier.

Mathematical statement (Lean): `abbrev Carrier`.


Logical form:

```lean
abbrev Carrier := Quotient (representative_setoid rational_model)
```
-/
abbrev Carrier := Quotient (representative_setoid rational_model)


/-- Constant degenerate sequences are admissible.

Mathematical statement (Lean): `theorem constant_degenerate_sequence_is_admissible (value : Rational rational_model) : ∃ representative : Representative rational_model, ∀ index, representative.interval index = degenerate_interval rational_model value`.

*Proof status:* proof pending


Logical form:

```lean
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value
```
-/
theorem constant_degenerate_sequence_is_admissible
    (value : Rational rational_model) :
    ∃ representative : Representative rational_model,
      ∀ index,
        representative.interval index =
          degenerate_interval rational_model value := by
  sorry

/-- Definition 2.1: the constant representative C_q.

Mathematical statement (Lean): `noncomputable def rational_representative (value : Rational rational_model) : Representative rational_model`.


Logical form:

```lean
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)
```
-/
noncomputable def rational_representative
    (value : Rational rational_model) : Representative rational_model :=
  Classical.choose
    (constant_degenerate_sequence_is_admissible rational_model value)


/-- Definition 2.2: canonical rational embedding.

Mathematical statement (Lean): `noncomputable def rational_embedding (value : Rational rational_model) : Carrier rational_model`.


Logical form:

```lean
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)
```
-/
noncomputable def rational_embedding
    (value : Rational rational_model) : Carrier rational_model :=
  Quotient.mk _ (rational_representative rational_model value)


/-- Theorem 2.3: the rational embedding is injective.

Mathematical statement (Lean): `theorem rational_embedding_is_injective : ∀ first second, rational_embedding rational_model first = rational_embedding rational_model second → first = second`.

*Proof status:* proof pending


Logical form:

```lean
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second
```
-/
theorem rational_embedding_is_injective :
    ∀ first second,
      rational_embedding rational_model first =
        rational_embedding rational_model second →
      first = second := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
