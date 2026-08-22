import LRA.NumberSystems.RationalNumbers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

universe u

/-- A real extension of an actual rational number system.

The generic `CofinalRealExtension` records only a cofinal embedding from an
arbitrary densely ordered field into a complete ordered field. This wrapper
specializes that generic relationship to the field carried by a genuine
`RationalNumberSystem`, so downstream declarations using the words "rational"
and "irrational" cannot be instantiated with an unrelated dense subfield.

Logical form:

```lean
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel
```
-/
structure RationalRealExtension
    (RationalSystem : RationalNumberSystem.{u})
    extends CofinalRealExtension RationalSystem.FieldModel

/-- The selected embedding of the rational carrier into the real carrier.

Logical form:

```lean
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal
```
-/
def RationalRealExtension.EmbedRational
    {RationalSystem : RationalNumberSystem.{u}}
    (Extension : RationalRealExtension RationalSystem) :
    RationalSystem.FieldModel.Carrier → Extension.RealModel.Carrier :=
  Extension.DenseOrderedFieldEmbedding.ToReal

end LRA.NumberSystems.RealNumbers
