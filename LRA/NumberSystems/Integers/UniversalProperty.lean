import LRA.NumberSystems.Integers.Definition
import LRA.VolumeII.NumberSystems.CanonicalEmbeddings

namespace LRA.NumberSystems.Integers

open LRA.NumberSystems.Models
open LRA.NumberSystems.Models.CanonicalEmbeddings

universe u

/-- The integer number system is initial among discretely ordered integral
domains: there is a unique ordered-ring embedding into every such target.

This is derived from the numeral-generation property of `IntegerNumberSystem`;
it is not independent structure stored in the system.

Logical form:

```lean
theorem IntegerInitiality
    (integerSystem : IntegerNumberSystem.{u})
    (target : DiscretelyOrderedIntegralDomainModel.{u}) :
    ∃! map : integerSystem.Model.Carrier → target.Carrier,
      EmbeddingPreservesOrderedRing
        integerSystem.Model.signature target.signature map
```
-/
theorem IntegerInitiality
    (integerSystem : IntegerNumberSystem.{u})
    (target : DiscretelyOrderedIntegralDomainModel.{u}) :
    ∃! map : integerSystem.Model.Carrier → target.Carrier,
      EmbeddingPreservesOrderedRing
        integerSystem.Model.signature target.signature map := by
  sorry

end LRA.NumberSystems.Integers
