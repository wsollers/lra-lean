namespace LRA.Identity

universe u

/--
`LeibnizLaw` TODO

Predicate logic:

  (left = right) → ∀ property : Carrier -> Prop, property left ↔ property right end LRA.Identity

Predicate logic (unfolded):

  ∀ {Carrier : Type u} {left right : Carrier}, left = right → ∀ (property : Carrier → Prop), property left ↔ property right

Logical form (Lean):

```lean
axiom LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, constructor, .mp, .mpr

-/
axiom LeibnizLaw {Carrier : Type u} {left right : Carrier}
    (ObjectsAreIdentical : left = right) :
    ∀ property : Carrier -> Prop, property left ↔ property right

end LRA.Identity
