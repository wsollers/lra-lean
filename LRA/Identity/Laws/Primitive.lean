import LRA.Identity.Interface.Identity

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

/--
`IdentRfl` is the in-house reflexivity theorem for identity.

Logical form:

```lean
theorem IdentRfl (x : Carrier) : Ident x x
```
-/
theorem IdentRfl (x : Carrier) : Ident x x := by
  sorry

/--
`IdentRefl` is a prose-name alias for `IdentRfl`.

Logical form:

```lean
theorem IdentRefl (x : Carrier) : Ident x x
```
-/
theorem IdentRefl (x : Carrier) : Ident x x := by
  sorry

/--
`IdentSymmetric` states symmetry of in-house identity.

Logical form:

```lean
theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x
```
-/
theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x := by
  sorry

/--
`IdentTransitive` states transitivity of in-house identity.

Logical form:

```lean
theorem IdentTransitive {x y z : Carrier}
    (hxy : Ident x y) (hyz : Ident y z) : Ident x z
```
-/
theorem IdentTransitive {x y z : Carrier}
    (hxy : Ident x y) (hyz : Ident y z) : Ident x z := by
  sorry

/--
`IdentLeibnizIff` states the bidirectional Leibniz law for in-house identity.

Logical form:

```lean
theorem IdentLeibnizIff {x y : Carrier} (h : Ident x y)
    (Property : Carrier → Prop) : Property x ↔ Property y
```
-/
theorem IdentLeibnizIff {x y : Carrier} (h : Ident x y)
    (Property : Carrier → Prop) : Property x ↔ Property y := by
  sorry

end LRA.Identity
