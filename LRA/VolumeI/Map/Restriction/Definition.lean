import LRA.VolumeI.Map.Typed.Definition

namespace LRA.Map.Restriction

open LRA.Map.Typed

universe u v w

/--
**[Definition — RestrictsTo]**

`restricted` is the restriction of `original` along an inclusion-like map.

Logical form:

```lean
def RestrictsTo {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : TypedMap Subdomain Codomain)
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) : Prop
```
-/
def RestrictsTo {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (restricted : TypedMap Subdomain Codomain)
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) : Prop :=
  forall input, restricted input = original (inclusion input)

/--
**[Definition — Restriction]**

Restrict a typed map along an inclusion-like map.

Logical form:

```lean
def Restriction {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    TypedMap Subdomain Codomain
```
-/
def Restriction {Subdomain : Type u} {Domain : Type v} {Codomain : Type w}
    (original : TypedMap Domain Codomain)
    (inclusion : TypedMap Subdomain Domain) :
    TypedMap Subdomain Codomain :=
  fun input => original (inclusion input)

end LRA.Map.Restriction
