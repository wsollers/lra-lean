namespace LRA.Identity

universe u

/--
`IdentityRelation` is the generic identity API. Downstream code should speak in
terms of `Ident`, not directly in terms of Lean's native `Eq`.
-/
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y

export IdentityRelation (Ident IdentReflexive IdentLeibniz)

end LRA.Identity
