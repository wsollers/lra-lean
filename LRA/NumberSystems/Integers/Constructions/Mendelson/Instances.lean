-- LRA/NumberSystems/Integers/Constructions/Mendelson/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.Integers.Constructions.Mendelson.Behavior
import LRA.NumberSystems.PeanoSystem.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers.Mendelson

/--
**[Theorem — positive_classes_recover_natural_number_model]**

The positive classes recover a model of the generic `PeanoSystem`
interface -- this is Mendelson's own realization obligation (§1.6.2), not a
comparison against another integer construction.

*Proof status:* proof pending

Logical form:

```lean
theorem positive_classes_recover_natural_number_model
    (positive_data : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element
```
-/
theorem positive_classes_recover_natural_number_model
    (positive_data : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element := by
  sorry

/--
**[Theorem — mendelson_integers_form_ordered_ring]**

The quotient realizes the generic ring-and-order `DiscretelyOrderedIntegralDomainModel` interface.

*Proof status:* proof pending

Logical form:

```lean
theorem mendelson_integers_form_ordered_ring
    (positive_data : PositiveNaturalPairData) :
    ∃ integer_model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      integer_model.signature.carrier = Carrier positive_data
```
-/
theorem mendelson_integers_form_ordered_ring
    (positive_data : PositiveNaturalPairData) :
    ∃ integer_model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      integer_model.signature.carrier = Carrier positive_data := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
