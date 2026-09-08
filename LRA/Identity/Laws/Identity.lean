import LRA.Identity.Interface.Identity
import LRA.Identity.Interface.ModelTheory.LStructure

namespace LRA.Identity

universe u

variable {Carrier : Type u} [IdentityRelation Carrier]

/-- Identity is reflexive.

Logical form: `Ident x x`.
-/
theorem IdentRfl (x : Carrier) : Ident x x := by
  sorry

/-- Prose-name alias for identity reflexivity.

Logical form: `Ident x x`.
-/
theorem IdentRefl (x : Carrier) : Ident x x := by
  sorry

/-- Identity is symmetric.

Logical form: `Ident x y -> Ident y x`.
-/
theorem IdentSymmetric {x y : Carrier} (h : Ident x y) : Ident y x := by
  sorry

/-- Identity is transitive.

Logical form: `Ident x y -> Ident y z -> Ident x z`.
-/
theorem IdentTransitive {x y z : Carrier}
    (hxy : Ident x y) (hyz : Ident y z) : Ident x z := by
  sorry

/-- Identical objects satisfy exactly the same properties.

Logical form:
```lean
Ident x y -> forall Property, Property x <-> Property y
```
-/
theorem IndiscernibilityOfIdenticals {x y : Carrier} (h : Ident x y) :
    forall Property : Carrier -> Prop, Property x <-> Property y := by
  sorry

/-- Objects satisfying exactly the same properties are identical.

Logical form:
```lean
(forall Property, Property x <-> Property y) -> Ident x y
```
-/
theorem IdentityOfIndiscernibles {x y : Carrier}
    (h : forall Property : Carrier -> Prop, Property x <-> Property y) :
    Ident x y := by
  sorry

/-- Identity is equivalent to agreement on every property.

Logical form:
```lean
Ident x y <-> forall Property, Property x <-> Property y
```
-/
theorem IdentLeibnizIff {x y : Carrier} :
    Ident x y <-> forall Property : Carrier -> Prop, Property x <-> Property y := by
  sorry

/-- An unrestricted identity relation is the equality diagonal. -/
theorem IsIdentityRelation.IsDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} (h : IsIdentityRelation R) :
    forall left right, R left right <-> EqualityDiagonal Carrier left right := by
  sorry

/-- Unrestricted identity is pointwise equivalent to ambient equality. -/
theorem IsIdentityRelation.IffForallIffEquality {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> forall left right, R left right <-> left = right := by
  sorry

/-- Unrestricted identity is exactly the equality diagonal. -/
theorem IsIdentityRelation.IffEqualityDiagonal {Carrier : Type u}
    {R : Carrier -> Carrier -> Prop} :
    IsIdentityRelation R <-> R = EqualityDiagonal Carrier := by
  sorry

/-- Every equality structure interprets identity as the diagonal relation. -/
theorem EqualityStructure.IsDiagonal (S : EqualityStructure.{u}) :
    forall left right,
      S.equalityInterpretation left right <-> EqualityDiagonal S.Carrier left right := by
  sorry

end LRA.Identity
