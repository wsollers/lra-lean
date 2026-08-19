-- LRA/NumberSystems/RealNumbers/Extended.lean
-- The extended real line over a selected real model.

import LRA.NumberSystems.RealNumbers.Extensions

namespace LRA.NumberSystems.RealNumbers.Extended
open LRA.NumberSystems.Models

/-!
Volume II label: extended-real-line
Lean module: LRA.NumberSystems.RealNumbers.Extended
Source: docs/number-systems/gpt-08c-extended-RealNumbers.md
Verification status: statement-accepted-proof-pending

Moved from `LRA.VolumeII.RealNumbers.Extended`, content unchanged except
its import of `Extensions` repointed to the new location. Top-level,
system-wide file, not part of any single construction's §1.6.1 pipeline.
-/

open LRA.NumberSystems.Models

/--
**[Inductive — ExtendedReal]**

Mathematical statement (Lean): `inductive ExtendedReal (real_model : RealModel)`.


Logical form:

```lean
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity
```
-/
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

/--
**[Def — nonstrict_order]**

Mathematical statement (Lean): `def nonstrict_order (real_model : RealModel) : ExtendedReal real_model → ExtendedReal real_model → Prop | .negativeInfinity, _ => True | _, .positiveInfinity => True | .finite first, .finite second => real_model.signature.le first second | _, _...`.


Logical form:

```lean
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
  | _, _ => False
```
-/
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
  | _, _ => False

/--
**[Def — negation]**

Mathematical statement (Lean): `def negation (real_model : RealModel) : ExtendedReal real_model → ExtendedReal real_model | .negativeInfinity => .positiveInfinity | .positiveInfinity => .negativeInfinity | .finite value => .finite (real_model.signature.neg value) def supremum (real_m...`.


Logical form:

```lean
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)
```
-/
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)

/--
**[Def — supremum]**

Mathematical statement (Lean): `def supremum (real_model : RealModel) (subset : ExtendedReal real_model → Prop) (candidate : ExtendedReal real_model) : Prop`.


Logical form:

```lean
def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound
```
-/
def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound

/--
**[Theorem — every_subset_has_supremum]**

Mathematical statement (Lean): `theorem every_subset_has_supremum (real_model : RealModel) (subset : ExtendedReal real_model → Prop) : ∃ candidate : ExtendedReal real_model, supremum real_model subset candidate`.

*Proof status:* proof pending


Logical form:

```lean
theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate
```
-/
theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate := by
  sorry

/--
**[Structure — PartialOperation]**

Mathematical statement (Lean): `structure PartialOperation (real_model : RealModel) (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model)`.


Logical form:

```lean
structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)
```
-/
structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)

end LRA.NumberSystems.RealNumbers.Extended
