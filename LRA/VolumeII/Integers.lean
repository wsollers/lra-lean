-- LRA/VolumeII/Integers.lean
-- Volume II integer construction root.

import LRA.NumberSystems.Integers.Constructions
import LRA.VolumeII.Integers.Implementation
import LRA.VolumeII.Integers.Conversion
import LRA.VolumeII.Integers.ArithmeticTests
import LRA.VolumeII.Integers.ConversionTests
import LRA.VolumeII.Integers.Construction

namespace LRA.NumberSystems.Integers

/-!
Volume II label: integers-formalization-root
Lean module: LRA.NumberSystems.Integers
Verification status: checked aggregation module

The constructions (`Tao`, `Mendelson`, `Pfefer`, `Polish`,
`QuotientOrderedPairs`) promoted to `LRA.NumberSystems.Integers.Constructions`
per §7.7; imported here via that single aggregate. `Implementation` selects
the active implementation for shared examples and arithmetic smoke tests --
per §7.7 step 5 the switch itself, and this file's dependence on it, stay
in place until every consumer binds a carrier through the interface
instead.
-/

end LRA.NumberSystems.Integers
