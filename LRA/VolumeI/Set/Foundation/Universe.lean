universe u

namespace LRA.VolumeI.Set.Foundation

/-!
Textbook set universe.

This is the single-sorted foundation-facing layer: every element of a set is
itself a set-object in the same universe.
-/

/-- A universe of textbook sets: one type of set-objects and one membership
relation. -/
structure Universe where
  SetObject : Type u
  member : SetObject → SetObject → Prop

namespace Universe

/-- Textbook membership notation inside a chosen universe of sets. -/
instance (setUniverse : Universe.{u}) :
    Membership setUniverse.SetObject setUniverse.SetObject where
  mem setObject element := setUniverse.member element setObject

end Universe

end LRA.VolumeI.Set.Foundation
