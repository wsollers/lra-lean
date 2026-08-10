/-!
The primitive axioms of identity.
-/

namespace LRA.VolumeI.Identity

universe u

/-- TeX label: `ax:equality-reflexivity`.
Every object is equal to itself. -/
axiom EqualityReflexivity {Carrier : Type u} (element : Carrier) :
    element = element

/-- TeX label: `ax:leibniz-law`.
Identical objects satisfy exactly the same properties. -/
axiom LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right

end LRA.VolumeI.Identity
