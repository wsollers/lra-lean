import LRA.VolumeI.Function.Typed.Definition
import LRA.VolumeI.Operations.Definition

namespace LRA.Function.Product

open LRA.Function

universe u v w x

/--
**[Abbreviation — ProductDomainFunction]**

A map out of a Cartesian product domain.

Logical form:

```lean
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w)
```
-/
abbrev ProductDomainFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  Function (Left × Right) Codomain

/--
**[Abbreviation — BinaryFunction]**

A curried binary map.

Logical form:

```lean
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w)
```
-/
abbrev BinaryFunction
    (Left : Type u) (Right : Type v) (Codomain : Type w) :=
  LRA.Operation.HeterogeneousBinaryOperation Left Right Codomain

/--
**[Definition — Curry]**

Curry a map out of a product domain.

Logical form:

```lean
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain
```
-/
def Curry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : ProductDomainFunction Left Right Codomain) :
    BinaryFunction Left Right Codomain :=
  fun left right => map (left, right)

/--
**[Definition — Uncurry]**

Uncurry a binary map into a map out of a product domain.

Logical form:

```lean
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain
```
-/
def Uncurry {Left : Type u} {Right : Type v} {Codomain : Type w}
    (map : BinaryFunction Left Right Codomain) :
    ProductDomainFunction Left Right Codomain :=
  fun pair => map pair.1 pair.2

/--
**[Definition — FirstProjection]**

The first projection from a product.

Logical form:

```lean
def FirstProjection (Left : Type u) (Right : Type v) :
    Function (Left × Right) Left
```
-/
def FirstProjection (Left : Type u) (Right : Type v) :
    Function (Left × Right) Left :=
  fun pair => pair.1

/--
**[Definition — SecondProjection]**

The second projection from a product.

Logical form:

```lean
def SecondProjection (Left : Type u) (Right : Type v) :
    Function (Left × Right) Right
```
-/
def SecondProjection (Left : Type u) (Right : Type v) :
    Function (Left × Right) Right :=
  fun pair => pair.2

/--
**[Definition — ProductFunction]**

Pair two maps with common domain into a product-codomain map.

Logical form:

```lean
def ProductFunction {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : Function Domain LeftCodomain)
    (right : Function Domain RightCodomain) :
    Function Domain (LeftCodomain × RightCodomain)
```
-/
def ProductFunction {Domain : Type u} {LeftCodomain : Type v}
    {RightCodomain : Type w}
    (left : Function Domain LeftCodomain)
    (right : Function Domain RightCodomain) :
    Function Domain (LeftCodomain × RightCodomain) :=
  fun input => (left input, right input)

end LRA.Function.Product
