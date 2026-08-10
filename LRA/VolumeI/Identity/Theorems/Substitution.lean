import LRA.VolumeI.Identity.Axioms.Axioms

/-!
Contract home for substitution laws.
-/

namespace LRA.VolumeI.Identity

universe u

/-- Leibniz substitution in the public substitution file. -/
theorem LeibnizSubstitution {Carrier : Type u} {Left Right : Carrier}
    (ObjectsAreIdentical : Left = Right)
    (Property : Carrier -> Prop) :
    Property Left ↔ Property Right :=
  LeibnizLaw ObjectsAreIdentical Property

end LRA.VolumeI.Identity
