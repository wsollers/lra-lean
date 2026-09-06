import LRA.Identity.Interface.Equality
import LRA.Identity.Laws.Primitive

namespace LRA.Identity

universe u

variable {Carrier : Type u}

/--
`EqualRfl` is the in-house reflexivity theorem for equality.

Logical form:

```lean
theorem EqualRfl [EqualityRelation Carrier] (x : Carrier) : Equal x x
```
-/
theorem EqualRfl [EqualityRelation Carrier] (x : Carrier) : Equal x x := by
  sorry

/--
`EqualRefl` is a prose-name alias for `EqualRfl`.

Logical form:

```lean
theorem EqualRefl [EqualityRelation Carrier] (x : Carrier) : Equal x x
```
-/
theorem EqualRefl [EqualityRelation Carrier] (x : Carrier) : Equal x x := by
  sorry

/--
`EqualSymmetric` states symmetry of in-house equality.

Logical form:

```lean
theorem EqualSymmetric [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y) : Equal y x
```
-/
theorem EqualSymmetric [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y) : Equal y x := by
  sorry

/--
`EqualTransitive` states transitivity of in-house equality.

Logical form:

```lean
theorem EqualTransitive [EqualityRelation Carrier]
    {x y z : Carrier} (hxy : Equal x y) (hyz : Equal y z) : Equal x z
```
-/
theorem EqualTransitive [EqualityRelation Carrier]
    {x y z : Carrier} (hxy : Equal x y) (hyz : Equal y z) : Equal x z := by
  sorry

/--
`EqualLeibnizIff` states the bidirectional Leibniz law for in-house equality.

Logical form:

```lean
theorem EqualLeibnizIff [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y)
    (Property : Carrier → Prop) : Property x ↔ Property y
```
-/
theorem EqualLeibnizIff [EqualityRelation Carrier]
    {x y : Carrier} (h : Equal x y)
    (Property : Carrier → Prop) : Property x ↔ Property y := by
  sorry

/--
`IdentIsDiagonal` identifies in-house identity with in-house equality. It does
not mention Lean's native equality.

Logical form:

```lean
theorem IdentIsDiagonal [IdentityRelation Carrier] [EqualityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ Equal x y
```
-/
theorem IdentIsDiagonal [IdentityRelation Carrier] [EqualityRelation Carrier]
    (x y : Carrier) : Ident x y ↔ Equal x y := by
  sorry

end LRA.Identity
