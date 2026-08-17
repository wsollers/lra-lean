import LRA.Function.Operations.Product.Definition

namespace LRA.Function

universe u v w

/-- Currying after uncurrying recovers the original binary function. -/
theorem CurryAfterUncurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryTypedFunction Left Right Codomain) :
    CurryTyped (UncurryTyped function) = function := by
  sorry

/-- Uncurrying after currying recovers the original product-domain function. -/
theorem UncurryAfterCurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    UncurryTyped (CurryTyped function) = function := by
  sorry

/-- The first projection of a paired function is the left component. -/
theorem FirstProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : TypedFunction Domain LeftCodomain)
    (right : TypedFunction Domain RightCodomain)
    (input : Domain) :
    FirstProjectionTyped LeftCodomain RightCodomain (ProductTyped left right input) =
      left input := by
  sorry

/-- The second projection of a paired function is the right component. -/
theorem SecondProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : TypedFunction Domain LeftCodomain)
    (right : TypedFunction Domain RightCodomain)
    (input : Domain) :
    SecondProjectionTyped LeftCodomain RightCodomain (ProductTyped left right input) =
      right input := by
  sorry

end LRA.Function
