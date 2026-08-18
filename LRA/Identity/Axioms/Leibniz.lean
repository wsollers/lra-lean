namespace LRA.Identity

universe u

/-- TeX label: `ax:leibniz-law`.

Identical objects satisfy exactly the same properties.
-/
axiom LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right

end LRA.Identity
