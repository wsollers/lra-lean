-- LRA/NumberSystems/Integers/Constructions/Mendelson/Instances.lean
-- Registration into the system's interfaces.

import LRA.NumberSystems.Integers.Constructions.Mendelson.Behavior
import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.PeanoSystem.Definition

namespace LRA.NumberSystems.Integers.Mendelson

/-- The positive classes recover a model of the generic `PeanoSystem`
interface.

Logical form:

```lean
theorem PositiveClassesRecoverNaturalNumberModel
    (positiveData : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element
```
-/
theorem PositiveClassesRecoverNaturalNumberModel
    (positiveData : PositiveNaturalPairData) :
    ∃ (Element : Type) (SetObject : Type)
      (_ : Membership Element SetObject)
      (_ : LRA.NumberSystems.PeanoSystem.PeanoSystem Element SetObject),
      Nonempty Element := by
  sorry

/-- The Mendelson quotient realizes the generic discretely ordered
integral-domain interface.

Logical form:

```lean
theorem MendelsonIntegersFormDiscretelyOrderedIntegralDomain
    (positiveData : PositiveNaturalPairData) :
    ∃ model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier positiveData
```
-/
theorem MendelsonIntegersFormDiscretelyOrderedIntegralDomain
    (positiveData : PositiveNaturalPairData) :
    ∃ model : LRA.NumberSystems.Models.DiscretelyOrderedIntegralDomainModel,
      model.Carrier = Carrier positiveData := by
  sorry

/-- The Mendelson construction realizes the actual integer number system.

Logical form:

```lean
theorem MendelsonRealizesIntegerNumberSystem
    (positiveData : PositiveNaturalPairData) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier positiveData
```
-/
theorem MendelsonRealizesIntegerNumberSystem
    (positiveData : PositiveNaturalPairData) :
    ∃ integerSystem : LRA.NumberSystems.Integers.IntegerNumberSystem,
      integerSystem.Model.Carrier = Carrier positiveData := by
  sorry

end LRA.NumberSystems.Integers.Mendelson
