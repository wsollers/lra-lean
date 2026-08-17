import LRA.Function.Definition

namespace LRA.Function

universe u v w

/-- A typed function whose source is a Cartesian product. -/
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  TypedFunction (Left × Right) Codomain

/-- A curried binary typed function. -/
abbrev BinaryTypedFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

/-- Curry a typed function whose source is a product. -/
def CurryTyped {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryTypedFunction Left Right Codomain :=
  fun left right => function (left, right)

/-- Uncurry a binary typed function. -/
def UncurryTyped {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryTypedFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2

/-- First projection from a Cartesian product. -/
def FirstProjectionTyped (Left : Type u) (Right : Type v) :
    TypedFunction (Left × Right) Left :=
  fun pair => pair.1

/-- Second projection from a Cartesian product. -/
def SecondProjectionTyped (Left : Type u) (Right : Type v) :
    TypedFunction (Left × Right) Right :=
  fun pair => pair.2

/-- Pair two typed functions with common source into a product-valued function. -/
def ProductTyped
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : TypedFunction Domain LeftCodomain)
    (right : TypedFunction Domain RightCodomain) :
    TypedFunction Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Function
