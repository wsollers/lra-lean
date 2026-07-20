namespace LRA.Foundation

universe u

/--
The canonical project vocabulary for an underlying Lean universe of
mathematical objects.
-/
abbrev LRACarrier := Type u

/--
A project set is a predicate over an already chosen carrier.
-/
abbrev LRASet (α : LRACarrier) := α → Prop

/-- Short compatibility name for `LRACarrier`. -/
abbrev Carrier := LRACarrier

/-- Short compatibility name for `LRASet`. -/
abbrev Set := LRASet

end LRA.Foundation
