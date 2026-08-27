namespace LRA.Identity

universe u

structure EqualityTheory (Carrier : Type u) : Prop where
  reflexivity : ∀ x : Carrier, x = x
  leibniz :
    ∀ x y : Carrier,
      x = y ->
        ∀ property : Carrier -> Prop, property x ↔ property y

end LRA.Identity
