-- LRA/VolumeII/NumberSystems/Construction.lean
-- Construction selectors and coherent number-system tower.

import LRA.VolumeII.NumberSystems.Models

namespace LRA
namespace VolumeII
namespace NumberSystems

/-!
Volume II label: configurable-number-system-construction
Lean module: LRA.VolumeII.NumberSystems.Construction
Blueprint label: configurable-number-system-construction
Verification status: statement-accepted-proof-pending
-/

/-- **[Definition — Integer Construction Choice]** -/
inductive IntegerConstruction where
  | canonical
  | tao
  | mendelson

/-- **[Definition — Rational Construction Choice]** -/
inductive RationalConstruction where
  | canonical
  | reduced
  | fractionField

/-- **[Definition — Real Construction Choice]** -/
inductive RealConstruction where
  | dedekind
  | cauchy
  | cantor
  | intervalQuotient
  | dyadic

/--
**[Definition — Number-System Construction Configuration]**
-/
structure NumberSystemConstruction where
  integer : IntegerConstruction
  rational : RationalConstruction
  real : RealConstruction

/--
**[Definition — Canonical Number-System Construction]**

The canonical tower uses the canonical integer quotient, the canonical fraction
quotient, and Dedekind cuts.
-/
def canonical_construction : NumberSystemConstruction where
  integer := .canonical
  rational := .canonical
  real := .dedekind

/--
**[Definition — Number-System Tower]**

A tower stores an integer model, a rational extension of it, and a real
extension of the selected rational model.
-/
structure NumberSystemTower where
  integer_model : IntegerModel
  rational_extension : RationalExtension integer_model
  real_extension :
    RealExtension rational_extension.rational_model

/--
**[Theorem — Every Supported Construction Configuration Builds a Tower]**

The statement is intentionally proof-pending. Each branch is discharged by the
corresponding concrete construction module.
-/
theorem number_system_tower_exists
    (construction : NumberSystemConstruction) :
    ∃ tower : NumberSystemTower, True := by
  sorry

/--
**[Definition — Build a Number-System Tower]**

This noncomputable selector returns the bundled tower for a configuration.
Different branches may have different carrier types hidden inside the model
bundles.
-/
noncomputable def build_number_system_tower
    (construction : NumberSystemConstruction) :
    NumberSystemTower := by
  sorry

/-- **[Definition — Default Number-System Tower]** -/
noncomputable def default_tower : NumberSystemTower :=
  build_number_system_tower canonical_construction

/--
**[Proposition — The Default Real Construction Is Dedekind]**
-/
theorem default_real_construction_is_dedekind :
    canonical_construction.real = RealConstruction.dedekind := by
  rfl

/--
**[Corollary — The Default Tower Uses the Canonical Rational Construction]**
-/
theorem default_rational_construction_is_canonical :
    canonical_construction.rational = RationalConstruction.canonical := by
  rfl

end NumberSystems
end VolumeII
end LRA
