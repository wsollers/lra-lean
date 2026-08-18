import LRA.VolumeI.Function.Typed.Definition

namespace LRA.Function.Restriction

open LRA.Function

universe u v w

/--
**[Definition — RestrictsTo]**

`restricted` is the restriction of `original` along an inclusion-like map.

Logical form:

```lean
def RestrictsTo {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : Function Subdomain Codomain)
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) : Prop
```
-/
def RestrictsTo {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : Function Subdomain Codomain)
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) : Prop :=
  forall input, restricted input = original (inclusion input)

/--
**[Definition — Restriction]**

Restrict a typed function along an inclusion-like map.

Logical form:

```lean
def Restriction {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    Function Subdomain Codomain
```
-/
def Restriction {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : Function Domain Codomain)
    (inclusion : Function Subdomain Domain) :
    Function Subdomain Codomain :=
  fun input => original (inclusion input)

end LRA.Function.Restriction
