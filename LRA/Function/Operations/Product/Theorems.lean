import LRA.Function.Operations.Product.Definition

namespace LRA.Function

universe u v w

                                                                       
theorem CurryAfterUncurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    Curry (Uncurry function) = function := by
  sorry

                                                                               
theorem UncurryAfterCurry
    {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    Uncurry (Curry function) = function := by
  sorry

                                                                       
theorem FirstProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    FirstProjection LeftCodomain RightCodomain (Product left right input) =
      left input := by
  sorry

                                                                         
theorem SecondProjectionProductValue
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain)
    (input : Domain) :
    SecondProjection LeftCodomain RightCodomain (Product left right input) =
      right input := by
  sorry

end LRA.Function
