-- LRA/VolumeII/Integers.lean
-- Volume II integer construction root.

import LRA.VolumeII.Integers.Interface
import LRA.VolumeII.Integers.Laws
import LRA.VolumeII.Integers.QuotientOrderedPairs
import LRA.VolumeII.Integers.Tao
import LRA.VolumeII.Integers.Mendelson
import LRA.VolumeII.Integers.Implementation
import LRA.VolumeII.Integers.Conversion
import LRA.VolumeII.Integers.ArithmeticTests
import LRA.VolumeII.Integers.ConversionTests

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-formalization-root
Lean module: LRA.VolumeII.Integers
Verification status: checked aggregation module

The integer formalization is organized by source variant:

* `Tao`
* `Mendelson`
* `Pfefer`
* `Polish`

`Implementation` selects the active implementation for shared examples and
arithmetic smoke tests.
-/

end Integers
end VolumeII
end LRA
