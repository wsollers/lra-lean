-- LRA/VolumeII/Reals/Extended.lean
-- The extended real line over a selected real model.

import LRA.VolumeII.RealNumbers.Extensions

namespace LRA.VolumeII.RealNumbers.Extended
open LRA.VolumeI.Algebra.Models

/-!
Volume II label: extended-real-line
Lean module: LRA.VolumeII.RealNumbers.Extended
Source: docs/number-systems/gpt-08c-extended-RealNumbers.md
Verification status: statement-accepted-proof-pending
-/

open LRA.VolumeI.Algebra.Models

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

Mathematical statement (Lean): `def nonstrict_order (real_model : RealModel) : ExtendedReal real_model → ExtendedReal real_model → Prop | .negativeInfinity, _ => True | _, .positiveInfinity => True | .finite first, .finite second => real_model.signature.NonstrictOrder first second | _, _...`.


Logical form:

```lean
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.NonstrictOrder first second
  | _, _ => False
```
-/
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.NonstrictOrder first second
  | _, _ => False

/--
**[Def — negation]**

Mathematical statement (Lean): `def negation (real_model : RealModel) : ExtendedReal real_model → ExtendedReal real_model | .negativeInfinity => .positiveInfinity | .positiveInfinity => .negativeInfinity | .finite value => .finite (real_model.signature.negation value) def supremum (real_m...`.


Logical form:

```lean
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.negation value)
```
-/
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.negation value)

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
          .finite (real_model.signature.addition first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiplication first second)
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
          .finite (real_model.signature.addition first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiplication first second)

end LRA.VolumeII.RealNumbers.Extended
