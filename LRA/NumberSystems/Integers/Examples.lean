import LRA.NumberSystems.Integers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Integers.Examples

open LRA.NumberSystems.Models
open LRA.NumberSystems.Integers

/-- Mathlib's `Int` carrier realizes the actual integer number system.

Logical form:

```lean
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem
```
-/
noncomputable def MathlibIntegerNumberSystem : IntegerNumberSystem where
  Model := mathlibDiscretelyOrderedIntegralDomainModel
  EveryElementIsIntegerNumeral := by
    sorry

end LRA.NumberSystems.Integers.Examples
