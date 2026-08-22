-- LRA/NumberSystems/Integers/Constructions/Tao/Instances.lean
-- Registration into the system's interfaces.

import LRA.NumberSystems.Integers.Constructions.Tao.Behavior
import LRA.NumberSystems.Integers.Definition

namespace LRA.NumberSystems.Integers.Tao

/-- The Tao formal-difference quotient realizes the generic discretely ordered
integral-domain interface.

Logical form:

```lean
theorem TaoIntegersFormDiscretelyOrderedIntegralDomain
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier wholeData
```
-/
theorem TaoIntegersFormDiscretelyOrderedIntegralDomain
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier wholeData := by
  sorry

/-- The Tao formal-difference construction realizes the actual integer number
system: every quotient class is represented by a canonical integer numeral.

Logical form:

```lean
theorem TaoRealizesIntegerNumberSystem
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier wholeData
```
-/
theorem TaoRealizesIntegerNumberSystem
    (wholeData : WholeNumberArithmeticForTaoFormalDifferences) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier wholeData := by
  sorry

end LRA.NumberSystems.Integers.Tao
