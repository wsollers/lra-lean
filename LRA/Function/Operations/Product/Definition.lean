import LRA.Function.Definition

namespace LRA.Function

universe u v w

/-- A function whose source is a Cartesian product. -/
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Function (Left × Right) Codomain

/-- A curried binary function. -/
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left → Right → Codomain

/-- Curry a function whose source is a product. -/
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => function (left, right)

/-- Uncurry a binary function. -/
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (function : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => function pair.1 pair.2

/-- First projection from a Cartesian product. -/
def FirstProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Left :=
  fun pair => pair.1

/-- Second projection from a Cartesian product. -/
def SecondProjection (Left : Type u) (Right : Type v) :
    LRA.Function (Left × Right) Right :=
  fun pair => pair.2

/-- Pair two functions with a common source into a product-valued function. -/
def Product
    {Domain : Type u} {LeftCodomain : Type v} {RightCodomain : Type w}
    (left : LRA.Function Domain LeftCodomain)
    (right : LRA.Function Domain RightCodomain) :
    LRA.Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Function
