import LRA.VolumeI.Map.Composition.Definition
import LRA.VolumeI.Map.Identity.Definition

namespace LRA.Map.Composition

open LRA.Map.Typed
open LRA.Map.Identity

universe u v w x

/--
**[Theorem — CompositionApply]**

Evaluation of composition.

Logical form:

```lean
theorem CompositionApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle)
    (input : Domain) :
    Composition second first input = second (first input)
```
-/
theorem CompositionApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : TypedMap Middle Codomain)
    (first : TypedMap Domain Middle)
    (input : Domain) :
    Composition second first input = second (first input) := by
  sorry
/--
**[Theorem — CompositionLeftIdentity]**

Left identity law for composition.

Logical form:

```lean
theorem CompositionLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Composition (IdentityMap Codomain) map = map
```
-/
theorem CompositionLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Composition (IdentityMap Codomain) map = map := by
  sorry
/--
**[Theorem — CompositionRightIdentity]**

Right identity law for composition.

Logical form:

```lean
theorem CompositionRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Composition map (IdentityMap Domain) = map
```
-/
theorem CompositionRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : TypedMap Domain Codomain) :
    Composition map (IdentityMap Domain) = map := by
  sorry
/--
**[Theorem — CompositionAssociative]**

Associativity of composition.

Logical form:

```lean
theorem CompositionAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : TypedMap C D)
    (second : TypedMap B C)
    (first : TypedMap A B) :
    Composition third (Composition second first) =
      Composition (Composition third second) first
```
-/
theorem CompositionAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : TypedMap C D)
    (second : TypedMap B C)
    (first : TypedMap A B) :
    Composition third (Composition second first) =
      Composition (Composition third second) first := by
  sorry
end LRA.Map.Composition
