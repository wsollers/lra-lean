import LRA.Identity.Constructions.Axiomatic.Axioms.SecondOrderLeibniz.Theorems

namespace LRA.Identity.Interop

universe u

open LRA.Identity

/--
`toEq` TODO

Predicate logic:

  x = y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
    h : Ident x y
  Prove
    x ≤ y → x = y

Logical form (Lean):

```lean
theorem toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem toEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : Ident x y) : x = y :=
  by sorry

/--
`ofEq` TODO

Predicate logic:

  (x = y) → Ident x y

Predicate logic (unfolded):

  Ambient
    (Carrier)
  Objects
    x y : Carrier
  Prove
    x = y → x ≤ y

Logical form (Lean):

```lean
theorem ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: TODO

-/
theorem ofEq {Carrier : Type u} [IdentityRelation Carrier] {x y : Carrier}
    (h : x = y) : Ident x y :=
  by sorry

end LRA.Identity.Interop
