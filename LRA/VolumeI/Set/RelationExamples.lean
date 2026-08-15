-- LRA/VolumeI/Set/RelationExamples.lean
-- Cross-backend smoke tests: relations-as-sets resolve from the types.

import LRA.VolumeI.Set.Interface
import LRA.VolumeI.Set.Enderton
import LRA.VolumeI.Set.LRASet
import LRA.VolumeI.Set.MathlibPredicateSet
import LRA.VolumeI.Set.MathlibZFSet
import LRA.VolumeI.Set.MathlibZFSet.Pairing

namespace LRA.Set.RelationExamples

open LRA.Set

universe u

/-!
Volume I label: set-relation-examples
Lean module: LRA.Set.RelationExamples
Verification status: checked elaboration smoke tests

One statement, four backends: the same fluent relation vocabulary
resolves the pairing and the set operations from the carrier types
alone. `x ∈ f ∪ g` — a pair in a union of function-sets — works on
Enderton sets (Kuratowski pairs, internal), `ZFSet` (Mathlib's
Kuratowski pairs), `LRASet (α × β)` and `Set (α × β)` (type-level
pairs) with no switches and no plumbing.
-/

/-! ## The same gluing statement, once per backend -/

/-- Enderton: relations are sets of Kuratowski pairs — everything is a
`Set`. -/
example (f g : Enderton.Set) (a b : Enderton.Set) :
    Relates (f ∪ g) a b ↔ Relates f a b ∨ Relates g a b :=
  RelatesUnion f g a b

/-- ZFSet: Mathlib's Kuratowski pairs, same statement. -/
example (f g : ZFSet) (a b : ZFSet) :
    Relates (f ∪ g) a b ↔ Relates f a b ∨ Relates g a b :=
  RelatesUnion f g a b

/-- LRASet: relations live at the pair element type `Alpha × Beta`. -/
example {Alpha Beta : Type u} (f g : LRASet.LRASet (Alpha × Beta))
    (a : Alpha) (b : Beta) :
    Relates (f ∪ g) a b ↔ Relates f a b ∨ Relates g a b :=
  RelatesUnion f g a b

/-- Mathlib `Set`: this is exactly Mathlib's own `SetRel α β`. -/
example {Alpha Beta : Type u} (f g : _root_.Set (Alpha × Beta))
    (a : Alpha) (b : Beta) :
    Relates (f ∪ g) a b ↔ Relates f a b ∨ Relates g a b :=
  RelatesUnion f g a b

/-! ## The ambient-relative constructions elaborate per backend -/

noncomputable example (R ambient : Enderton.Set) : Enderton.Set :=
  DomainOf Enderton.Set R ambient

noncomputable example (R ambient : ZFSet) : ZFSet :=
  RangeOf ZFSet R ambient

example {Alpha Beta : Type u}
    (R : LRASet.LRASet (Alpha × Beta)) (D : LRASet.LRASet Alpha)
    (ambient : LRASet.LRASet Beta) : LRASet.LRASet Beta :=
  ImageOf R D ambient

example {Alpha Beta : Type u}
    (R : _root_.Set (Alpha × Beta)) (b : Beta)
    (ambient : _root_.Set Alpha) : _root_.Set Alpha :=
  FiberOf R b ambient

/-- Restriction carves from the relation itself — no ambient. -/
example {Alpha Beta : Type u}
    (R : _root_.Set (Alpha × Beta)) (D : _root_.Set Alpha) :
    _root_.Set (Alpha × Beta) :=
  RestrictionOf Beta R D

/-- The extension order on partial functions is the subset order on
their graphs. -/
example {Alpha Beta : Type u} (f g : _root_.Set (Alpha × Beta)) : Prop :=
  IsExtensionOf g f

/-- Inverse, into the reversed pair type. -/
example {Alpha Beta : Type u}
    (R : _root_.Set (Alpha × Beta))
    (ambient : _root_.Set (Beta × Alpha)) : _root_.Set (Beta × Alpha) :=
  InverseOf Alpha Beta R ambient

/-- A type-level function reified as a graph set. -/
example {Alpha Beta : Type u} (map : Alpha → Beta)
    (ambient : _root_.Set (Alpha × Beta)) : _root_.Set (Alpha × Beta) :=
  GraphSetOf map ambient

/-- Function-hood is one statement across backends. -/
example (f : Enderton.Set) : Prop :=
  IsFunctionalSet Enderton.Set Enderton.Set f

example {Alpha Beta : Type u} (f : _root_.Set (Alpha × Beta)) : Prop :=
  IsFunctionalSet Alpha Beta f

end LRA.Set.RelationExamples
