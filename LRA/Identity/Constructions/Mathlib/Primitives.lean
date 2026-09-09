namespace LRA.Identity.Constructions.Mathlib

universe u

/--
`NativeIdentity` TODO

Predicate logic:

  ∀ {Carrier : Type u} (a a_1 : Carrier), a = a_1

Predicate logic (unfolded):

  ∀ {Carrier : Type u} (a a_1 : Carrier), a = a_1

Logical form (Lean):

```lean
abbrev NativeIdentity {Carrier : Type u} : Carrier -> Carrier -> Prop := Eq
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: intro, unfold

-/
abbrev NativeIdentity {Carrier : Type u} : Carrier -> Carrier -> Prop := Eq

end LRA.Identity.Constructions.Mathlib
