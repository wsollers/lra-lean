-- LRA/NumberSystems/Integers/Constructions/Tao/Instances.lean
-- Registration into the system's interface.

import LRA.NumberSystems.Integers.Constructions.Tao.Behavior
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers.Tao

/--
**[Theorem — tao_integers_form_ordered_ring]**

The quotient realizes the generic ring-and-order `DiscretelyOrderedIntegralDomainModel` interface.

*Proof status:* proof pending

Logical form:

```lean
theorem tao_integers_form_ordered_ring
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integer_model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      integer_model.signature.carrier = Carrier whole_data
```
-/
theorem tao_integers_form_ordered_ring
    (whole_data : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integer_model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      integer_model.signature.carrier = Carrier whole_data := by
  sorry

end LRA.NumberSystems.Integers.Tao
