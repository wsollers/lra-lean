-- LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Behavior.lean
-- Cross-construction comparison with the Cauchy reals via endpoint-null
-- equivalence; the (self-referential, preserved verbatim) canonical
-- comparison isomorphism; and the final primitive-interval construction
-- summary theorem.
--
-- Cross-reference repointing: the source imports
-- `LRA.VolumeII.RealNumbers.Cauchy` and refers to it via the bare prefix
-- `Cauchy.` (resolved by Lean's ancestor-namespace search, since the old
-- `LRA.NumberSystems.RealNumbers.Cauchy` namespace shares the
-- `LRA.NumberSystems.RealNumbers` ancestor with this file's own
-- `LRA.NumberSystems.RealNumbers.PrimitiveIntervals` namespace). The
-- migrated Cauchy construction keeps that exact namespace
-- (`LRA.NumberSystems.RealNumbers.Cauchy`), so only the `import` below was
-- repointed to the migrated location; every `Cauchy.` qualified name in
-- `persistent_overlap_iff_endpoint_null` below is unchanged from the
-- source and resolves to `LRA.NumberSystems.RealNumbers.Cauchy.*`.

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.Laws
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Models

variable (rational_model : RationalModel)

/-- Theorem 8.1: persistent overlap equals endpoint-null equivalence.

Mathematical statement (Lean): `theorem persistent_overlap_iff_endpoint_null (absolute_value_data : Cauchy.RationalMetricData rational_model) (first second : Representative rational_model) : equivalent rational_model first second ↔ Cauchy.is_null rational_model absolute_value_data (fun in...`.

*Proof status:* proof pending


Logical form:

```lean
theorem persistent_overlap_iff_endpoint_null
    (absolute_value_data : Cauchy.RationalMetricData rational_model)
    (first second : Representative rational_model) :
    equivalent rational_model first second ↔
      Cauchy.is_null rational_model absolute_value_data
        (fun index =>
          rational_model.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint)
```
-/
theorem persistent_overlap_iff_endpoint_null
    (absolute_value_data : Cauchy.RationalMetricData rational_model)
    (first second : Representative rational_model) :
    equivalent rational_model first second ↔
      Cauchy.is_null rational_model absolute_value_data
        (fun index =>
          rational_model.signature.Subtraction
            (first.interval index).left_endpoint
            (second.interval index).left_endpoint) := by
  sorry


/-- Corollary 8.2: canonical comparison with the Cantor endpoint construction.

Mathematical statement (Lean): `theorem canonical_comparison_isomorphism_exists : ∃ comparison : Carrier rational_model → Carrier rational_model, (∀ value, comparison value = value) ∧ (∀ rational, comparison (rational_embedding rational_model rational) = rational_embedding rational_model...`.

*Proof status:* proof pending


Logical form:

```lean
theorem canonical_comparison_isomorphism_exists :
    ∃ comparison : Carrier rational_model → Carrier rational_model,
      (∀ value, comparison value = value) ∧
      (∀ rational,
        comparison (rational_embedding rational_model rational) =
          rational_embedding rational_model rational)
```
-/
theorem canonical_comparison_isomorphism_exists :
    ∃ comparison : Carrier rational_model → Carrier rational_model,
      (∀ value, comparison value = value) ∧
      (∀ rational,
        comparison (rational_embedding rational_model rational) =
          rational_embedding rational_model rational) := by
  sorry


/-- Proposition expressing the final primitive-interval construction theorem.

Mathematical statement (Lean): `def PrimitiveIntervalConstructionOfReals : Prop`.


Logical form:

```lean
def PrimitiveIntervalConstructionOfReals : Prop :=
  OrderedFieldStructure rational_model ∧
  LeastUpperBoundProperty rational_model ∧
  (∀ first second : Representative rational_model,
    equivalent rational_model first second ↔
      equivalent rational_model first second)
```
-/
def PrimitiveIntervalConstructionOfReals : Prop :=
  OrderedFieldStructure rational_model ∧
  LeastUpperBoundProperty rational_model ∧
  (∀ first second : Representative rational_model,
    equivalent rational_model first second ↔
      equivalent rational_model first second)


/-- Theorem 9.1: final primitive-interval construction theorem.

Mathematical statement (Lean): `theorem primitive_interval_construction_of_reals : PrimitiveIntervalConstructionOfReals rational_model`.

*Proof status:* proof pending


Logical form:

```lean
theorem primitive_interval_construction_of_reals :
    PrimitiveIntervalConstructionOfReals rational_model
```
-/
theorem primitive_interval_construction_of_reals :
    PrimitiveIntervalConstructionOfReals rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
