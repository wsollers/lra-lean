-- LRA/Cardinality/Properties/Countability/Definition.lean
-- Countability, now owned by LRA.Carrier and aliased here.

import LRA.Cardinality.Theorems
import LRA.Carrier.Countability

namespace LRA.Cardinality

universe u

/-!
Volume I label: cardinality-countability-definition
Lean module: LRA.Cardinality.Properties.Countability.Definition
Verification status: checked definitions

`IsCountable`/`IsCountablyInfinite`/`IsUncountable` moved to
`LRA.Carrier` (built directly from `LRA.Function.Injective`/
`Bijective`, without routing through `Dominates`/`Equinumerous`): they
are predicates about a bare carrier type, not comparisons between two
types, so they belong beside `LRA.Function` rather than inside the
cardinal-comparison apparatus this subject owns. Aliased here rather
than restated, so there is one definition, not two that happen to
agree; `LRA.Carrier.IsCountable A` unfolds to exactly `Dominates A Nat`
and `LRA.Carrier.IsCountablyInfinite A` to exactly `Equinumerous A Nat`
once those are themselves unfolded, so nothing downstream changes
meaning.

Enderton's convention: "countable" includes the finite case (an
injection into `Nat` -- a finite type trivially has one), and
"countably infinite" is the proper-infinite sub-case (a bijection with
`Nat`). This supersedes the ad-hoc `Countable`/`Uncountable` pair in
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
infinite. See `LRA.Carrier.IsCountable`.

Logical form:

```lean
def IsCountable (A : Type u) : Prop :=
  LRA.Carrier.IsCountable A
```
-/
def IsCountable (A : Type u) : Prop :=
  LRA.Carrier.IsCountable A

/-- **[Definition — IsCountablyInfinite]**

`A` is countably infinite when it is equinumerous with `Nat`. See
`LRA.Carrier.IsCountablyInfinite`.

Logical form:

```lean
def IsCountablyInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsCountablyInfinite A
```
-/
def IsCountablyInfinite (A : Type u) : Prop :=
  LRA.Carrier.IsCountablyInfinite A

/-- **[Definition — IsUncountable]**

`A` is uncountable when it is not countable. See
`LRA.Carrier.IsUncountable`.

Logical form:

```lean
def IsUncountable (A : Type u) : Prop :=
  LRA.Carrier.IsUncountable A
```
-/
def IsUncountable (A : Type u) : Prop :=
  LRA.Carrier.IsUncountable A

end LRA.Cardinality
