import LRA.Function.Operations.Product.Definition

namespace LRA.Function

universe u v w

/-- Currying after uncurrying recovers the original binary function. -/
theorem CurryAfterUncurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    Curry (Uncurry function) = function := by
  sorry

/-- Uncurrying after currying recovers the original product-domain function. -/
theorem UncurryAfterCurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    Uncurry (Curry function) = function := by
  sorry

/-- The first projection of a paired function is the left component. -/
theorem FirstProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    FirstProjection LeftCodomain RightCodomain (Product left right input) =
      left input := by
  sorry

/-- The second projection of a paired function is the right component. -/
theorem SecondProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    SecondProjection LeftCodomain RightCodomain (Product left right input) =
      right input := by
  sorry

end LRA.Function
