import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Identity.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed
open LRA.Map.Identity

universe u v w x

/--
**[Theorem — ComposeApply]**

Evaluation of composition.

Logical form:

```lean
theorem ComposeApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle)
    (input : Domain) :
    Compose second first input = second (first input)
```
-/
theorem ComposeApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle)
    (input : Domain) :
    Compose second first input = second (first input) := by
  sorry
/--
**[Theorem — ComposeLeftIdentity]**

Left identity law for composition.

Logical form:

```lean
theorem ComposeLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose (IdentityMap Codomain) map = map
```
-/
theorem ComposeLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose (IdentityMap Codomain) map = map := by
  sorry
/--
**[Theorem — ComposeRightIdentity]**

Right identity law for composition.

Logical form:

```lean
theorem ComposeRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose map (IdentityMap Domain) = map
```
-/
theorem ComposeRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Compose map (IdentityMap Domain) = map := by
  sorry
/--
**[Theorem — ComposeAssociative]**

Associativity of composition.

Logical form:

```lean
theorem ComposeAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : TypedMap C D)
    (second : TypedMap B C)
    (first : TypedMap A B) :
    Compose third (Compose second first) =
      Compose (Compose third second) first
```
-/
theorem ComposeAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : TypedMap C D)
    (second : TypedMap B C)
    (first : TypedMap A B) :
    Compose third (Compose second first) =
      Compose (Compose third second) first := by
  sorry
end LRA.Map.Composition
