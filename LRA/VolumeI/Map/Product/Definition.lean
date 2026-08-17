import LRA.Function.Operations.Product.Definition
import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Product

open LRA.Map.Typed
universe u v w

/-- Historical spelling for a function out of a product domain. -/
abbrev ProductDomainMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function.ProductDomainFunction Left Right Codomain

/-- Historical spelling for a curried binary function. -/
abbrev BinaryMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function.BinaryTypedFunction Left Right Codomain

/-- Historical spelling for currying. -/
abbrev Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainMap Left Right Codomain) :
    BinaryMap Left Right Codomain :=
  LRA.Function.CurryTyped map

/-- Historical spelling for uncurrying. -/
abbrev Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryMap Left Right Codomain) :
    ProductDomainMap Left Right Codomain :=
  LRA.Function.UncurryTyped map

/-- Historical spelling for the first projection. -/
abbrev FirstProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Left :=
  LRA.Function.FirstProjectionTyped Left Right

/-- Historical spelling for the second projection. -/
abbrev SecondProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Right :=
  LRA.Function.SecondProjectionTyped Left Right

/-- Historical spelling for pairing two functions into a product-valued function. -/
abbrev ProductMap {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : TypedMap Domain LeftCodomain)
    (right : TypedMap Domain RightCodomain) :
    TypedMap Domain (LeftCodomain × RightCodomain) :=
  LRA.Function.ProductTyped left right

end LRA.Map.Product
