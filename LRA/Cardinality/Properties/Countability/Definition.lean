-- LRA/Cardinality/Properties/Countability/Definition.lean
-- Countability, stated through domination by / equinumerosity with Nat.

import LRA.Cardinality.Theorems

namespace LRA.Cardinality

universe u

/-!
Volume I label: cardinality-countability-definition
Lean module: LRA.Cardinality.Properties.Countability.Definition
Verification status: checked definitions

Enderton's convention: "countable" includes the finite case
(`Dominates A Nat`, i.e. an injection into `Nat` -- a finite type
trivially has one), and "countably infinite" is the proper-infinite
sub-case (`Equinumerous A Nat`). This supersedes the ad-hoc
`Countable`/`Uncountable` pair in
`LRA.VolumeII.NumberSystems.Models.CharacteristicCardinality` (an
existence-of-an-enumeration statement, equivalent in spirit but stated
independently before this subject existed) and the inline
uncountability statement in
`LRA.Analysis.StructureOfRealLine.Cardinality` -- neither is touched by
this pass, but both are now candidates to restate against this
canonical vocabulary.
-/

/-- **[Definition — IsCountable]**

`A` is countable when it is dominated by `Nat`: finite or countably
infinite.

Logical form:

```lean
def IsCountable (A : Type u) : Prop :=
  Dominates A Nat
```
-/
def IsCountable (A : Type u) : Prop :=
  Dominates A Nat

/-- **[Definition — IsCountablyInfinite]**

`A` is countably infinite when it is equinumerous with `Nat`.

Logical form:

```lean
def IsCountablyInfinite (A : Type u) : Prop :=
  Equinumerous A Nat
```
-/
def IsCountablyInfinite (A : Type u) : Prop :=
  Equinumerous A Nat

/-- **[Definition — IsUncountable]**

`A` is uncountable when it is not countable.

Logical form:

```lean
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A
```
-/
def IsUncountable (A : Type u) : Prop :=
  ¬ IsCountable A

end LRA.Cardinality
