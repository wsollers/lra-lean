import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Closure

open LRA.Map.Operation

universe u v w

/--
**[Definition — UnaryClosedUnder]**

Closure of a unary operation from an intended domain predicate into an intended
codomain predicate.

Logical form:

```lean
def UnaryClosedUnder {Domain : Type u} {Codomain : Type v}
    (domainCarrier : Domain -> Prop)
    (codomainCarrier : Codomain -> Prop)
    (operation : UnaryOperation Domain Codomain) : Prop
```
-/
def UnaryClosedUnder {Domain : Type u} {Codomain : Type v}
    (domainCarrier : Domain -> Prop)
    (codomainCarrier : Codomain -> Prop)
    (operation : UnaryOperation Domain Codomain) : Prop :=
  forall input, domainCarrier input -> codomainCarrier (operation input)

/--
**[Definition — BinaryClosedUnder]**

Closure of a binary operation from intended left and right input predicates
into an intended result predicate.

Logical form:

```lean
def BinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left -> Prop)
    (rightCarrier : Right -> Prop)
    (resultCarrier : Codomain -> Prop)
    (operation : BinaryOperation Left Right Codomain) : Prop
```
-/
def BinaryClosedUnder {Left : Type u} {Right : Type v} {Codomain : Type w}
    (leftCarrier : Left -> Prop)
    (rightCarrier : Right -> Prop)
    (resultCarrier : Codomain -> Prop)
    (operation : BinaryOperation Left Right Codomain) : Prop :=
  forall left right,
    leftCarrier left -> rightCarrier right -> resultCarrier (operation left right)

/--
**[Definition — BinaryEndoClosedOn]**

Closure of a binary endo-operation on a represented subcarrier of an ambient
carrier.

Logical form:

```lean
def BinaryEndoClosedOn {Ambient : Type u}
    (carrier : Ambient -> Prop)
    (operation : BinaryEndoOperation Ambient) : Prop
```
-/
def BinaryEndoClosedOn {Ambient : Type u}
    (carrier : Ambient -> Prop)
    (operation : BinaryEndoOperation Ambient) : Prop :=
  BinaryClosedUnder carrier carrier carrier operation

end LRA.Map.Operation.Laws.Closure
