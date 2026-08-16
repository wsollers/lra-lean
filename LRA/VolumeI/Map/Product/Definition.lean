import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Product

open LRA.Map.Typed

universe u v w x

/--
A map out of a Cartesian product domain.
-/
abbrev ProductDomainMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  TypedMap (Left × Right) Codomain

/--
A curried binary map.
-/
abbrev BinaryMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Left -> Right -> Codomain

/--
Curry a map out of a product domain.
-/
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainMap Left Right Codomain) :
    BinaryMap Left Right Codomain :=
  fun left right => map (left, right)

/--
Uncurry a binary map into a map out of a product domain.
-/
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryMap Left Right Codomain) :
    ProductDomainMap Left Right Codomain :=
  fun pair => map pair.1 pair.2

/--
The first projection from a product.
-/
def FirstProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Left :=
  fun pair => pair.1

/--
The second projection from a product.
-/
def SecondProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Right :=
  fun pair => pair.2

/--
Pair two maps with common domain into a product-codomain map.
-/
def ProductMap {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : TypedMap Domain LeftCodomain)
    (right : TypedMap Domain RightCodomain) :
    TypedMap Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Map.Product
