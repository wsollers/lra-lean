import LRA.VolumeI.Function.Composition.Definition
import LRA.VolumeI.Function.Identity.Definition

namespace LRA.Function.Composition

open LRA.Function
open LRA.Function.Identity

universe u v w x

/--
**[Theorem — CompositionApply]**

Evaluation of composition.

Logical form:

```lean
theorem CompositionApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : Function Middle Codomain)
    (first : Function Domain Middle)
    (input : Domain) :
    Composition second first input = second (first input)
```
-/
theorem CompositionApply
    {Domain : Type u} {Middle : Type v} {Codomain : Type w}
    (second : Function Middle Codomain)
    (first : Function Domain Middle)
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
    (map : Function Domain Codomain) :
    Composition (IdentityFunction Codomain) map = map
```
-/
theorem CompositionLeftIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Composition (IdentityFunction Codomain) map = map := by
  sorry
/--
**[Theorem — CompositionRightIdentity]**

Right identity law for composition.

Logical form:

```lean
theorem CompositionRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Composition map (IdentityFunction Domain) = map
```
-/
theorem CompositionRightIdentity
    {Domain : Type u} {Codomain : Type v}
    (map : Function Domain Codomain) :
    Composition map (IdentityFunction Domain) = map := by
  sorry
/--
**[Theorem — CompositionAssociative]**

Associativity of composition.

Logical form:

```lean
theorem CompositionAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : Function C D)
    (second : Function B C)
    (first : Function A B) :
    Composition third (Composition second first) =
      Composition (Composition third second) first
```
-/
theorem CompositionAssociative
    {A : Type u} {B : Type v} {C : Type w} {D : Type x}
    (third : Function C D)
    (second : Function B C)
    (first : Function A B) :
    Composition third (Composition second first) =
      Composition (Composition third second) first := by
  sorry
end LRA.Function.Composition
