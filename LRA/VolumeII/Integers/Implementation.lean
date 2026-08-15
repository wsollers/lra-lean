-- LRA/VolumeII/Integers/Implementation.lean
-- Active integer carrier selection.

import LRA.VolumeII.Integers.Polish

namespace LRA.NumberSystems.Integers

/-!
Volume II label: integers-active-implementation
Lean module: LRA.NumberSystems.Integers.Implementation
Verification status: checked switch module

The active integer implementation is now a single carrier abbreviation.
Machines (`Add`, `Mul`, `Neg`, `Sub`, `LT`, `LE`, numerals,
`HasSuccessor`, `HasPredecessor`) and law certificates travel with the
carrier type through instance search, so repointing this one `abbrev` at
another construction's carrier switches every downstream consumer --
provided that construction registers the same instance surface.

A test or example that wants a *different* construction locally does not
touch this switch at all: it simply names that construction's carrier in
its binders, and the instances resolve from the type.
-/

/-- The active integer carrier.

Logical form:

```lean
abbrev Z := Polish.TwoSidedSuccessor.Z
```
-/
abbrev Z := Polish.TwoSidedSuccessor.Z

end LRA.NumberSystems.Integers
