import LRA.VolumeI.Function.Typed.Definition
import LRA.VolumeI.Set.Interface.Membership

namespace LRA.Function.Inverse

open LRA.Function
open LRA.Set

universe u v w₁ w₂

/--
**[Definition — LeftInverse]**

`inverse` is a left inverse of `map` when it recovers every input after
applying `map`.

Logical form:

```lean
def LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop
```
-/
def LeftInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop :=
  forall input, inverse (map input) = input

/--
**[Definition — RightInverse]**

`inverse` is a right inverse of `map` when `map` recovers every codomain value
after applying `inverse`.

Logical form:

```lean
def RightInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop
```
-/
def RightInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop :=
  forall output, map (inverse output) = output

/--
**[Definition — LeftInverseOn]**

`inverse` is a left inverse of `map` on a specified source set.

Logical form:

```lean
def LeftInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet) : Prop
```
-/
def LeftInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} [Membership Domain DomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet) : Prop :=
  forall input, input ∈ source -> inverse (map input) = input

/--
**[Definition — RightInverseOn]**

`inverse` is a right inverse of `map` on a specified target set.

Logical form:

```lean
def RightInverseOn {Domain : Type u} {Codomain : Type v}
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (target : CodomainSet) : Prop
```
-/
def RightInverseOn {Domain : Type u} {Codomain : Type v}
    {CodomainSet : Type w₂} [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (target : CodomainSet) : Prop :=
  forall output, output ∈ target -> map (inverse output) = output

/--
**[Definition — TwoSidedInverse]**

`inverse` is a two-sided inverse of `map`.

Logical form:

```lean
def TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop
```
-/
def TwoSidedInverse {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain) : Prop :=
  LeftInverse map inverse /\ RightInverse map inverse

/--
**[Definition — IsInverseFunction]**

`inverse` is the inverse function of `map` when it is a two-sided inverse.
This is deliberately a predicate: the preimage operation exists for every
map, while an inverse function exists only after bijectivity data.

Logical form:

```lean
def IsInverseFunction {Domain : Type u} {Codomain : Type v}
    (inverse : Function Codomain Domain)
    (map : Function Domain Codomain) : Prop
```
-/
def IsInverseFunction {Domain : Type u} {Codomain : Type v}
    (inverse : Function Codomain Domain)
    (map : Function Domain Codomain) : Prop :=
  TwoSidedInverse map inverse

/--
**[Definition — TwoSidedInverseOn]**

`inverse` is a two-sided inverse between a source set and a target set.
When the target is the direct image of the source, this is the ordinary
"inverse on the image" convention.

Logical form:

```lean
def TwoSidedInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet) : Prop
```
-/
def TwoSidedInverseOn {Domain : Type u} {Codomain : Type v}
    {DomainSet : Type w₁} {CodomainSet : Type w₂}
    [Membership Domain DomainSet] [Membership Codomain CodomainSet]
    (map : Function Domain Codomain)
    (inverse : Function Codomain Domain)
    (source : DomainSet)
    (target : CodomainSet) : Prop :=
  LeftInverseOn map inverse source /\ RightInverseOn map inverse target

/--
**[Structure — InverseFunction]**

A packaged inverse function: a map in the reverse direction together with the
two cancellation laws.

Logical form:

```lean
structure InverseFunction {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain)
```
-/
structure InverseFunction {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) where
  inverse : Function Codomain Domain
  isInverse : IsInverseFunction inverse map

end LRA.Function.Inverse
