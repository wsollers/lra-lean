-- LRA/VolumeI/UniversalAlgebra/Models/Construction.lean
-- Construction selectors and coherent number-system tower.

import LRA.VolumeI.UniversalAlgebra.Models.Models

namespace LRA.UniversalAlgebra.Models

/-!
Volume II label: configurable-number-system-construction
Lean module: LRA.UniversalAlgebra.Models.Construction
Blueprint label: configurable-number-system-construction
Verification status: statement-accepted-proof-pending
-/

/--
**[Definition — Integer Construction Choice]**

Logical form:

```lean
inductive IntegerConstruction where
  | canonical
  | tao
  | mendelson
```
-/
inductive IntegerConstruction where
  | canonical
  | tao
  | mendelson

/--
**[Definition — Rational Construction Choice]**

Logical form:

```lean
inductive RationalConstruction where
  | canonical
  | reduced
  | fractionField
```
-/
inductive RationalConstruction where
  | canonical
  | reduced
  | fractionField

/--
**[Definition — Real Construction Choice]**

Logical form:

```lean
inductive RealConstruction where
  | dedekind
  | cauchy
  | cantor
  | intervalQuotient
  | dyadic
```
-/
inductive RealConstruction where
  | dedekind
  | cauchy
  | cantor
  | intervalQuotient
  | dyadic

/--
**[Definition — Number-System Construction Configuration]**

Logical form:

```lean
structure NumberSystemConstruction where
  integer : IntegerConstruction
  rational : RationalConstruction
  real : RealConstruction
```
-/
structure NumberSystemConstruction where
  integer : IntegerConstruction
  rational : RationalConstruction
  real : RealConstruction

/--
**[Definition — Canonical Number-System Construction]**

The canonical tower uses the canonical integer quotient, the canonical fraction
quotient, and Dedekind cuts.

Logical form:

```lean
def CanonicalConstruction : NumberSystemConstruction where
  integer := .canonical
  rational := .canonical
  real := .dedekind
```
-/
def CanonicalConstruction : NumberSystemConstruction where
  integer := .canonical
  rational := .canonical
  real := .dedekind

/--
**[Definition — Number-System Tower]**

A tower stores an integer model, a rational extension of it, and a real
extension of the selected rational model.

Logical form:

```lean
structure NumberSystemTower where
  IntegerModel : IntegerModel
  RationalExtension : RationalExtension IntegerModel
  RealExtension :
    RealExtension RationalExtension.RationalModel
```
-/
structure NumberSystemTower where
  IntegerModel : IntegerModel
  RationalExtension : RationalExtension IntegerModel
  RealExtension :
    RealExtension RationalExtension.RationalModel

/--
**[Theorem — Every Supported Construction Configuration Builds a Tower]**

The statement is intentionally proof-pending. Each branch is discharged by the
corresponding concrete construction module.

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

/--
**[Definition — Build a Number-System Tower]**

This noncomputable selector returns the bundled tower for a configuration.
Different branches may have different carrier types hidden inside the model
bundles.

Logical form:

```lean
noncomputable def BuildNumberSystemTower
    (construction : NumberSystemConstruction) :
    NumberSystemTower :=
  Classical.choice (NumberSystemTowerExists construction)
```
-/
noncomputable def BuildNumberSystemTower
    (construction : NumberSystemConstruction) :
    NumberSystemTower :=
  Classical.choice (NumberSystemTowerExists construction)

/--
**[Definition — Default Number-System Tower]**

Logical form:

```lean
noncomputable def DefaultTower : NumberSystemTower :=
  BuildNumberSystemTower CanonicalConstruction
```
-/
noncomputable def DefaultTower : NumberSystemTower :=
  BuildNumberSystemTower CanonicalConstruction

/--
**[Proposition — The Default Real Construction Is Dedekind]**

Logical form:

```lean
theorem DefaultRealConstructionIsDedekind :
    CanonicalConstruction.real = RealConstruction.dedekind
```
-/
theorem DefaultRealConstructionIsDedekind :
    CanonicalConstruction.real = RealConstruction.dedekind := by
  rfl

/--
**[Corollary — The Default Tower Uses the Canonical Rational Construction]**

Logical form:

```lean
theorem DefaultRationalConstructionIsCanonical :
    CanonicalConstruction.rational = RationalConstruction.canonical
```
-/
theorem DefaultRationalConstructionIsCanonical :
    CanonicalConstruction.rational = RationalConstruction.canonical := by
  rfl

end LRA.UniversalAlgebra.Models
