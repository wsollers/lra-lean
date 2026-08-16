import LRA.VolumeI.Map.Typed.Definition
import LRA.VolumeI.Operations.Definition

namespace LRA.Map.Product

open LRA.Map.Typed

universe u v w x

/--
**[Abbreviation — ProductDomainMap]**

A map out of a Cartesian product domain.

Logical form:

```lean
abbrev ProductDomainMap
    (Left : Type u) (Right : Type v) (Codomain : Type w)
```
-/
abbrev ProductDomainMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  TypedMap (Left × Right) Codomain

/--
**[Abbreviation — BinaryMap]**

A curried binary map.

Logical form:

```lean
abbrev BinaryMap
    (Left : Type u) (Right : Type v) (Codomain : Type w)
```
-/
abbrev BinaryMap
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain

/--
**[Definition — Curry]**

Curry a map out of a product domain.

Logical form:

```lean
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainMap Left Right Codomain) :
    BinaryMap Left Right Codomain
```
-/
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainMap Left Right Codomain) :
    BinaryMap Left Right Codomain :=
  fun left right => map (left, right)

/--
**[Definition — Uncurry]**

Uncurry a binary map into a map out of a product domain.

Logical form:

```lean
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryMap Left Right Codomain) :
    ProductDomainMap Left Right Codomain
```
-/
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryMap Left Right Codomain) :
    ProductDomainMap Left Right Codomain :=
  fun pair => map pair.1 pair.2

/--
**[Definition — FirstProjection]**

The first projection from a product.

Logical form:

```lean
def FirstProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Left
```
-/
def FirstProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Left :=
  fun pair => pair.1

/--
**[Definition — SecondProjection]**

The second projection from a product.

Logical form:

```lean
def SecondProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Right
```
-/
def SecondProjection (Left : Type u) (Right : Type v) :
    TypedMap (Left × Right) Right :=
  fun pair => pair.2

/--
**[Definition — ProductMap]**

Pair two maps with common domain into a product-codomain map.

Logical form:

```lean
def ProductMap {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : TypedMap Domain LeftCodomain)
    (right : TypedMap Domain RightCodomain) :
    TypedMap Domain (LeftCodomain × RightCodomain)
```
-/
def ProductMap {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : TypedMap Domain LeftCodomain)
    (right : TypedMap Domain RightCodomain) :
    TypedMap Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Map.Product
