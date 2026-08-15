-- LRA/VolumeII/Integers/Construction/Model.lean
-- Active integer construction as a Volume I first-order algebraic model.

import LRA.VolumeI.Algebra.Models
import LRA.VolumeII.Integers.Implementation

namespace LRA.NumberSystems.Integers

open LRA.Algebra.Models

/-!
Volume II label: active-integer-model
Lean module: LRA.NumberSystems.Integers.Construction.Model
Verification status: checked definitions (model laws are the carrier's
certificate instances)

The active carrier's instances make it a first-order model of each
arithmetic language through the generic builders, and a bundled
`IntegerModel` through `ofCarrier` — no hand-assembled operation
bundles, no separate law record.
-/

/-- The active integers as a first-order model of the ordered-ring
language.

Logical form:

```lean
def integerNumbersModel :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  orderedRingFirstOrderModel Z
```
-/
def integerNumbersModel :
    LRA.Logic.FirstOrder.Model OrderedRingFirstOrderSignature :=
  orderedRingFirstOrderModel Z

/-- The active integers as a model of the additive ordered language
`(0, 1, +, <)`, the language underlying Presburger arithmetic.

Logical form:

```lean
def additiveOrderedIntegerModel :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  additiveOrderedFirstOrderModel Z
```
-/
def additiveOrderedIntegerModel :
    LRA.Logic.FirstOrder.Model AdditiveOrderedFirstOrderSignature :=
  additiveOrderedFirstOrderModel Z

/-- The active integers as a model of the arithmetic ring language
`(0, 1, +, *)`.

Logical form:

```lean
def arithmeticRingIntegerModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel Z
```
-/
def arithmeticRingIntegerModel :
    LRA.Logic.FirstOrder.Model ArithmeticRingFirstOrderSignature :=
  arithmeticRingFirstOrderModel Z

/-- The active integers as the bundled integer model used by the
number-system tower. The certificates travel with the carrier.

Logical form:

```lean
def integerNumberSystemModel : LRA.Algebra.Models.IntegerModel :=
  IntegerModel.ofCarrier Z
```
-/
def integerNumberSystemModel : LRA.Algebra.Models.IntegerModel :=
  IntegerModel.ofCarrier Z

/-- The derived operation bundle of the active integer model, for
signature-level consumers.

Logical form:

```lean
def integerNumbersSignature : OrderedRingSignature :=
  integerNumberSystemModel.signature
```
-/
def integerNumbersSignature : OrderedRingSignature :=
  integerNumberSystemModel.signature

end LRA.NumberSystems.Integers
