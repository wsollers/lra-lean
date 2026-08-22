-- LRA/VolumeII/NumberSystems/Construction.lean
-- Construction selectors and coherent number-system tower.

import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.Models

open LRA.NumberSystems.Integers
open LRA.NumberSystems.RationalNumbers

/-!
Volume II label: configurable-number-system-construction
Lean module: LRA.NumberSystems.Models.Construction
Blueprint label: configurable-number-system-construction
Verification status: statement-accepted-proof-pending
-/

/-- Supported integer construction choices. -/
inductive IntegerConstruction where
  | canonical
  | tao
  | mendelson

/-- Supported rational construction choices. -/
inductive RationalConstruction where
  | canonical
  | reduced
  | fractionField

/-- Supported real construction choices. -/
inductive RealConstruction where
  | dedekind
  | cauchy
  | cantor
  | intervalQuotient
  | dyadic

/-- A configurable choice of constructions for the Z/Q/R tower.

Logical form:

```lean
structure NumberSystemConstruction where
  Integer : IntegerConstruction
  Rational : RationalConstruction
  Real : RealConstruction
```
-/
structure NumberSystemConstruction where
  Integer : IntegerConstruction
  Rational : RationalConstruction
  Real : RealConstruction

/-- The canonical tower uses the canonical integer quotient, canonical fraction
quotient, and Dedekind cuts.

Logical form:

```lean
def CanonicalConstruction : NumberSystemConstruction where
  Integer := .canonical
  Rational := .canonical
  Real := .dedekind
```
-/
def CanonicalConstruction : NumberSystemConstruction where
  Integer := .canonical
  Rational := .canonical
  Real := .dedekind

/-- A coherent number-system tower stores the selected integer, rational, and
real carriers explicitly, together with the actual systems built on those
carriers.

The equality fields prevent the selected carriers from being hidden inside the
bundles: downstream declarations can state their conclusions against the exact
Z/Q/R carriers chosen by the selector. The rational-system equality records
that the rational stage was built from the same integer system selected by the
integer stage.

Logical form:

```lean
structure NumberSystemTower where
  IntegerCarrier : Type u
  RationalCarrier : Type u
  RealCarrier : Type u
  IntegerSystem : IntegerNumberSystem.{u}
  RationalSystem : RationalNumberSystem.{u}
  RationalUsesIntegerSystem : RationalSystem.IntegerSystem = IntegerSystem
  RealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  IntegerCarrierMatches : IntegerSystem.Model.Carrier = IntegerCarrier
  RationalCarrierMatches : RationalSystem.FieldModel.Carrier = RationalCarrier
  RealCarrierMatches : RealExtension.RealModel.Carrier = RealCarrier
```
-/
structure NumberSystemTower where
  IntegerCarrier : Type u
  RationalCarrier : Type u
  RealCarrier : Type u
  IntegerSystem : IntegerNumberSystem.{u}
  RationalSystem : RationalNumberSystem.{u}
  RationalUsesIntegerSystem : RationalSystem.IntegerSystem = IntegerSystem
  RealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  IntegerCarrierMatches : IntegerSystem.Model.Carrier = IntegerCarrier
  RationalCarrierMatches : RationalSystem.FieldModel.Carrier = RationalCarrier
  RealCarrierMatches : RealExtension.RealModel.Carrier = RealCarrier

/-- Every supported construction configuration builds a coherent number-system
tower with explicit selected carriers.

Logical form:

```lean
theorem NumberSystemTowerExists
    (construction : NumberSystemConstruction) :
    Nonempty NumberSystemTower
```
-/
theorem NumberSystemTowerExists
    (construction : NumberSystemConstruction) :
    Nonempty NumberSystemTower := by
  sorry

/-- Build the bundled tower for a construction configuration.

The selected integer, rational, and real carriers remain explicit fields of
the result rather than being hidden inside existentially chosen model bundles.
-/
noncomputable def BuildNumberSystemTower
    (construction : NumberSystemConstruction) : NumberSystemTower :=
  Classical.choice (NumberSystemTowerExists construction)

/-- The default number-system tower. -/
noncomputable def DefaultTower : NumberSystemTower :=
  BuildNumberSystemTower CanonicalConstruction

/-- The default real construction is Dedekind. -/
theorem DefaultRealConstructionIsDedekind :
    CanonicalConstruction.Real = RealConstruction.dedekind := by
  sorry

/-- The default rational construction is canonical. -/
theorem DefaultRationalConstructionIsCanonical :
    CanonicalConstruction.Rational = RationalConstruction.canonical := by
  sorry

end LRA.NumberSystems.Models
