-- LRA/VolumeII/NumberSystems/Construction.lean
-- Construction selectors and coherent number-system tower.

import LRA.NumberSystems.Integers.Definition
import LRA.NumberSystems.RationalNumbers.Definition
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

/-- A coherent number-system tower stores actual integer and rational number
systems, together with a real extension of the selected rational field.

The equality field records that the rational construction was built from the
same integer system selected by the integer stage.

Logical form:

```lean
structure NumberSystemTower where
  IntegerSystem : IntegerNumberSystem
  RationalSystem : RationalNumberSystem
  RationalUsesIntegerSystem : RationalSystem.IntegerSystem = IntegerSystem
  CofinalRealExtension : CofinalRealExtension RationalSystem.FieldModel
```
-/
structure NumberSystemTower where
  IntegerSystem : IntegerNumberSystem
  RationalSystem : RationalNumberSystem
  RationalUsesIntegerSystem : RationalSystem.IntegerSystem = IntegerSystem
  CofinalRealExtension : CofinalRealExtension RationalSystem.FieldModel

/-- Every supported construction configuration builds a coherent number-system
tower.

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

/-- Build the bundled tower for a construction configuration. -/
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
